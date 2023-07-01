//
//  HomeView.swift
//  MBN
//
//  Created by Bruno Lafayette on 29/06/23.
//

import UIKit

class HomeView: UIView {
        
    lazy var hinario: HinarioTableView = {
        let hinario = HinarioTableView()
        hinario.rowHeight = 90
        hinario.backgroundColor = .clear
        hinario.separatorColor = .white
        hinario.translatesAutoresizingMaskIntoConstraints = false
        return hinario
    }()
    
    lazy var tabBar = {
        let tabBar = TabBarComponent(frame: .zero) {
//            self.dismiss(animated: false)
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

extension HomeView: ViewCode{
    func buildViewHierarchy() {
        [self.hinario, self.tabBar].forEach({self.addSubview($0)})
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            self.hinario.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.hinario.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.hinario.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.hinario.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            self.tabBar.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.tabBar.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            self.tabBar.widthAnchor.constraint(equalToConstant: self.frame.width * 0.5),
            self.tabBar.heightAnchor.constraint(equalToConstant: self.frame.height * 0.1)
        ])
    }
    
    func setupAdditionalConfiguration() {
        self.tabBar.layer.cornerRadius = self.frame.height * 0.05
    }
}
