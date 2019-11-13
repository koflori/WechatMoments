//
//  PrefixHeader.swift
//  Wechat
//
//  Created by ken on 2019/11/13.
//  Copyright © 2019年 ken. All rights reserved.
//

import UIKit

class PrefixHeader: NSObject {
    
    static let screenWidth = Double(UIScreen.main.bounds.size.width)
    
    static let screenHeight = Double(UIScreen.main.bounds.size.height)
    
    static let navHeight = UIScreen.main.bounds.size.height >= 812 ? 88.0 : 64.0
    
    static let host = "https://thoughtworks-mobile-2018.herokuapp.com"
}
