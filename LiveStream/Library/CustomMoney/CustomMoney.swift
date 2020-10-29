//
//  CustomMoney.swift
//  LiveStream
//
//  Created by Apple on 10/29/20.
//  Copyright © 2020 ELSAGA-MACOS. All rights reserved.
//

import UIKit

class CustomMoney: NSObject {

    static func numberToMoney(_ price: Double) -> String{
            let numberFormatter = NumberFormatter()
            numberFormatter.groupingSeparator = ","
            numberFormatter.groupingSize = 3
            numberFormatter.usesGroupingSeparator = true
            numberFormatter.decimalSeparator = "."
            numberFormatter.numberStyle = .decimal
            numberFormatter.maximumFractionDigits = 2
            return numberFormatter.string(from: price as NSNumber)!
        }
}
