//
//  VideoTableCell.swift
//  AppSales
//
//  Created by Apple on 10/22/20.
//

import UIKit

class VideoTableCell: UITableViewCell {

    @IBOutlet weak var imgCell: UIImageView!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbOldPrice: UILabel!
    @IBOutlet weak var lbNewPrice: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
