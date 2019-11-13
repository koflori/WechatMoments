//
//  ViewModel.swift
//  Wechat
//
//  Created by ken on 2019/11/13.
//  Copyright © 2019年 ken. All rights reserved.
//

import UIKit

class ViewModel: NSObject {
    
    var userInfo:UserModel?
    
    var list:ListModel?
    
}

//request
extension ViewModel {
    func loadData(block:@escaping() -> Void) -> Void {
        let group = DispatchGroup()
        let queue = DispatchQueue.global()
        
        group.enter()
        queue.async {
            self.getUserInfo(success: {
                group.leave()
            }, fail: { (error) in
                group.leave()
            })
        }
        
        group.enter()
        queue.async {
            self.getList(success: {
                group.leave()
            }, fail: { (error) in
                group.leave()
            })
        }
        
        group.notify(queue: DispatchQueue.main) {
            block()
        }
    }
    
    func getUserInfo(success:@escaping() -> Void, fail:@escaping(_ error:String) -> Void) -> Void {
        let req = Request()
        let url = PrefixHeader.host+"/user/jsmith"
        req.get(url, success: { (data) in
            if let d = data as? Dictionary<String,Any> {
                self.userInfo = UserModel.loadData(d)
                success()
            }else{
                fail("data is wrong")
            }
        }) { (error) in
            fail(error)
        }
    }
    
    func getList(success:@escaping() -> Void, fail:@escaping(_ error:String) -> Void) -> Void {
        let req = Request()
        let url = PrefixHeader.host+"/user/jsmith/tweets"
        req.get(url, success: { (data) in
            if let d = data as? Array<Any> {
                self.list = ListModel.loadData(d)
                success()
            }else{
                fail("data is wrong")
            }
        }) { (error) in
            fail(error)
        }
    }
}
