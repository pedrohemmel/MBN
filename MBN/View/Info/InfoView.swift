//
//  InfoView.swift
//  MBN
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 05/07/23.
//

import UIKit

class InfoView: UIView {
    
    private let screenHeight = UIScreen.main.bounds.height
    private var dismissAction: (() -> Void)?
    
    var infoTableView: InfoTableView = {
        let infoTableView = InfoTableView()
        infoTableView.rowHeight = 60
        infoTableView.backgroundColor = .clear
        infoTableView.backgroundView = .none
        infoTableView.separatorStyle = .none
        infoTableView.translatesAutoresizingMaskIntoConstraints = false
        return infoTableView
    }()
    lazy var tabBar = {
        let tabBar = TabBarComponent(frame: .zero) {
            (self.dismissAction ?? { print("Error: Can't dismiss HomeController")})()
        }
        tabBar.currentController = "home"
        tabBar.translatesAutoresizingMaskIntoConstraints = false
        return tabBar
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupViewConfiguration()
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension InfoView: ViewCode {
    func buildViewHierarchy() {
        [self.infoTableView, self.tabBar].forEach({self.addSubview($0)})
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            self.infoTableView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.infoTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.infoTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.infoTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            self.tabBar.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.tabBar.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            self.tabBar.heightAnchor.constraint(equalToConstant: (self.screenHeight * 0.1))
        ])
    }
    
    func setupAdditionalConfiguration() {
        self.tabBar.layer.cornerRadius = self.screenHeight * 0.05
        self.backgroundColor = UIColor(patternImage: UIImage(named: "Background")!)
    }
}

extension InfoView {
    func setupDismissAction(dismissAction: @escaping (() -> Void)) {
        self.dismissAction = dismissAction
    }
}
