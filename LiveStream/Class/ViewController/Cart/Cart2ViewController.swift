//
//  Cart2ViewController.swift
//  LiveStream
//
//  Created by Apple on 10/28/20.
//  Copyright © 2020 ELSAGA-MACOS. All rights reserved.
//

import UIKit

class Cart2ViewController: UIViewController {

    @IBOutlet weak var myTable: UITableView!
    
    // moi discount code 40.000
    var codeDiscount = "1212"
    let discountMoney = 30000
    var totalProducts : Double = 0.0
    var moneySale : Double = 40000
    var moneyDelivery : Double = 0.0
    
    var totalMoney = 0.0//{
//        didSet{
//            myTable.reloadData()
//        }
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        conFig()
        myTable.reloadData()
    }
    
    // MARK: -
    // MARK: config
    func conFig(){
        myTable.register(UINib.init(nibName: "CartTBCell", bundle: nil), forCellReuseIdentifier: "CartTBCell")
        myTable.register(UINib.init(nibName: "DiscountCodeCell", bundle: nil), forCellReuseIdentifier: "DiscountCodeCell")
        
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 12.0))
        headerView.backgroundColor = #colorLiteral(red: 0.8980392157, green: 0.8980392157, blue: 0.8980392157, alpha: 1)
        myTable.tableHeaderView = headerView
        
        totalMoney = totalProducts - moneySale + moneyDelivery
    }
    
    // MARK: -
    // MARK: button function
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        
    }
}

// MARK: -
extension Cart2ViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AppManager.shared.arrProducts.count + 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case AppManager.shared.arrProducts.count:
            return 84
        default:
            return 145
        }
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footer = FooterCart2View().fromNib(nibName: "FooterCart2View") as! FooterCart2View
        footer.conFig()
        footer.lbSale.text = "\(CustomMoney.numberToMoney(moneySale))"
        footer.lbTotalMoney.text = "đ\(CustomMoney.numberToMoney(totalMoney))"
        footer.lbTotalProductsMoney.text = "đ\(CustomMoney.numberToMoney(totalProducts))"
        footer.pushCart3VC = { [self] in
            let cart3VC = Cart3ViewController.init()
            cart3VC.totalProducts = totalMoney
            self.navigationController?.pushViewController(cart3VC, animated: true)
        }
        return footer
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 234
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case AppManager.shared.arrProducts.count:
            let cell = tableView.dequeueReusableCell(withIdentifier: "DiscountCodeCell", for: indexPath) as! DiscountCodeCell
            cell.indexType = 2
            cell.conFig()
            cell.btnApply.backgroundColor = #colorLiteral(red: 0.9215686275, green: 0.3411764706, blue: 0.3411764706, alpha: 1)
            cell.btnApply.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
            cell.txtDiscountCode.text = codeDiscount
            cell.applyDiscountCode = { [self] in
                totalMoney = totalMoney - Double(discountMoney)
            }
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "CartTBCell", for: indexPath) as! CartTBCell
            let item = AppManager.shared.arrProducts[indexPath.row]
            cell.number = item.number
            cell.lbNumber.text = "\(cell.number)"
            cell.lbOldPrice.text = String(item.oldPrices)
            cell.lbOldPrice.text = String(item.oldPrices)
            cell.lbTitle.text = item.name
            cell.lbColor.text = "Màu: \(item.color)"
            cell.lbSize.text = "Size: \(item.size)"
            
            cell.numberProducts = { [self] (number : Int) in
                AppManager.shared.arrProducts[indexPath.row].number += number
                cell.lbNumber.text = "\(cell.number)"
                totalMoney += Double(number) * item.newPrices
                totalProducts += Double(number) * item.newPrices
                myTable.reloadData()
            }
            return cell

        }
    }
}
