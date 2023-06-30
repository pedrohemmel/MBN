//
//  TabBarController.swift
//  MBN
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 29/06/23.
//

import UIKit

protocol TabBarControlDelegate: AnyObject {
    func didTapHomeScreen()
    func didTapFavoriteScreen()
    func didTapInfoScreen()
}

class TabBarController: UIViewController {
    
    private var currentScreen = "search"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.setCurrentScreen()
    }
}

extension TabBarController: TabBarControlDelegate {
    func didTapHomeScreen() {
        self.currentScreen = "search"
        let newVC = SearchController()
//        newVC.tabBar.tabBarControlDelegate = self
//        newVC.tabBar.currentController = "search"
        newVC.modalPresentationStyle = .fullScreen
        self.present(newVC, animated: false)
    }
    
    func didTapFavoriteScreen() {
        self.currentScreen = "favorite"
        let newVC = ExampleController()
        newVC.tabBar.tabBarControlDelegate = self
        newVC.tabBar.currentController = "favorite"
        newVC.modalPresentationStyle = .fullScreen
        self.present(newVC, animated: false)
    }
    
    func didTapInfoScreen() {
        self.currentScreen = "info"
        let newVC = Example2Controller()
        newVC.modalPresentationStyle = .fullScreen
        self.present(newVC, animated: false)
    } 
}

extension TabBarController {
    func setCurrentScreen() {
        switch self.currentScreen {
        case "search":
            self.didTapHomeScreen()
        case "favorite":
            self.didTapFavoriteScreen()
        case "info":
            self.didTapInfoScreen()
        default:
            self.didTapHomeScreen()
        }
    }
}
