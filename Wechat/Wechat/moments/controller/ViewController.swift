//
//  ViewController.swift
//  Wechat
//
//  Created by ken on 2019/11/12.
//  Copyright © 2019年 ken. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var list: UITableView!
    
    lazy var tableHead: ListHeader = {
        let head = ListHeader.loadNib()
        return head
    }()
    
    @IBOutlet var navBar: NavigationBar!
    
    var viewModel: ViewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.initTable()
        
        viewModel.loadData {
            self.tableHead.loadModel(self.viewModel.userInfo)
            print(self.viewModel.list)
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    func initTable() {
        list.refreshControl = UIRefreshControl()
        list.contentInsetAdjustmentBehavior = .never
        list.contentInset = UIEdgeInsets(top: -60, left: 0, bottom: -40, right: 0)
    }
}

extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y > 220 || scrollView.contentOffset.y < 200 {
            navBar.backBtn.alpha = 1.0
            navBar.photoBtn.alpha = 1.0
        }else {
            navBar.backBtn.alpha = 1-(scrollView.contentOffset.y-200)/20.0
            navBar.photoBtn.alpha = 1-(scrollView.contentOffset.y-200)/20.0
        }
        
        navBar.isScrollUp = scrollView.contentOffset.y < 220
        
        if scrollView.contentOffset.y < 220 {
            navBar.bgView.alpha = 0.0
            navBar.label.alpha = 0.0
        }else{
            navBar.bgView.alpha = scrollView.contentOffset.y/220
            navBar.label.alpha = scrollView.contentOffset.y/220
        }
    }
}

//UITableView delegate
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 300
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return self.tableHead
    }
}

//UITableView dataSource
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

