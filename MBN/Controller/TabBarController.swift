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

class TabBarController: UITabBarController {

    weak var hinoDelegate: HinoDelegate? = nil
    private var dataArrived = false
    private var hinario = [Hinario]()

    lazy var hinarioDataLoader = HinarioDataLoader(response: {
        self.dataArrived = true
        self.getHinarioData()
    })
    
    private var currentScreen = "home"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hinarioDataLoader.loadData()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.setCurrentScreen()
    }
}

extension TabBarController: TabBarControlDelegate {
    func didTapHomeScreen() {
        self.currentScreen = "home"
        let newVC = HomeViewController()
        newVC.setup(self.hinario)
//        newVC.tabBar.tabBarControlDelegate = self
//        newVC.tabBar.currentController = "home"
        let navVC = UINavigationController(rootViewController: newVC)
        navVC.modalPresentationStyle = .fullScreen
        self.present(navVC, animated: false)
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
        case "home":
            self.didTapHomeScreen()
        case "favorite":
            self.didTapFavoriteScreen()
        case "info":
            self.didTapInfoScreen()
        default:
            self.didTapHomeScreen()
        }
    }
    
    func getHinarioData() {
        self.hinario = self.hinarioDataLoader.hinarioList
    }
}
