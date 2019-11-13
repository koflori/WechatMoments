//
//  ViewController.swift
//  Wechat
//
//  Created by ken on 2019/11/12.
//  Copyright © 2019年 ken. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var _list: UITableView!
    
    @IBOutlet var _navBar: NavigationBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        _list.refreshControl = UIRefreshControl()
        _list.contentInsetAdjustmentBehavior = .never
        _list.contentInset = UIEdgeInsets(top: -60, left: 0, bottom: -40, right: 0)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
}

extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y > 220 || scrollView.contentOffset.y < 200 {
            _navBar._backBtn.alpha = 1.0
            _navBar._photoBtn.alpha = 1.0
        }else {
            _navBar._backBtn.alpha = 1-(scrollView.contentOffset.y-200)/20.0
            _navBar._photoBtn.alpha = 1-(scrollView.contentOffset.y-200)/20.0
        }
        
        _navBar.isScrollUp = scrollView.contentOffset.y < 220
        
        if scrollView.contentOffset.y < 220 {
            _navBar._bgView.alpha = 0.0
            _navBar._label.alpha = 0.0
        }else{
            _navBar._bgView.alpha = scrollView.contentOffset.y/220
            _navBar._label.alpha = scrollView.contentOffset.y/220
        }
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 300
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return ListHeader.loadNib()
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
        return cell!
    }
    
}

