//
//  UserModel.swift
//  Wechat
//
//  Created by ken on 2019/11/13.
//  Copyright © 2019年 ken. All rights reserved.
//

import UIKit

class UserModel: NSObject {
    
    var avatarUrl:String?
    var profileImgUrl:String?
    var nickname:String?
    var username:String?
    
    static func loadData(_ data: Dictionary<String,Any>?) -> UserModel {
        let model = UserModel()
        if let d = data {
            model.avatarUrl = d["avatar"] as? String
            model.profileImgUrl = d["profile-image"] as? String
            model.nickname = d["nick"] as? String
            model.username = d["username"] as? String
        }
        return model
    }
    
}
