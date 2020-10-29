//
//  NotificationViewController.swift
//  LiveStream
//
//  Created by Apple on 10/26/20.
//  Copyright © 2020 ELSAGA-MACOS. All rights reserved.
//

import UIKit

class NotificationViewController: UIViewController {

    @IBOutlet weak var myTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        conFig()
    }
    
    //MARK:-
    //MARK: config
    func conFig(){
        myTable.register(UINib.init(nibName: "NotifiTableCell", bundle: nil), forCellReuseIdentifier: "NotifiTableCell")
    }
}

//MARK:-
extension NotificationViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NotifiTableCell", for: indexPath) as! NotifiTableCell
        cell.conFig()
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailNotifiVC = DetailNotifiViewController.init()
        self.navigationController?.pushViewController(detailNotifiVC, animated: true)
        self.tabBarController?.tabBar.isHidden = true
    }
}
