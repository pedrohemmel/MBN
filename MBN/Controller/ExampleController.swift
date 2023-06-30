//
//  ExampleController.swift
//  MBN
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 29/06/23.
//

import UIKit

class ExampleController: UIViewController {
    
    lazy var tabBar = {
        let tabBar = TabBarComponent(frame: .zero) {
            self.dismiss(animated: false)
        }
        tabBar.currentController = "search"
        tabBar.translatesAutoresizingMaskIntoConstraints = false
        return tabBar
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .blue
        self.view.addSubview(tabBar)
        self.tabBar.layer.cornerRadius = self.view.frame.height * 0.05
        
        NSLayoutConstraint.activate([
            self.tabBar.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.tabBar.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            self.tabBar.widthAnchor.constraint(equalToConstant: self.view.frame.width * 0.5),
            self.tabBar.heightAnchor.constraint(equalToConstant: self.view.frame.height * 0.1)
        ])
    }
}
