//
//  VideoViewController.swift
//  AppSales
//
//  Created by Apple on 10/22/20.
//

import UIKit

class VideoViewController: UIViewController {

    @IBOutlet weak var lbType: UILabel!
    @IBOutlet weak var lbDate: UILabel!
    @IBOutlet weak var lbNumberViews: UILabel!
    @IBOutlet weak var lbLive: UILabel!
    @IBOutlet weak var lbNameShop: UILabel!
    @IBOutlet weak var lbDicription: UILabel!
    @IBOutlet weak var imgShop: UIImageView!
    @IBOutlet weak var myTable: UITableView!
    @IBOutlet weak var lbLive1: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        conFig()
    }
    
    //MARK:-
    //MARK: config
    func conFig() {
        lbLive1.layer.cornerRadius = 2.0
        myTable.register(UINib.init(nibName: "VideoTableCell", bundle: nil), forCellReuseIdentifier: "VideoTableCell")
    }
}

//MARK:-
//MARK: Table
extension VideoViewController : UITableViewDelegate,UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        let headerVideoCell = HeaderVideoCell().fromNib(nibName: "HeaderVideoCell") as! HeaderVideoCell
        headerVideoCell.conFig()
        return headerVideoCell
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {

        return 35
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VideoTableCell", for: indexPath) as! VideoTableCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailProductVC = DetailProductsVC.init()
        self.navigationController?.pushViewController(detailProductVC, animated: true)
    }
}
