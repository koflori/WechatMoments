//
//  ViewModel.swift
//  Wechat
//
//  Created by ken on 2019/11/13.
//  Copyright © 2019年 ken. All rights reserved.
//

import UIKit

class ViewModel: NSObject {
    
}

extension ViewModel {
    func request(block:@escaping() -> Void) -> Void {
        let group = DispatchGroup()
        let queue = DispatchQueue.global()
        queue.async {
            self.getUserInfo(success: { (data) in
                group.leave()
            }, fail: { (error) in
                group.leave()
            })
        }
        
        queue.async {
            self.getList(success: { (data) in
                group.leave()
            }, fail: { (error) in
                group.leave()
            })
        }
        
        group.notify(queue: DispatchQueue.main) {
            block()
        }
    }
    
    func getUserInfo(success:@escaping(_ response:Any) -> Void, fail:@escaping(_ error:String) -> Void) -> Void {
        let req = Request()
        let url = PrefixHeader.host+"/user/jsmith"
        req.get(url, success: { (data) in
            success(data)
        }) { (error) in
            fail(error)
        }
    }
    
    func getList(success:@escaping(_ response:Any) -> Void, fail:@escaping(_ error:String) -> Void) -> Void {
        let req = Request()
        let url = PrefixHeader.host+"/user/jsmith/tweets"
        req.get(url, success: { (data) in
            success(data)
        }) { (error) in
            fail(error)
        }
    }
}
