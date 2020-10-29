//
//  DetailAccCell3.swift
//  LiveStream
//
//  Created by Apple on 10/28/20.
//  Copyright © 2020 ELSAGA-MACOS. All rights reserved.
//

import UIKit

class DetailAccCell3: UITableViewCell {

    @IBOutlet weak var lbBoy: UILabel!
    @IBOutlet weak var lbGirl: UILabel!
    @IBOutlet weak var imgBoy: UIImageView!
    @IBOutlet weak var imgGirl: UIImageView!
    
    var gendar  = ""
    
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
        if gendar == "Nam" {
            imgBoy.image = UIImage.init(named: "radio_button_checked_24px.png")
            imgGirl.image = UIImage.init(named: "radio_button_unchecked_24px.png")
            lbBoy.textColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
            lbGirl.textColor = #colorLiteral(red: 0.7411764706, green: 0.7411764706, blue: 0.7411764706, alpha: 1)
        } else {
            imgGirl.image = UIImage.init(named: "radio_button_checked_24px.png")
            imgBoy.image = UIImage.init(named: "radio_button_unchecked_24px.png")
            lbGirl.textColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
            lbBoy.textColor = #colorLiteral(red: 0.7411764706, green: 0.7411764706, blue: 0.7411764706, alpha: 1)
        }
    }
    
    //MARK:-
    //MARK: button function
    @IBAction func chooseBoy(_ sender: Any) {
        imgBoy.image = UIImage.init(named: "radio_button_checked_24px.png")
        imgGirl.image = UIImage.init(named: "radio_button_unchecked_24px.png")
        lbBoy.textColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        lbGirl.textColor = #colorLiteral(red: 0.7411764706, green: 0.7411764706, blue: 0.7411764706, alpha: 1)
    }
    
    @IBAction func chooseGirl(_ sender: Any) {
        imgGirl.image = UIImage.init(named: "radio_button_checked_24px.png")
        imgBoy.image = UIImage.init(named: "radio_button_unchecked_24px.png")
        lbGirl.textColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        lbBoy.textColor = #colorLiteral(red: 0.7411764706, green: 0.7411764706, blue: 0.7411764706, alpha: 1)
    }
}
