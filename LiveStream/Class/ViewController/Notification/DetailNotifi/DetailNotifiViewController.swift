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
    @IBOutlet weak var lbStatus: UILabel!
    @IBOutlet weak var imgProduct: UIImageView!
    @IBOutlet weak var lbTime: UILabel!
    @IBOutlet weak var lbTitleProduct: UILabel!
    
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
        
        let attributedStr = NSMutableAttributedString.init(string: lbTitleProduct.text ?? "")
        attributedStr.addAttribute(.foregroundColor, value: UIColor.init(red: 0, green: 0, blue: 0, alpha: 1), range: NSRange.init(location: 9, length: 13))
        lbTitleProduct.attributedText = attributedStr
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
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 219
        case 1:
            return 127
        default:
            return 234
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "DetailNotifiCell1", for: indexPath) as! DetailNotifiCell1
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "DetailNotifiCell2", for: indexPath) as! DetailNotifiCell2
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "DetailNotifiCell3", for: indexPath) as! DetailNotifiCell3
            return cell
        }
        
        return UITableViewCell.init()
    }
}
