//
//  ListHeader.swift
//  Wechat
//
//  Created by ken on 2019/11/13.
//  Copyright © 2019年 ken. All rights reserved.
//

import UIKit

class ListHeader: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

extension ListHeader {
    static func loadNib() -> ListHeader {
        let nibName = "ListHeader"
        return Bundle.main.loadNibNamed(nibName, owner: nil, options: nil)?.first as! ListHeader
    }
}
