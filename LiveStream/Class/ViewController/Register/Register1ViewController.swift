//
//  Register1ViewController.swift
//  LiveStream
//
//  Created by ELSAGA-MACOS on 10/25/20.
//  Copyright © 2020 ELSAGA-MACOS. All rights reserved.
//

import UIKit

class Register1ViewController: UIViewController {

    @IBOutlet weak var txtPhone: UITextField!
    @IBOutlet weak var btnNextScreen: UIButton!
    @IBOutlet weak var viewPhone: UIView!
    @IBOutlet weak var imgAvata2: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        conFig()
    }

    //MARK:-
    //MARK: conFig
    func conFig(){
        viewPhone.layer.borderWidth = 1.0
        viewPhone.layer.cornerRadius = 4.0
        viewPhone.layer.borderColor = UIColor(named: "#828282")?.cgColor
        
        btnNextScreen.layer.cornerRadius = 2.0
        self.navigationController?.isNavigationBarHidden = true
        print("==> size avata2",imgAvata2.bounds.size)
    }
    
    func displayAlert(title : String, message: String) {
        let dialogMessage = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
            print("Ok button tapped")
        })
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (action) -> Void in
            print("Cancel button tapped")
        }
        dialogMessage.addAction(ok)
        
        self.present(dialogMessage, animated: true, completion: nil)
        
    }

    //MARK:-
    //MARK: button function
    @IBAction func nextScreen(_ sender: Any) {
        if txtPhone.text == nil || txtPhone.text == "" {
            displayAlert(title: "Thông báo!", message: "Vui lòng điền đầy đủ thông tin!")
        } else {
            let register2VC = Register2ViewController.init()
            register2VC.phone = txtPhone.text ?? ""
            self.navigationController?.pushViewController(register2VC, animated: true)
        }
    }

    @IBAction func pushToLogin(_ sender: Any) {
        let loginVC = LoginViewController.init()
        self.navigationController?.pushViewController(loginVC, animated: true)
    }
    @IBAction func pushToTermofService(_ sender: Any) {
    }
    
    @IBAction func pushToPrivacyPolicy(_ sender: Any) {
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        txtPhone.resignFirstResponder()
    }
}
