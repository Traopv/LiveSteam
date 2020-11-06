//
//  OrderViewController.swift
//  LiveStream
//
//  Created by Apple on 10/26/20.
//  Copyright © 2020 ELSAGA-MACOS. All rights reserved.
//

import UIKit

class OrderViewController: UIViewController{

    @IBOutlet weak var viewContent: UIView!
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    
    var views : [UIView] = [UIView]()
    var orderView1 : OrderView1!
    var orderView2 : OrderView2!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        conFig()
    }
    
    //MARK:-
    //MARK: config
    func conFig(){
        orderView1 = OrderView1().fromNib(nibName: "OrderView1") as? OrderView1
        orderView2 = OrderView2().fromNib(nibName: "OrderView2") as? OrderView2
        orderView1?.frame = CGRect(x: 0, y: 0, width: viewContent.bounds.width, height: viewContent.bounds.height)
        orderView2?.frame = CGRect(x: 0, y: 0, width: viewContent.bounds.width, height: viewContent.bounds.height)
        orderView1.conFig()
        orderView2.conFig()
        views.append(orderView1)
        views.append(orderView2)
            for view in views {
                viewContent.addSubview(view)
            }
        viewContent.bringSubviewToFront(views[0])
        view1.isHidden = false
        view2.isHidden = true
    }
    
    //MARK:-
    //MARK: button function
    @IBAction func chooseProcessing(_ sender: Any) {
        viewContent.bringSubviewToFront(views[0])
        view1.isHidden = false
        view2.isHidden = true
    }
    
    @IBAction func chooseHistory(_ sender: Any) {
        viewContent.bringSubviewToFront(views[1])
        view1.isHidden = true
        view2.isHidden = false
    }
}
