//
//  FooterAccView.swift
//  LiveStream
//
//  Created by Apple on 11/6/20.
//  Copyright © 2020 ELSAGA-MACOS. All rights reserved.
//

import UIKit

class FooterAccView: BaseView {
    
    @IBOutlet weak var btnLogout: UIButton!
    
    override func configViewUI() {
        btnLogout.layer.borderWidth = 2
        btnLogout.layer.borderColor = #colorLiteral(red: 0.9215686275, green: 0.3411764706, blue: 0.3411764706, alpha: 1)
        btnLogout.layer.cornerRadius = 2.0
    }

}
