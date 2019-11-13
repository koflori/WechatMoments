//
//  ListModel.swift
//  Wechat
//
//  Created by ken on 2019/11/13.
//  Copyright © 2019年 ken. All rights reserved.
//

import UIKit

class ListModel: NSObject {
    var list:Array<Any>?
    
    static func loadData(_ data: Array<Any>?) -> ListModel {
        let model = ListModel()
        if let d = data {
            model.list = d
        }
        return model
    }
}
