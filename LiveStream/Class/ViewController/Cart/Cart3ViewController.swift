//
//  Cart3ViewController.swift
//  LiveStream
//
//  Created by Apple on 10/28/20.
//  Copyright © 2020 ELSAGA-MACOS. All rights reserved.
//

import UIKit

class Cart3ViewController: UIViewController {

    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var lbTotalMoney: UILabel!// tong tien
    @IBOutlet weak var btnOrder: UIButton!
    @IBOutlet weak var myTable: UITableView!
    @IBOutlet weak var lbTotalProductsMoney: UILabel! // tong tien san pham
    @IBOutlet weak var lbSale: UILabel! // tien khuyen mai
    @IBOutlet weak var lbDelivery: UILabel! // phi giao hang
    @IBOutlet weak var lbTotal: UILabel!
    
    var totalProducts : Double = 0.0
    var moneySale : Double = 40000
    var moneyDelivery : Double = 0.0
    var totalMoney = 0.0
    var arrProducts = [0,0]
    var address = ""
    var phone = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        conFig()
    }
    
    // MARK: -
    // MARK: config
    func conFig(){
        view1.layer.cornerRadius = 6.0
        btnOrder.layer.cornerRadius = 4.0
        myTable.register(UINib.init(nibName: "Cart3TbCell", bundle: nil), forCellReuseIdentifier: "Cart3TbCell")
        
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 12.0))
        headerView.backgroundColor = #colorLiteral(red: 0.8980392157, green: 0.8980392157, blue: 0.8980392157, alpha: 1)
        myTable.tableHeaderView = headerView
        
        totalMoney = totalProducts - moneySale - moneyDelivery
        lbSale.text = "\(CustomMoney.numberToMoney(moneySale))"
        lbTotal.text = "đ\(CustomMoney.numberToMoney(totalMoney))"
        lbTotalMoney.text = "đ\(CustomMoney.numberToMoney(totalMoney))"
        lbTotalProductsMoney.text = "đ\(CustomMoney.numberToMoney(totalProducts))"
    }
    
    func displayAlert(title : String, message: String) {
        let dialogMessage = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
            print("Ok button tapped")
        })
        
        dialogMessage.addAction(ok)
        
        self.present(dialogMessage, animated: true, completion: nil)
        
    }
    
    // MARK: -
    // MARK: button function
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func clickOrder(_ sender: Any) {
        if phone != nil && address != nil && phone != "" && address != "" {
            displayAlert(title: "Thông báo!", message: "Đặt hàng thành công!")
        } else {
            displayAlert(title: "Thông báo!", message: "Vui lòng điền đầy đủ thông tin!")
        }
    }
}

// MARK: -
extension Cart3ViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerCart3Cell = HeaderCart3Cell().fromNib(nibName: "HeaderCart3Cell") as! HeaderCart3Cell
        phone = headerCart3Cell.txtPhone.text ?? ""
        address = headerCart3Cell.txtAddress.text ?? ""
        return headerCart3Cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 182
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cart3TbCell", for: indexPath) as! Cart3TbCell
        cell.lbNumber.text = "x\(AppManager.shared.arrProducts[indexPath.row])"
        return cell
    }
}
