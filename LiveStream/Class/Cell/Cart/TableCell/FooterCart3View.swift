//
//  FooterCart3View.swift
//  LiveStream
//
//  Created by Apple on 11/6/20.
//  Copyright © 2020 ELSAGA-MACOS. All rights reserved.
//

import UIKit

class FooterCart3View: UIView {

    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var lbTotalMoney: UILabel!// tong tien
    @IBOutlet weak var btnOrder: UIButton!
    @IBOutlet weak var lbTotalProductsMoney: UILabel! // tong tien san pham
    @IBOutlet weak var lbSale: UILabel! // tien khuyen mai
    @IBOutlet weak var lbDelivery: UILabel! // phi giao hang
    @IBOutlet weak var lbTotal: UILabel!
    
    var closureOrder : (() -> Void)?
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
        btnOrder.layer.cornerRadius = 4.0
    }
    
    @IBAction func clickOrder(_ sender: Any) {
        closureOrder?()
    }
}
