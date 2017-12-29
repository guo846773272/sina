//
//  UserAccountViewModel.swift
//  sina
//
//  Created by GMY on 2017/3/20.
//  Copyright © 2017年 Mingk. All rights reserved.
//

import UIKit

class UserAccountViewModel: NSObject {
    
    static let shareUserAccount: UserAccountViewModel = UserAccountViewModel()
    
    var account: UserAccountModel?
    
    var accountPath: String{
        let accountPath = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).first!
        return (accountPath as NSString).appendingPathComponent("account.plist")
    }
    
    var isLogin : Bool {
        if account == nil {
            return false
        }
        
        guard let expiresDate = account?.expires_date else {
            return false
        }
        
        return expiresDate.compare(Date()) == ComparisonResult.orderedDescending
    }
    
    override init () {
        super.init()
        account = NSKeyedUnarchiver.unarchiveObject(withFile: accountPath) as? UserAccountModel
    }
}
