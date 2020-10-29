//
//  DetailNotifiCell1.swift
//  LiveStream
//
//  Created by Apple on 10/28/20.
//  Copyright © 2020 ELSAGA-MACOS. All rights reserved.
//

import UIKit

class DetailNotifiCell1: UITableViewCell {

    @IBOutlet weak var lbOrderCode: UILabel!
    @IBOutlet weak var lbTime: UILabel!
    @IBOutlet weak var imgCell: UIImageView!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbNumber: UILabel!
    @IBOutlet weak var lbPrices: UILabel!
    
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
    func conFig() {
    }
    
    //MARK:-
    //MARK: button function
    @IBAction func btnCancel(_ sender: Any) {
    }
    
}
