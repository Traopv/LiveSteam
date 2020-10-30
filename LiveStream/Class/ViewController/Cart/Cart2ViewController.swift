//
//  Cart2ViewController.swift
//  LiveStream
//
//  Created by Apple on 10/28/20.
//  Copyright © 2020 ELSAGA-MACOS. All rights reserved.
//

import UIKit

class Cart2ViewController: UIViewController {

    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var lbTotalMoney: UILabel!// tong tien
    @IBOutlet weak var btnNextScreen: UIButton!
    @IBOutlet weak var myTable: UITableView!
    @IBOutlet weak var lbTotalProductsMoney: UILabel! // tong tien san pham
    @IBOutlet weak var lbSale: UILabel! // tien khuyen mai
    @IBOutlet weak var lbDelivery: UILabel! // phi giao hang
    
    // moi discount code 40.000
    var codeDiscount = ""
    let discountMoney = 30000
    var totalProducts : Double = 0.0
    var moneySale : Double = 40000
    var moneyDelivery : Double = 0.0
    var totalMoney = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        conFig()
        myTable.reloadData()
    }
    
    // MARK: -
    // MARK: config
    func conFig(){
        view1.layer.cornerRadius = 6.0
        btnNextScreen.layer.cornerRadius = 4.0
        myTable.register(UINib.init(nibName: "CartTBCell", bundle: nil), forCellReuseIdentifier: "CartTBCell")
        myTable.register(UINib.init(nibName: "DiscountCodeCell", bundle: nil), forCellReuseIdentifier: "DiscountCodeCell")
        
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 12.0))
        headerView.backgroundColor = #colorLiteral(red: 0.8980392157, green: 0.8980392157, blue: 0.8980392157, alpha: 1)
        myTable.tableHeaderView = headerView
        
        totalMoney = totalProducts - moneySale + moneyDelivery
        lbSale.text = "\(CustomMoney.numberToMoney(moneySale))"
        lbTotalMoney.text = "đ\(CustomMoney.numberToMoney(totalMoney))"
        lbTotalProductsMoney.text = "đ\(CustomMoney.numberToMoney(totalProducts))"
    }
    
    // MARK: -
    // MARK: button function
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func nextScreen(_ sender: Any) {
        let cart3VC = Cart3ViewController.init()
        cart3VC.totalProducts = totalMoney
        self.navigationController?.pushViewController(cart3VC, animated: true)
    }
}

// MARK: -
extension Cart2ViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 2:
            return 84
        default:
            return 145
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "DiscountCodeCell", for: indexPath) as! DiscountCodeCell
            cell.indexType = 2
            cell.conFig()
            cell.btnApply.backgroundColor = #colorLiteral(red: 0.9215686275, green: 0.3411764706, blue: 0.3411764706, alpha: 1)
            cell.btnApply.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
            cell.txtDiscountCode.text = codeDiscount
            cell.applyDiscountCode = { [self] in
                totalMoney = totalMoney - Double(discountMoney)
                lbTotalMoney.text = "đ\(CustomMoney.numberToMoney(totalMoney))"
            }
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "CartTBCell", for: indexPath) as! CartTBCell
            cell.number = AppManager.shared.arrProducts[indexPath.row]
            cell.lbNumber.text = "\(AppManager.shared.getArrProduct(arr: AppManager.shared.arrProducts, i: indexPath.row))"
            cell.numberProducts = { [self] (number : Int) in
                AppManager.shared.arrProducts[indexPath.row] += number
                lbTotalProductsMoney.text = "đ\(CustomMoney.numberToMoney(totalProducts + Double(number) * 200000.0))"
                cell.lbNumber.text = "\(AppManager.shared.getArrProduct(arr: AppManager.shared.arrProducts, i: indexPath.row))"
                totalMoney = Double(number * Int(cell.productMoneys)) + totalMoney
                lbTotalMoney.text = "đ\(CustomMoney.numberToMoney(totalMoney))"
            }
            return cell
        }
        return UITableViewCell.init()
    }
}
