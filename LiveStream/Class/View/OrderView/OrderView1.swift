//
//  OrderView1.swift
//  LiveStream
//
//  Created by Apple on 11/4/20.
//  Copyright © 2020 ELSAGA-MACOS. All rights reserved.
//

import UIKit

class OrderView1: UIView{

    @IBOutlet weak var myTable: UITableView!
    
    var isShowCell : Bool = false
    var indexSection = 0
    var arrSectionType = [false,false]
    func fromNib(nibName : String, index : Int! = 0) -> UIView {
        let bundle = Bundle.main
        let nib = UINib(nibName: nibName, bundle: bundle)
        let nibView = nib.instantiate(withOwner: self, options: nil)[index] as! UIView
        
        return nibView
    }
    
    //MARK:-
    //MARK: config
    func conFig() {
        myTable.register(UINib.init(nibName: "DetailNotifiCell2", bundle: nil), forCellReuseIdentifier: "DetailNotifiCell2")
        myTable.register(UINib.init(nibName: "DetailNotifiCell3", bundle: nil), forCellReuseIdentifier: "DetailNotifiCell3")
        myTable.register(UINib.init(nibName: "DetailNotifiCell4", bundle: nil), forCellReuseIdentifier: "DetailNotifiCell4")
        
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 12.0))
        headerView.backgroundColor = #colorLiteral(red: 0.8980392157, green: 0.8980392157, blue: 0.8980392157, alpha: 1)
        myTable.tableFooterView = headerView
    }
}

//MARK:-
extension OrderView1: UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = HeaderOrderCell().fromNib(nibName: "HeaderOrderCell") as? HeaderOrderCell
        header?.delegate = self
        header?.secIndex = section
        header?.conFig()
        return header
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return arrSectionType.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 219
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if arrSectionType[section] == true {
            return 3
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            switch indexPath.row {
            case 0:
                return 127
            case 1:
                return 234
            default:
                return 0
            }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            switch indexPath.row {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: "DetailNotifiCell2", for: indexPath) as! DetailNotifiCell2
                cell.viewCell.isHidden = false
                return cell
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: "DetailNotifiCell3", for: indexPath) as! DetailNotifiCell3
                return cell
            default:
                return UITableViewCell.init()
            }
        return UITableViewCell.init()
    }
}
extension OrderView1 : HeaderDelegate{
    func callHeader(idx: Int){
        arrSectionType[idx] = !arrSectionType[idx]
        indexSection = idx
        myTable.reloadSections([idx], with: .automatic)
    }
}
