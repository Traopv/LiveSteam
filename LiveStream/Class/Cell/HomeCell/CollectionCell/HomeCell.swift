//
//  HomeCell.swift
//  LiveStream
//
//  Created by Apple on 10/26/20.
//  Copyright © 2020 ELSAGA-MACOS. All rights reserved.
//

import UIKit

class HomeCell: UICollectionViewCell {

    @IBOutlet weak var imgCell: UIImageView!
    @IBOutlet weak var lbPoints: UILabel!
    @IBOutlet weak var lbNameProduct: UILabel!
    @IBOutlet weak var lbOldPrice: UILabel!
    @IBOutlet weak var lbNewPrice: UILabel!
    @IBOutlet weak var view1: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    //MARK:-
    //MARK: config
    func conFig(){
        view1.layer.cornerRadius = 4.0
    }
    
    //MARK:-
    //MARK: function button
    @IBAction func handleLike(_ sender: Any) {
    }
    
    @IBAction func handleSent(_ sender: Any) {
    }
}
