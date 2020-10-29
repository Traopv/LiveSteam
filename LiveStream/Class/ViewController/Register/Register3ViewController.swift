//
//  Register3ViewController.swift
//  LiveStream
//
//  Created by ELSAGA-MACOS on 10/25/20.
//  Copyright © 2020 ELSAGA-MACOS. All rights reserved.
//

import UIKit

class Register3ViewController: UIViewController {

    @IBOutlet weak var txtPhone: UITextField!
    @IBOutlet weak var btnUpdatePass: UIButton!
    @IBOutlet weak var txtPass: UITextField!
    @IBOutlet weak var txtRePass: UITextField!
    @IBOutlet weak var viewPhone: UIView!
    @IBOutlet weak var viewPass: UIView!
    @IBOutlet weak var viewRePass: UIView!
    
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
        
        viewPass.layer.borderWidth = 1.0
        viewPass.layer.cornerRadius = 4.0
        viewPass.layer.borderColor = UIColor(named: "#828282")?.cgColor
        
        viewRePass.layer.borderWidth = 1.0
        viewRePass.layer.cornerRadius = 4.0
        viewRePass.layer.borderColor = UIColor(named: "#828282")?.cgColor
        
        btnUpdatePass.layer.cornerRadius = 2.0
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func displayAlert(title : String, message: String) {
        let dialogMessage = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
            let loginVC = LoginViewController.init()
            self.navigationController?.pushViewController(loginVC, animated: true)
        })
        
        dialogMessage.addAction(ok)
        
        self.present(dialogMessage, animated: true, completion: nil)
        
    }

    //MARK:-
    //MARK: button function
    @IBAction func updatePassword(_ sender: Any) {
        if txtPhone.text != nil && txtPass.text != nil && txtRePass.text != nil {
            if txtPass.text == txtRePass.text {
                Defaults.save(txtPhone.text ?? "",password: txtPass.text ?? "")
                displayAlert(title: "Thông báo!", message: "Đăng ký thành công!")
            } else {
                displayAlert(title: "Thông báo!", message: "Mật khẩu không khớp!")
            }
        } else {
            displayAlert(title: "Thông báo!", message: "Vui lòng điền đẩy đủ thông tin")
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
        txtPass.resignFirstResponder()
        txtRePass.resignFirstResponder()
    }
}
