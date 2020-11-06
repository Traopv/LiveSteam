//
//  PopupOrderCell2.swift
//  AppSales
//
//  Created by Apple on 10/22/20.
//

import UIKit

class PopupOrderCell2: UICollectionViewCell {

    @IBOutlet weak var viewCell: UIView!
    @IBOutlet weak var lbSize: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    //MARK:-
    //MARK: conFig
    func conFig(){
        viewCell.layer.cornerRadius = viewCell.bounds.height / 2
        //viewCell.layer.masksToBounds = true
        viewCell.layer.borderWidth = 0.5
        viewCell.layer.borderColor = #colorLiteral(red: 0.3075457811, green: 0.3076019287, blue: 0.30753389, alpha: 1)
    }
}
