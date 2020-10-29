//
//  UserInfo.swift
//  LiveStream
//
//  Created by Apple on 10/27/20.
//  Copyright © 2020 ELSAGA-MACOS. All rights reserved.
//

import UIKit

struct userInfo {
    let name : String
    let userName : String
    let phone : String
    let gendar : String
    let birthday : String
    let email : String
    let address : String
    
    init(name: String, userName: String, phone : String, gendar: String, birthday: String, email: String, address : String) {
        self.name = name
        self.userName = userName
        self.phone = phone
        self.gendar = gendar
        self.birthday = birthday
        self.email = email
        self.address = address
    }
}
