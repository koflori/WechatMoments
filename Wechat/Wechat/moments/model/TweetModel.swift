//
//  TweetModel.swift
//  Wechat
//
//  Created by ken on 2019/11/13.
//  Copyright © 2019年 ken. All rights reserved.
//

import UIKit

class TweetModel: NSObject {
    
    var comments:Array<CommentModel> = Array()
    var content:String?
    var images:Array<ImageModel> = Array()
    var sender:SenderModel?
    
    static func loadData(_ data: Dictionary<String,Any>?) -> TweetModel {
        let model = TweetModel()
        if let d = data {
            if d.keys.contains("comments") {
                if let commentsArr = d["comments"] as? Array<Any> {
                    for dic in commentsArr {
                        if let dictionary = dic as? Dictionary<String,Any> {
                            let comment = CommentModel.loadData(dictionary)
                            model.comments.append(comment)
                        }
                    }
                }
            }
            
            if d.keys.contains("content") {
                model.content = d["content"] as? String
            }
            
            if d.keys.contains("images") {
                if let imagesArr = d["images"] as? Array<Any> {
                    for dic in imagesArr {
                        if let dictionary = dic as? Dictionary<String,Any> {
                            let image = ImageModel.loadData(dictionary)
                            model.images.append(image)
                        }
                    }
                }
            }
            
            if d.keys.contains("sender") {
                model.sender = SenderModel.loadData(d["sender"] as? Dictionary<String, Any>)
            }
        }
        return model
    }
}
