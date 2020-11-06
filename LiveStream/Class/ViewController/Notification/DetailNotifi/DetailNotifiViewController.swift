//
//  DetailNotifiViewController.swift
//  LiveStream
//
//  Created by Apple on 10/28/20.
//  Copyright © 2020 ELSAGA-MACOS. All rights reserved.
//

import UIKit

class DetailNotifiViewController: UIViewController {

    @IBOutlet weak var myTable: UITableView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        conFig()
    }
    
    //MARK:-
    //MARK: button function
    func conFig(){
        myTable.register(UINib.init(nibName: "DetailNotifiCell1", bundle: nil), forCellReuseIdentifier: "DetailNotifiCell1")
        myTable.register(UINib.init(nibName: "DetailNotifiCell2", bundle: nil), forCellReuseIdentifier: "DetailNotifiCell2")
        myTable.register(UINib.init(nibName: "DetailNotifiCell3", bundle: nil), forCellReuseIdentifier: "DetailNotifiCell3")
        myTable.register(UINib.init(nibName: "DetailNotifiCell5", bundle: nil), forCellReuseIdentifier: "DetailNotifiCell5")
        
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 12.0))
        headerView.backgroundColor = #colorLiteral(red: 0.8980392157, green: 0.8980392157, blue: 0.8980392157, alpha: 1)
        myTable.tableHeaderView = headerView
    }
    
    //MARK:-
    //MARK: button function
    
    @IBAction func backToNotifiVC(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
        self.tabBarController?.tabBar.isHidden = false
    }
}

//MARK:-
extension DetailNotifiViewController: UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 140
        case 1:
            return 219
        case 2:
            return 127
        default:
            return 234
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "DetailNotifiCell5", for: indexPath) as! DetailNotifiCell5
            cell.conFig()
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "DetailNotifiCell1", for: indexPath) as! DetailNotifiCell1
            cell.conFig()
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "DetailNotifiCell2", for: indexPath) as! DetailNotifiCell2
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "DetailNotifiCell3", for: indexPath) as! DetailNotifiCell3
            return cell
        }
        
        return UITableViewCell.init()
    }
}
