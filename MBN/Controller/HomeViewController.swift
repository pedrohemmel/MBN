//
//  HomeViewController.swift
//  MBN
//
//  Created by Bruno Lafayette on 29/06/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    
    weak var tabBarControlDelegate: TabBarControlDelegate? = nil
    var currentController = String()
    weak var hinoDelegate: HinoDelegate? = nil
    private let homeView = HomeView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = self.homeView
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Background")!)
    }
}

extension HomeViewController {
    func setup() {
        
    }
}


