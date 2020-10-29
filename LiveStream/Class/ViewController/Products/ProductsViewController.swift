//
//  ProductsViewController.swift
//  LiveStream
//
//  Created by Apple on 10/26/20.
//  Copyright © 2020 ELSAGA-MACOS. All rights reserved.
//

import UIKit

class ProductsViewController: UIViewController {

    @IBOutlet weak var myTable: UITableView!
    @IBOutlet weak var txtSearch: UITextField!
    @IBOutlet weak var viewSearch: UIView!
    
    var arrTitleSection = ["","Danh mục","Sản phẩm"]
    override func viewDidLoad() {
        super.viewDidLoad()
        conFig()
    }
    
    //MARK:-
    //MARK: config
    func conFig(){
        myTable.register(UINib.init(nibName: "ProductsCell", bundle: nil), forCellReuseIdentifier:  "ProductsCell")
        myTable.register(UINib.init(nibName: "ProductsCell1", bundle: nil), forCellReuseIdentifier:  "ProductsCell1")
        viewSearch.layer.cornerRadius = 2.0
    }
    
    //MARK:-
    //MARK: button function
    @IBAction func pushToCart(_ sender: Any) {
        let cartVC = CartViewController.init()
        self.navigationController?.pushViewController(cartVC, animated: true)
        self.tabBarController?.tabBar.isHidden = true
    }
    
    @IBAction func searchProducts(_ sender: Any) {
    }
}

//MARK:-
//MARK: Table
extension ProductsViewController : UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 0
        case 1:
            return 1
        default:
            return 6
        }
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let headerProductCell = HeaderProductCell().fromNib(nibName: "HeaderProductCell") as! HeaderProductCell
            headerProductCell.conFig()
            return headerProductCell
        } else {
            let sectionProductsCell = SectionProductsCell().fromNib(nibName: "SectionProductsCell") as! SectionProductsCell
            sectionProductsCell.lbSection.text = arrTitleSection[section]
            return sectionProductsCell
        }
        return UIView.init()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 0
        case 1:
            return 287
        default:
            return 270
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        var number = 0
        if section == 0 {
            number = 108
        } else {
            number = 36
        }
        return CGFloat(number)
        switch section {
        case 0:
            return 108
        default:
            return 44
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            UITableViewCell.init()
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProductsCell1", for: indexPath) as! ProductsCell1
            cell.conFig()
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProductsCell", for: indexPath) as! ProductsCell
            cell.conFig()
            return cell
        }
        return UITableViewCell.init()
    }
}

