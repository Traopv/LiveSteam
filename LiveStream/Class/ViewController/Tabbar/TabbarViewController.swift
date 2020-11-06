//
//  TabbarViewController.swift
//  LiveStream
//
//  Created by Apple on 10/26/20.
//  Copyright © 2020 ELSAGA-MACOS. All rights reserved.
//

import UIKit

class TabbarViewController: UITabBarController {

    let homeVC = HomeViewController.init()
    let productsVC = ProductsViewController.init()
    let orderVC = OrderViewController.init()
    let notifiVC = NotificationViewController.init()
    let accountVC = AccountViewController.init()
    
    var dataProducts : [Products] = [Products]()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabbar()
    }
    
    //MARK:-
    //MARK: setup tabbar
    func setupTabbar(){
        let vc1 = generateNavController(vc: homeVC, title: "Home", image: #imageLiteral(resourceName: "default"), selectedImage: #imageLiteral(resourceName: "expand"))
        let vc2 = generateNavController(vc: productsVC, title: "Sản phẩm", image: #imageLiteral(resourceName: "default-1"), selectedImage: #imageLiteral(resourceName: "expand-1"))
        let vc3 = generateNavController(vc: orderVC, title: "Đơn hàng", image: #imageLiteral(resourceName: "default-2"), selectedImage: #imageLiteral(resourceName: "expand-2"))
        let vc4 = generateNavController(vc: notifiVC, title: "Thông báo", image: #imageLiteral(resourceName: "default-3"), selectedImage: #imageLiteral(resourceName: "expand-3"))
        let vc5 = generateNavController(vc: accountVC, title: "Tài khoản", image: #imageLiteral(resourceName: "default-4"), selectedImage: #imageLiteral(resourceName: "expand-4"))
        
        UINavigationBar.appearance().prefersLargeTitles = true
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "lato", size: 12.0)!], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "lato", size: 12.0)!], for: .selected)
        UITabBar.appearance().backgroundColor = UIColor(red:255, green:255, blue:255, alpha:1)
        
        viewControllers = [vc1,vc2,vc3,vc4,vc5]
    }
    
    fileprivate func generateNavController(vc: UIViewController,title: String,image: UIImage,selectedImage: UIImage) -> UINavigationController{
        let navController = UINavigationController(rootViewController: vc)
        navController.title = title
        navController.tabBarItem.image = image
        navController.tabBarItem.selectedImage = selectedImage
        self.tabBar.tintColor = UIColor.red
        navController.isNavigationBarHidden = true
        return navController
    }
}
