//
//  AppManager.swift
//  LiveStream
//
//  Created by Apple on 10/27/20.
//  Copyright © 2020 ELSAGA-MACOS. All rights reserved.
//

import UIKit

class AppManager: NSObject {
    static let shared = AppManager()
    
    var nameKey = "NAMEKEY"
    var userNameKey = "USERNAME"
    var phoneKey = "PHONEKEY"
    var gendarKey = "GENDARKEY"
    var birthdayKey = "BIRTHDAYKEY"
    var emailKey = "EMAILKEY"
    var addressKey = "ADDRESSKEY"
    var arrProducts = [0,0]
    
    var userInfo : NSDictionary? = NSDictionary()
    let Locale_vi = Locale.init(identifier: "vi_VN")
    
    func getArrProduct(arr : [Int],i : Int) -> Int
    {
        return arr[i]
    }
    
    func getUserName() -> String
    {
        if let value = userInfo?.object(forKey: "userName") as? String{
            return value
        }else{
            return ""
        }
    }
    
    func getName() -> String
    {
        if let value = userInfo?.object(forKey: "nameKey") as? String{
            return value
        }else{
            return ""
        }
    }
    
    func getPhoneNumber() -> String
    {
        if let value = userInfo?.object(forKey: "phoneKey") as? String{
            return value
        }else{
            return ""
        }
    }
    
    func getGendarKey() -> String
    {
        if let value = userInfo?.object(forKey: "gendarKey") as? String{
            return value
        }else{
            return ""
        }
    }
    
    func getBirthdayKey() -> String
    {
        if let value = userInfo?.object(forKey: "birthdayKey") as? String{
            return value
        }else{
            return ""
        }
    }
    
    func getEmailKey() -> String
    {
        if let value = userInfo?.object(forKey: "emailKey") as? String{
            return value
        }else{
            return ""
        }
    }
    
    func getAddressKey() -> String
    {
        if let value = userInfo?.object(forKey: "addressKey") as? String{
            return value
        }else{
            return ""
        }
    }
}
