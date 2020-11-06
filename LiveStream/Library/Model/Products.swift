//
//  Products.swift
//  LiveStream
//
//  Created by Apple on 11/4/20.
//  Copyright © 2020 ELSAGA-MACOS. All rights reserved.
//

import UIKit

// MARK: -
//MARK: products

struct Products {
    var name : String
    var dicription : String
    var image : String
    var points : Int
    var oldPrices : Double
    var newPrices : Double
    var color : String
    var size : String
    var time : Date
    var number : Int
    init(name : String, dicription : String,image : String,points : Int,oldPrices : Double,newPrices : Double,color : String,size : String,time : Date,number : Int) {
        self.name = name
        self.dicription = dicription
        self.image = image
        self.points = points
        self.oldPrices = oldPrices
        self.newPrices = newPrices
        self.color = color
        self.size = size
        self.time = time
        self.number = number
    }
}
