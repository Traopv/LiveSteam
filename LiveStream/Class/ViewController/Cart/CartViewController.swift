//
//  CartViewController.swift
//  LiveStream
//
//  Created by Apple on 10/27/20.
//  Copyright © 2020 ELSAGA-MACOS. All rights reserved.
//

import UIKit

class CartViewController: UIViewController {

    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var lbPrices: UILabel!
    @IBOutlet weak var btnNextScreen: UIButton!
    @IBOutlet weak var myTable: UITableView!
    
    var totalMoney = 0.0 {
        didSet{
            lbPrices.text = "đ\(CustomMoney.numberToMoney(totalMoney))"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        conFig()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DispatchQueue.main.async { [self] in
            totalMoney = 0.0
            myTable.reloadData()
            let arrProducts = AppManager.shared.arrProducts
            for i in 0 ..< arrProducts.count {
                totalMoney += Double(arrProducts[i] * 200000)
            }
            lbPrices.text = "đ\(CustomMoney.numberToMoney(totalMoney))"
        }
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
        lbPrices.text = "đ\(0.0)"
//        NSAttributedString
//        NSMutableAttributedString
    }
    
    // MARK: -
    // MARK: button function
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    @IBAction func nextScreen(_ sender: Any) {
        let cart3VC = Cart3ViewController.init()
        cart3VC.totalProducts = totalMoney
        self.navigationController?.pushViewController(cart3VC, animated: true)
    }
}

// MARK: -
extension CartViewController: UITableViewDelegate,UITableViewDataSource{
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
            cell.indexType = 1
            cell.conFig()
            cell.btnApply.backgroundColor = #colorLiteral(red: 0.8784313725, green: 0.8784313725, blue: 0.8784313725, alpha: 1)
            cell.nextScreen = { [self] (codeDiscount : String) in
                //code
                let cart2VC = Cart2ViewController.init()
                cart2VC.codeDiscount = codeDiscount
                cart2VC.totalProducts = totalMoney
                self.navigationController?.pushViewController(cart2VC, animated: true)
            }
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "CartTBCell", for: indexPath) as! CartTBCell
            cell.number = AppManager.shared.arrProducts[indexPath.row]
            cell.lbNumber.text = "\(AppManager.shared.getArrProduct(arr: AppManager.shared.arrProducts, i: indexPath.row))"
            cell.numberProducts = { [self] (number : Int) in
                AppManager.shared.arrProducts[indexPath.row] += number
                cell.lbNumber.text = "\(AppManager.shared.getArrProduct(arr: AppManager.shared.arrProducts, i: indexPath.row))"
                totalMoney = Double(number) * cell.productMoneys + totalMoney
            }
            return cell
        }
        return UITableViewCell.init()
    }
}
