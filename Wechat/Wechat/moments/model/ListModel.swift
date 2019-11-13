//
//  ListModel.swift
//  Wechat
//
//  Created by ken on 2019/11/13.
//  Copyright © 2019年 ken. All rights reserved.
//

import UIKit

class ListModel: NSObject {
    
    var list:Array<TweetModel> = Array()
    
    static func loadData(_ data: Array<Any>?) -> ListModel {
        let model = ListModel()
        if let d = data {
            for dic in d {
                if let dictionary = dic as? Dictionary<String,Any> {
                    let tweet = TweetModel.loadData(dictionary)
                    model.list.append(tweet)
                }
            }
        }
        return model
    }
}
