//
//  ExtensionUserDefault.swift
//  LiveStream
//
//  Created by Apple on 10/26/20.
//  Copyright © 2020 ELSAGA-MACOS. All rights reserved.
//

import UIKit

struct Defaults {
    
    static let (phoneKey, pass) = ("phone", "pass")
    
    static let userSessionKey = "com.save.usersession"
//    static let userInfoSessionKey = "com.save.userInfosession"
    private static let userDefault = UserDefaults.standard
    
//  Nó được sử dụng để lấy ra và gán giá trị người dùng vào UserDefaults
    struct UserDetails {
        let phone: String
        let password: String
        
        init(_ json: [String: String]) {
            self.phone = json[phoneKey] ?? ""
            self.password = json[pass] ?? ""
        }
    }
// - Lưu chi tiết người dùng
// - Inputs - name `String` & address `String`
    static func save(_ phone: String, password: String){
        userDefault.set([phoneKey: phone, pass: password],
                        forKey: userSessionKey)
    }
//   - Tìm nạp các giá trị thông qua Model `UserDetails`
//   - Output - `UserDetails` model
    static func getAccount()-> UserDetails {
        return UserDetails((userDefault.value(forKey: userSessionKey) as? [String: String]) ?? [:])
    }
//    - Xoá chi tiết người dùng trong UserDefault qua key "com.save.usersession"
    static func clearUserData(){
        userDefault.removeObject(forKey: userSessionKey)
    }
}

//Lưu thông tin người dùng
//
//Defaults.save("Doom", address: "Hai Duong")
//Lấy ra thông tin:
//
//let name = Defaults.getNameAndAddress.name
//Xoá thông tin:
//
//Defaults.clearUserData()
