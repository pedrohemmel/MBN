//
//  TabBarController.swift
//  MBN
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 29/06/23.
//

import UIKit

class TabBarController: UITabBarController {
    
    var tabBarView = TabBarView()
    override func loadView() {
        super.loadView()
        self.view = tabBarView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}