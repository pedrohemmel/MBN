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
    
    private var currentScreen = String()
    
    private var homeViewController = HomeViewController()
    private var favoriteViewController = FavoriteViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Background")!)
        self.removeTabBarDefaultBackground()
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
        newVC.homeView.tabBar.tabBarControlDelegate = self
        newVC.homeView.tabBar.currentController = "home"
        newVC.setup(self.hinario, searchBarDelegate: self)
        self.homeViewController = newVC
        let navVC = UINavigationController(rootViewController: self.homeViewController)
        navVC.modalPresentationStyle = .fullScreen
        self.present(navVC, animated: false)
    }
    
    func didTapFavoriteScreen() {
        self.currentScreen = "favorite"
        let newVC = FavoriteViewController()
        newVC.favoriteView.tabBar.tabBarControlDelegate = self
        newVC.favoriteView.tabBar.currentController = "favorite"
        newVC.setup(self.hinario, searchBarDelegate: self)
        self.favoriteViewController = newVC
        let navVC = UINavigationController(rootViewController: self.favoriteViewController)
        navVC.modalPresentationStyle = .fullScreen
        self.present(navVC, animated: false)
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
        if self.currentScreen == String() {
            self.setCurrentScreen()
        }
    }
}

extension TabBarController: SearchBarDelegate {
    func search(text: String) {
        var newHinario = [Hinario]()
        
        for hymn in self.hinario {
            if hymn.hinarioName.lowercased().contains(text.lowercased()) {
                newHinario.append(hymn)
            }
        }
        
        for hymn in self.hinario {
            for paragraph in hymn.hinarioLyrics {
                if paragraph.lines.description.lowercased().contains(text.lowercased()) {
                    if !newHinario.contains(where: { $0.hinarioName == hymn.hinarioName }) {
                        newHinario.append(hymn)
                        break
                    }
                }
            }
        }
        
        if text != "" {
            self.homeViewController.setup(newHinario, searchBarDelegate: self)
            self.favoriteViewController.setup(newHinario, searchBarDelegate: self)
        } else {
            self.homeViewController.setup(self.hinario, searchBarDelegate: self)
            self.favoriteViewController.setup(self.hinario, searchBarDelegate: self)
        }
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
    
    func removeTabBarDefaultBackground() {
        tabBar.backgroundImage = UIImage()
        tabBar.shadowImage = UIImage()
        tabBar.barTintColor = UIColor.clear
        tabBar.isTranslucent = true
    }
    
}
