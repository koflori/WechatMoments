//
//  NavigationBar.swift
//  Wechat
//
//  Created by ken on 2019/11/13.
//  Copyright © 2019年 ken. All rights reserved.
//

import UIKit

class NavigationBar: UIView {
    
    @IBOutlet var bgView: UIView!
    
    @IBOutlet var backBtn: UIButton!
    
    @IBOutlet var photoBtn: UIButton!
    
    @IBOutlet var label: UILabel!
    
    
    var isScrollUp:Bool = true {
        
        willSet(newScrollUp) {
            if newScrollUp == isScrollUp {
                return
            }
            if newScrollUp {
                backBtn.setImage(UIImage(named: "btn_back_white"), for: .normal)
                photoBtn.setImage(UIImage(named: "ic_add_photo_white"), for: .normal)
            }else{
                backBtn.setImage(UIImage(named: "btn_back_black"), for: .normal)
                photoBtn.setImage(UIImage(named: "ic_add_photo_black"), for: .normal)
            }
        }
        
    }
}
