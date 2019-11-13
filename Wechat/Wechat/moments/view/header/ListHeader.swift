//
//  ListHeader.swift
//  Wechat
//
//  Created by ken on 2019/11/13.
//  Copyright © 2019年 ken. All rights reserved.
//

import UIKit

class ListHeader: UIView {

    @IBOutlet var profile:UIButton!
    @IBOutlet var avatar:UIButton!
    @IBOutlet var username:UILabel!

    func loadModel(_ model: UserModel?) {
        if let m = model {
            if let url = m.avatarUrl {
                ImageLoader.sharedLoader.imageForUrl(urlString: url) { (image) in
                    self.avatar.setImage(image, for: .normal)
                }
            }
            
            if let url = m.profileImgUrl {
                ImageLoader.sharedLoader.imageForUrl(urlString: url) { (image) in
                     self.profile.setImage(image, for: .normal)
                }
            }
            
            if let name = m.username {
                username.text = name
            }
        }
    }
}

extension ListHeader {
    static func loadNib() -> ListHeader {
        let nibName = "ListHeader"
        return Bundle.main.loadNibNamed(nibName, owner: nil, options: nil)?.first as! ListHeader
    }
}
