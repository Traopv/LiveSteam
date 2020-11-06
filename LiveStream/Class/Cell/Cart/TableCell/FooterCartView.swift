//
//  FooterCartView.swift
//  LiveStream
//
//  Created by Apple on 11/6/20.
//  Copyright © 2020 ELSAGA-MACOS. All rights reserved.
//

import UIKit

class FooterCartView: UIView {

    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var lbPrices: UILabel!
    @IBOutlet weak var btnNextScreen: UIButton!
    
    var pushCart2VC : (() -> Void)?
    
    func fromNib(nibName : String, index : Int! = 0) -> UIView {
        let bundle = Bundle.main
        let nib = UINib(nibName: nibName, bundle: bundle)
        let nibView = nib.instantiate(withOwner: self, options: nil)[index] as! UIView
        
        return nibView
    }
    
    //MARK:-
    //MARK: button function
    func conFig(){
        view1.layer.cornerRadius = 6.0
        btnNextScreen.layer.cornerRadius = 4.0
    }

    @IBAction func nextScreen(_ sender: Any) {
        pushCart2VC?()
    }
}
