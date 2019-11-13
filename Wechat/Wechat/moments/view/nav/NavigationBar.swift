//
//  NavigationBar.swift
//  Wechat
//
//  Created by ken on 2019/11/13.
//  Copyright © 2019年 ken. All rights reserved.
//

import UIKit

class NavigationBar: UIView {
    
    @IBOutlet var _bgView: UIView!
    
    @IBOutlet var _backBtn: UIButton!
    
    @IBOutlet var _photoBtn: UIButton!
    
    @IBOutlet var _label: UILabel!
    
    
    var isScrollUp:Bool = true {
        
        willSet(newScrollUp) {
            if newScrollUp == isScrollUp {
                return
            }
            if newScrollUp {
                _backBtn.setImage(UIImage(named: "btn_back_white"), for: .normal)
                _photoBtn.setImage(UIImage(named: "ic_add_photo_white"), for: .normal)
            }else{
                _backBtn.setImage(UIImage(named: "btn_back_black"), for: .normal)
                _photoBtn.setImage(UIImage(named: "ic_add_photo_black"), for: .normal)
            }
        }
        
    }
}
