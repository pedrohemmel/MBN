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
    
    private var homeViewController = HomeViewController()
    
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
        self.homeViewController.tabBarControlDelegate = self
        self.homeViewController.currentController = "home"
        self.homeViewController.setup(hinario: self.hinario, searchBarDelegate: self)
        self.homeViewController.modalPresentationStyle = .fullScreen
        self.present(self.homeViewController, animated: false)
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
        
        if text != ""{
            self.homeViewController.setup(hinario: newHinario, searchBarDelegate: self)
        } else {
            self.homeViewController.setup(hinario: self.hinario, searchBarDelegate: self)
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
}
