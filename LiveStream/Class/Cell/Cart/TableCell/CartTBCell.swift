//
//  CartTBCell.swift
//  LiveStream
//
//  Created by Apple on 10/27/20.
//  Copyright © 2020 ELSAGA-MACOS. All rights reserved.
//

import UIKit

class CartTBCell: UITableViewCell {

    @IBOutlet weak var imgCell: UIImageView!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbColor: UILabel!
    @IBOutlet weak var lbSize: UILabel!
    @IBOutlet weak var lbNumber: UILabel!
    @IBOutlet weak var lbOldPrice: UILabel!
    @IBOutlet weak var lbNewPrice: UILabel!
    
    var productMoneys = 200000.0
    
    var number = 0 {
        didSet{
            lbNumber.text = "\(number)"
        }
    }
    var numberProducts : ((_ number : Int) -> Void)?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func removeNumber(_ sender: Any) {
        if number != 0 {
            number -= 1
            numberProducts?(-1)
        }
    }
    @IBAction func addNumber(_ sender: Any) {
        number += 1
        numberProducts?(1)
    }
}
