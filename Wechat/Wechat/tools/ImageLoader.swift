//
//  ImageLoader.swift
//  Wechat
//
//  Created by ken on 2019/11/13.
//  Copyright © 2019年 ken. All rights reserved.
//

import UIKit

class ImageLoader: NSObject {
    
    private static let instance:ImageLoader = ImageLoader()
    
    class var sharedLoader:ImageLoader {
        return instance
    }

    private var cache = NSCache<AnyObject, AnyObject>()
    
    private let filePath = "ImageCache"
    
    private func getFilePath() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true)
        return (paths.first! as NSString).appendingPathComponent(filePath)
    }
    
    func imageForUrl(urlString: String, completionHandler:@escaping (_ image: UIImage?) -> ()) {
        
        let key = urlString.md5()
        
        DispatchQueue.global().async {
            
            //cache
            let data: Data? = self.cache.object(forKey: key as AnyObject) as? Data
            if let d = data {
                let image = UIImage(data: d as Data)
                DispatchQueue.main.async {
                    completionHandler(image)
                }
                return
            }
            
            //disk
            let filePath = self.getFilePath()
            let path = self.getFilePath()+"/"+key
            if let image = UIImage(contentsOfFile: path) {
                DispatchQueue.main.async {
                    completionHandler(image)
                }
                return
            }
            
            //download
            let downloadTask: URLSessionDataTask = URLSession.shared.dataTask(with: URL(string: urlString)!, completionHandler: { (data, response, error) in
                if (error != nil) {
                    completionHandler(nil)
                    return
                }
                if data != nil {
                    let image = UIImage(data: data!)
                    self.cache.setObject(data as AnyObject, forKey: key as AnyObject)
                    
                    let fileManager = FileManager.default
                    do {
                        try fileManager.createDirectory(at: URL(fileURLWithPath: filePath), withIntermediateDirectories: true, attributes: nil)
                        try data!.write(to: URL(fileURLWithPath: path))
                    }catch{
                        print(error)
                    }
                    
                    DispatchQueue.main.async {
                        completionHandler(image)
                    }
                    return
                }
            })
            downloadTask.resume()
        }
    }
}
