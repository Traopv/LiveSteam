//
//  DiscountCodeView.swift
//  LiveStream
//
//  Created by Apple on 11/5/20.
//  Copyright © 2020 ELSAGA-MACOS. All rights reserved.
//

import UIKit

class DiscountCodeView: UIView {

    @IBOutlet weak var viewDiscount: UIView!
    @IBOutlet weak var txtDiscountCode: UITextField!
    @IBOutlet weak var btnApply: UIButton!
    
    var indexType  = 1
    
    var nextScreen : ((_ codeDiscount : String) -> Void)?
    var applyDiscountCode : (() -> Void)?
    
    func fromNib(nibName : String, index : Int! = 0) -> UIView {
        let bundle = Bundle.main
        let nib = UINib(nibName: nibName, bundle: bundle)
        let nibView = nib.instantiate(withOwner: self, options: nil)[index] as! UIView
        
        return nibView
    }
    
    //MARK:-
    //MARK: button function
    func conFig(){
        viewDiscount.layer.borderWidth = 1
        viewDiscount.layer.borderColor = UIColor.init(named: "#BDBDBD")?.cgColor
        viewDiscount.layer.cornerRadius = 3
        
        btnApply.layer.cornerRadius = 3
    }
    
    //MARK:-
    //MARK: button function
    @IBAction func clickApply(_ sender: Any) {
        if indexType == 1 {
            if txtDiscountCode.text == nil || txtDiscountCode.text == ""{
                
            } else {
                nextScreen?(txtDiscountCode.text ?? "")
            }
        } else {
            applyDiscountCode?()
        }
    }
}
