//
//  CommentModel.swift
//  Wechat
//
//  Created by ken on 2019/11/13.
//  Copyright © 2019年 ken. All rights reserved.
//

import UIKit

class CommentModel: NSObject {
    
    var content:String?
    var sender:SenderModel?
    
    static func loadData(_ data: Dictionary<String,Any>?) -> CommentModel {
        let model = CommentModel()
        if let d = data {
            if d.keys.contains("content") {
                model.content = d["content"] as? String
            }
            
            if d.keys.contains("sender") {
                model.sender = SenderModel.loadData(d["sender"] as? Dictionary<String, Any>)
            }
        }
        return model
    }
}
