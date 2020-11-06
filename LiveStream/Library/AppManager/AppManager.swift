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
    
    var userNameKey = "USERNAME"
    var arrProducts : [Products] = [Products]()
    
    var userInfo : NSDictionary? = NSDictionary()
    var currentViewController : BaseViewController?
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
}
