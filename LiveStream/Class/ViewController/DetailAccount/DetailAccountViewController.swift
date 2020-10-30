//
//  DetailAccountViewController.swift
//  LiveStream
//
//  Created by Apple on 10/26/20.
//  Copyright © 2020 ELSAGA-MACOS. All rights reserved.
//

import UIKit

class DetailAccountViewController: UIViewController {
    
    @IBOutlet weak var btnChangeAccount: UIButton!
    @IBOutlet weak var btnSave: UIButton!
    @IBOutlet weak var myTable: UITableView!
    
    var arrTtile = ["","Tên","Tên đăng nhập","Điện thoại","Giới tính","Ngày sinh","Email","Địa chỉ"]
    var arrValue = ["","Trào","Tràopv","","Nam","21/05/1999","",""]
    let datePicker = UIDatePicker()
    var txtDatePicker  : UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        conFig()
    }
    
    //MARK:-
    //MARK: button function
    func conFig(){
        btnChangeAccount.layer.cornerRadius = 4.0
        myTable.register(UINib.init(nibName: "DetailAccCell1", bundle: nil), forCellReuseIdentifier: "DetailAccCell1")
        myTable.register(UINib.init(nibName: "DetailAccCell2", bundle: nil), forCellReuseIdentifier: "DetailAccCell2")
        myTable.register(UINib.init(nibName: "DetailAccCell3", bundle: nil), forCellReuseIdentifier: "DetailAccCell3")
        myTable.register(UINib.init(nibName: "DetailAccCell4", bundle: nil), forCellReuseIdentifier: "DetailAccCell4")
    }
    
    func showDatePicker(){
        //Formate Date
        datePicker.datePickerMode = .date

        //ToolBar
        let toolbar = UIToolbar();
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: nil);
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: #selector(donedatePicker))
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker));

        toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)

        txtDatePicker.inputAccessoryView = toolbar
        txtDatePicker.inputView = datePicker

    }

    @objc func donedatePicker(){

        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        txtDatePicker.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }

    @objc func cancelDatePicker(){
        self.view.endEditing(true)
    }
    
    //MARK:-
    //MARK: button function
    
    @IBAction func changeAccount(_ sender: Any) {
//        guard let popupVC = storyboard?.instantiateViewController(withIdentifier: "secondVC") as? ExamplePopupViewController else { return }
//        guard let popupVC = TestView?.init("TestView") as? TestView else { return }
//        popupVC.height = 300
//        popupVC.topCornerRadius = 6.0
//        popupVC.presentDuration = 1.5
//        popupVC.dismissDuration = 1.5
//        popupVC.shouldDismissInteractivelty = dismissInteractivelySwitch.isOn
//        popupVC.popupDelegate = self
//        present(popupVC, animated: true, completion: nil)
    }
    
    @IBAction func backToAccountVC(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
        self.tabBarController?.tabBar.isHidden = false
    }
}

//MARK:-
extension DetailAccountViewController: UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 151
        default:
            return 63
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "DetailAccCell1", for: indexPath) as! DetailAccCell1
            return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: "DetailAccCell3", for: indexPath) as! DetailAccCell3
            cell.gendar = arrValue[indexPath.row]
            cell.conFig()
            return cell
//        case 5:
//            let cell = tableView.dequeueReusableCell(withIdentifier: "DetailAccCell4", for: indexPath) as! DetailAccCell4
//            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "DetailAccCell2", for: indexPath) as! DetailAccCell2
            cell.lbTitle.text = arrTtile[indexPath.row]
            if arrValue[indexPath.row] == ""{
                cell.txtName.placeholder = arrTtile[indexPath.row]
            } else {
                cell.txtName.text = arrValue[indexPath.row]
            }
            return cell
        }
        
        return UITableViewCell.init()
    }
}
