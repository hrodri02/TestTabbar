//
//  ViewController.swift
//  TestTabbar
//
//  Created by Eri on 1/15/19.
//  Copyright © 2019 Eri. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let myProgramVC = UINavigationController(rootViewController: MyProgramVC())
        myProgramVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        
        let secondViewController = UINavigationController(rootViewController: SecondVC())
        secondViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 1)
        
        let tabBarList = [myProgramVC, secondViewController]
        viewControllers = tabBarList
        
        self.tabBar.barTintColor = UIColor.black
        self.tabBar.tintColor = UIColor.white
        self.tabBar.isTranslucent = false
    }
    
}

