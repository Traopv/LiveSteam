//
//  HomeViewController.swift
//  LiveStream
//
//  Created by Apple on 10/26/20.
//  Copyright © 2020 ELSAGA-MACOS. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var myTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        conFig()
    }
    
    //MARK:-
    //MARK: conFig
    func conFig(){
        myTable.register(UINib.init(nibName: "HomeTableCell", bundle: nil), forCellReuseIdentifier: "HomeTableCell")
    }
    
    @objc  func handleNextVC(){
        let videoVC = VideoViewController.init()
        self.navigationController?.pushViewController(videoVC, animated: true)
        self.tabBarController?.tabBar.isHidden = true
    }
    
    //MARK:-
    //MARK: button function
    @IBAction func search(_ sender: Any) {
    }
    
    @IBAction func pushToCart(_ sender: Any) {
        let cartVC = CartViewController.init()
        self.navigationController?.pushViewController(cartVC, animated: true)
        self.tabBarController?.tabBar.isHidden = true
    }
}

//MARK:-
//MARK: Table
extension HomeViewController : UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let topHeaderHomeCell = TopHeaderHomeCell().fromNib(nibName: "TopHeaderHomeCell") as! TopHeaderHomeCell
            topHeaderHomeCell.conFig()
            let nc = NotificationCenter.default
            nc.addObserver(self, selector: #selector(handleNextVC), name: Notification.Name("pushToVideoVC"), object: nil)
            return topHeaderHomeCell
        } else {
            let sectionHomeCell = SectionHomeCell().fromNib(nibName: "SectionHomeCell") as! SectionHomeCell
            return sectionHomeCell
        }
        return UIView.init()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var number = 0
        if indexPath.section == 0 {
            number = 0
        } else {
            number = 418
        }
        return CGFloat(number)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        var number = 0
        if section == 0 {
            number = 234
        } else {
            number = 36
        }
        return CGFloat(number)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            return UITableViewCell.init()
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableCell", for: indexPath) as! HomeTableCell
            cell.conFig()
            return cell
        }
    }
}

