//
//  SenderModel.swift
//  Wechat
//
//  Created by ken on 2019/11/14.
//  Copyright © 2019年 ken. All rights reserved.
//

import UIKit

class SenderModel: NSObject {
    
    var avatar:String?
    var nick:String?
    var username:String?

    static func loadData(_ data: Dictionary<String,Any>?) -> SenderModel {
        let model = SenderModel()
        if let d = data {
            if d.keys.contains("avatar") {
                model.avatar = d["avatar"] as? String
            }
            
            if d.keys.contains("nick") {
                model.nick = d["nick"] as? String
            }
            
            if d.keys.contains("username") {
                model.nick = d["username"] as? String
            }
        }
        return model
    }
}
