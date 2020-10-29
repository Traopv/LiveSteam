//
//  DiscountCodeCell.swift
//  LiveStream
//
//  Created by Apple on 10/28/20.
//  Copyright © 2020 ELSAGA-MACOS. All rights reserved.
//

import UIKit

class DiscountCodeCell: UITableViewCell {

    @IBOutlet weak var viewDiscount: UIView!
    @IBOutlet weak var txtDiscountCode: UITextField!
    @IBOutlet weak var btnApply: UIButton!
    
    var indexType  = 1
    
    var nextScreen : ((_ codeDiscount : String) -> Void)?
    var applyDiscountCode : (() -> Void)?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
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
