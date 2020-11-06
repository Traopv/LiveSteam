//
//  OrderView2.swift
//  LiveStream
//
//  Created by Apple on 11/4/20.
//  Copyright © 2020 ELSAGA-MACOS. All rights reserved.
//

import UIKit

class OrderView2: UIView {

    func fromNib(nibName : String, index : Int! = 0) -> UIView {
        let bundle = Bundle.main
        let nib = UINib(nibName: nibName, bundle: bundle)
        let nibView = nib.instantiate(withOwner: self, options: nil)[index] as! UIView
        
        return nibView
    }
    
    //MARK:-
    //MARK: config
    func conFig() {
    }
}
