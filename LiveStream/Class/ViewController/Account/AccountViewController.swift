//
//  AccountViewController.swift
//  LiveStream
//
//  Created by Apple on 10/26/20.
//  Copyright © 2020 ELSAGA-MACOS. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController {

    @IBOutlet weak var btnLogout: UIButton!
    @IBOutlet weak var lbPoint: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        conFig()
    }
    
    //MARK:-
    //MARK: conFig
    func conFig(){
        
        btnLogout.layer.borderWidth = 2
        btnLogout.layer.borderColor = #colorLiteral(red: 0.9215686275, green: 0.3411764706, blue: 0.3411764706, alpha: 1)
        btnLogout.layer.cornerRadius = 2.0
        
    }
    
    func displayAlert(title : String, message: String) {
        let dialogMessage = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
            let loginVC = LoginViewController.init()
            self.navigationController?.pushViewController(loginVC, animated: true)
            self.tabBarController?.tabBar.isHidden = true
        })
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (action) -> Void in
            print("Cancel button tapped")
        }
        
        dialogMessage.addAction(ok)
        dialogMessage.addAction(cancel)
        
        self.present(dialogMessage, animated: true, completion: nil)
        
    }
    
    //MARK:-
    //MARK: button function
    @IBAction func pushToDetailAccount(_ sender: Any) {
        let detailAccountVC = DetailAccountViewController.init()
        self.navigationController?.pushViewController(detailAccountVC, animated: true)
        self.tabBarController?.tabBar.isHidden = true
    }
    
    @IBAction func logout(_ sender: Any) {
        displayAlert(title: "Thông báo!", message: "Bạn có chắc muốn đăng xuất!")
    }
}
