//
//  DetailNotifiCell5.swift
//  LiveStream
//
//  Created by Apple on 11/4/20.
//  Copyright © 2020 ELSAGA-MACOS. All rights reserved.
//

import UIKit

class DetailNotifiCell5: UITableViewCell {

    @IBOutlet weak var lbStatus: UILabel!
    @IBOutlet weak var imgProduct: UIImageView!
    @IBOutlet weak var lbTime: UILabel!
    @IBOutlet weak var lbTitleProduct: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //MARK:-
    //MARK: config
    func conFig(){
        let attributedStr = NSMutableAttributedString.init(string: lbTitleProduct.text ?? "")
        attributedStr.addAttribute(.foregroundColor, value: UIColor.init(red: 0, green: 0, blue: 0, alpha: 1), range: NSRange.init(location: 9, length: 13))
        lbTitleProduct.attributedText = attributedStr
    }
}
