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
    
    lazy var hinarioDataLoader = HinarioDataLoader(response: {
        self.getHinarioData()
    })
    private var hinario = [Hinario]()
    private var currentScreen = "home"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.hinarioDataLoader.loadData()
    }
}

extension TabBarController: TabBarControlDelegate {
    func didTapHomeScreen() {
        self.currentScreen = "home"
        let newVC = HomeViewController()
        newVC.tabBarControlDelegate = self
        newVC.currentController = "home"
        newVC.hin
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
extension TabBarController: HinarioCRUDDelegate {
    func getHinarioData() {
        self.hinario = self.hinarioDataLoader.hinarioList
//        self.homeView.hinario.setup(hinario, hinoDelegate)
        self.setCurrentScreen()
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
}
