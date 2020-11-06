//
//  HeaderOrderCell.swift
//  LiveStream
//
//  Created by Apple on 11/4/20.
//  Copyright © 2020 ELSAGA-MACOS. All rights reserved.
//

import UIKit

protocol HeaderDelegate {
    func callHeader(idx: Int)
}
class HeaderOrderCell: UIView {

    @IBOutlet weak var lbOrderCode: UILabel!
    @IBOutlet weak var lbTime: UILabel!
    @IBOutlet weak var imgCell: UIImageView!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbNumber: UILabel!
    @IBOutlet weak var lbPrices: UILabel!
    @IBOutlet weak var viewDashedLine: UIView!
    
    var secIndex : Int?
    var delegate : HeaderDelegate?
    
    func fromNib(nibName : String, index : Int! = 0) -> UIView {
        let bundle = Bundle.main
        let nib = UINib(nibName: nibName, bundle: bundle)
        let nibView = nib.instantiate(withOwner: self, options: nil)[index] as! UIView
        
        return nibView
    }
    
    //MARK:-
    //MARK: config
    func conFig() {
        viewDashedLine.addDashedBorder()
    }
    
    @IBAction func showOrderCell(_ sender: Any) {
        if let idx = secIndex {
            delegate?.callHeader(idx: idx)
        }
    }
}
