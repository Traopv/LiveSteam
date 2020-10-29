//
//  HeaderCart3Cell.swift
//  LiveStream
//
//  Created by Apple on 10/28/20.
//  Copyright © 2020 ELSAGA-MACOS. All rights reserved.
//

import UIKit

class HeaderCart3Cell: UIView {

    @IBOutlet weak var txtAddress: UITextField!
    @IBOutlet weak var txtPhone: UITextField!
    
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
