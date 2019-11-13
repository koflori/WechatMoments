//
//  Request.swift
//  Wechat
//
//  Created by ken on 2019/11/12.
//  Copyright © 2019年 ken. All rights reserved.
//

import UIKit

class Request {
    
    func get(_ url: String?, success:@escaping(_ response:Any) -> Void, fail:@escaping(_ error:String) -> Void) -> Void {
        guard let urlStr = url else {
            fail("url is nil")
            return
        }
        
        guard let urlObj = URL(string: urlStr) else {
            fail("url is wrong")
            return
        }
        
        let request = URLRequest(url: urlObj, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 30)
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request) { (data, respons, error) in
            if data == nil {
                fail("data is nil")
            }else{
                let jsonData = try!JSONSerialization.jsonObject(with: data! as Data, options: .mutableContainers)
                success(jsonData)
            }
        }
        dataTask.resume()
    }
}
