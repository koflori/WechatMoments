//
//  ImageModel.swift
//  Wechat
//
//  Created by ken on 2019/11/14.
//  Copyright © 2019年 ken. All rights reserved.
//

import UIKit

class ImageModel: NSObject {
    
    var url:String?
    
    static func loadData(_ data: Dictionary<String,Any>?) -> ImageModel {
        let model = ImageModel()
        if let d = data {
            if d.keys.contains("url") {
                model.url = d["url"] as? String
            }
        }
        return model
    }
}
