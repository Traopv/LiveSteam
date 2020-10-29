//
//  NotifiTableCell.swift
//  LiveStream
//
//  Created by Apple on 10/27/20.
//  Copyright © 2020 ELSAGA-MACOS. All rights reserved.
//

import UIKit

class NotifiTableCell: UITableViewCell {

    @IBOutlet weak var imgCell: UIImageView!
    @IBOutlet weak var lbTypeOrder: UILabel!
    @IBOutlet weak var lbDicription: UILabel!
    @IBOutlet weak var lbTime: UILabel!
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
        let attributedStr = NSMutableAttributedString.init(string: lbDicription.text ?? "")
        attributedStr.addAttribute(.foregroundColor, value: UIColor.init(red: 0, green: 0, blue: 0, alpha: 1), range: NSRange.init(location: 9, length: 13))
        lbDicription.attributedText = attributedStr
    }
}
