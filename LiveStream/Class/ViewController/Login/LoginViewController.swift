//
//  LoginViewController.swift
//  LiveStream
//
//  Created by ELSAGA-MACOS on 10/25/20.
//  Copyright © 2020 ELSAGA-MACOS. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var txtPhone: UITextField!
    @IBOutlet weak var txtPass: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var viewPhone: UIView!
    @IBOutlet weak var viewPass: UIView!
    @IBOutlet weak var imgAvata: UIImageView!
    
    var phone = Defaults.getAccount().phone
    var password = Defaults.getAccount().password
    
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

        viewPass.layer.borderWidth = 1.0
        viewPass.layer.cornerRadius = 4.0
        viewPass.layer.borderColor = UIColor(named: "#828282")?.cgColor
        
        btnLogin.layer.cornerRadius = 2.0
        self.navigationController?.isNavigationBarHidden = true
        
        txtPhone.text = Defaults.getAccount().phone
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
    @IBAction func login(_ sender: Any) {
        
        if txtPhone.text == "" || txtPass.text == "" {
            displayAlert(title: "Thông báo!", message: "Vui lòng điền đẩy đủ thông tin!")
        } else {
            if txtPhone.text == phone && txtPass.text == password {
                let tabbarVC = TabbarViewController.init()
                self.navigationController?.pushViewController(tabbarVC, animated: true)
            } else if txtPhone.text != phone {
                displayAlert(title: "Thông báo", message: "Số điện thoại không chính xác!")
            } else if txtPass.text != password {
                displayAlert(title: "Thông báo", message: "Mật khẩu không chính xác!")
            }
        }
    }

    @IBAction func pushToRegister(_ sender: Any) {
        let registerVC = Register1ViewController.init()
        self.navigationController?.pushViewController(registerVC, animated: true)
    }

    @IBAction func forgotPassword(_ sender: Any) {
    }

    @IBAction func loginWithApple(_ sender: Any) {
    }

    @IBAction func loginWithFacebook(_ sender: Any) {
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        txtPass.resignFirstResponder()
        txtPhone.resignFirstResponder()
    }
}
