//
//  FooterCart2View.swift
//  LiveStream
//
//  Created by Apple on 11/6/20.
//  Copyright © 2020 ELSAGA-MACOS. All rights reserved.
//

import UIKit

class FooterCart2View: UIView {

    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var lbTotalMoney: UILabel!// tong tien
    @IBOutlet weak var btnNextScreen: UIButton!
    @IBOutlet weak var lbTotalProductsMoney: UILabel! // tong tien san pham
    @IBOutlet weak var lbSale: UILabel! // tien khuyen mai
    @IBOutlet weak var lbDelivery: UILabel! // phi giao hang
    
    var pushCart3VC : (() -> Void)?
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
        pushCart3VC?()
    }
}
