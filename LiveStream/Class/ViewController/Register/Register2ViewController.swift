//
//  Register2ViewController.swift
//  LiveStream
//
//  Created by ELSAGA-MACOS on 10/25/20.
//  Copyright © 2020 ELSAGA-MACOS. All rights reserved.
//

import UIKit

class Register2ViewController: UIViewController {

    @IBOutlet weak var txtPhone: UITextField!
    @IBOutlet weak var btnRegister: UIButton!
    @IBOutlet weak var txtOTP: UITextField!
    @IBOutlet weak var viewPhone: UIView!
    @IBOutlet weak var viewOTP: UIView!
    
    var phone : String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        conFig()
        txtPhone.text = phone
    }

    //MARK:-
    //MARK: conFig
    func conFig(){
        viewPhone.layer.borderWidth = 1.0
        viewPhone.layer.cornerRadius = 4.0
        viewPhone.layer.borderColor = UIColor(named: "#828282")?.cgColor
        
        viewOTP.layer.borderWidth = 1.0
        viewOTP.layer.cornerRadius = 4.0
        viewOTP.layer.borderColor = UIColor(named: "#828282")?.cgColor
        
        btnRegister.layer.cornerRadius = 2.0
        self.navigationController?.isNavigationBarHidden = true
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
    @IBAction func registerAccount(_ sender: Any) {
        if txtOTP.text == "" || txtOTP.text == nil {
            displayAlert(title: "Thông báo!", message: "Bạn cần nhập mã OTP!")
        } else {
            let register3VC = Register3ViewController.init()
            register3VC.phone = phone
            self.navigationController?.pushViewController(register3VC, animated: true)
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
        txtOTP.resignFirstResponder()
    }
}
