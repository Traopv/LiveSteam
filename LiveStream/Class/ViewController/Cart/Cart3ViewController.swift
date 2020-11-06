//
//  Cart3ViewController.swift
//  LiveStream
//
//  Created by Apple on 10/28/20.
//  Copyright © 2020 ELSAGA-MACOS. All rights reserved.
//

import UIKit

class Cart3ViewController: UIViewController {
    
    @IBOutlet weak var myTable: UITableView!
    
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
        myTable.register(UINib.init(nibName: "Cart3TbCell", bundle: nil), forCellReuseIdentifier: "Cart3TbCell")
        
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
extension Cart3ViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AppManager.shared.arrProducts.count
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
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footer = FooterCart3View().fromNib(nibName: "FooterCart3View") as! FooterCart3View
        footer.conFig()
        footer.lbSale.text = "\(CustomMoney.numberToMoney(moneySale))"
        footer.lbTotal.text = "đ\(CustomMoney.numberToMoney(totalMoney))"
        footer.lbTotalMoney.text = "đ\(CustomMoney.numberToMoney(totalMoney))"
        footer.lbTotalProductsMoney.text = "đ\(CustomMoney.numberToMoney(totalProducts))"
        footer.closureOrder = { [self] in
            if phone == ""{
                VTBase.showToastWithMessage(message: "Vui lòng nhập số điện thoại!")
            } else if address == ""{
                VTBase.showToastWithMessage(message: "Vui lòng nhập địa chỉ!")
            } else {
                VTBase.showToastWithMessage(message: "Đặt hàng thành công!")
            }
        }
        return footer
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 389
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cart3TbCell", for: indexPath) as! Cart3TbCell
        let item = AppManager.shared.arrProducts[indexPath.row]
        cell.lbNumber.text = "x\(item.number)"
        cell.lbTitle.text = item.name
        cell.lbColor.text = "Màu: \(item.color)"
        cell.lbSize.text = "Size: \(item.size)"
        cell.lbPrices.text = "đ\(CustomMoney.numberToMoney(item.newPrices))"
        return cell
    }
}
