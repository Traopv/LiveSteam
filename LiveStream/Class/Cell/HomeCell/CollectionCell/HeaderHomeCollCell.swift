//
//  HeaderHomeCollCell.swift
//  LiveStream
//
//  Created by Apple on 10/26/20.
//  Copyright © 2020 ELSAGA-MACOS. All rights reserved.
//

import UIKit

class HeaderHomeCollCell: UICollectionViewCell {

    @IBOutlet weak var lbLive: UILabel!
    @IBOutlet weak var imgCell: UIImageView!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbDicription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    //MARK:-
    //MARK: conFig
    func conFig(){
        lbLive.layer.cornerRadius = 2.0
    }
}
