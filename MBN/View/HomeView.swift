//
//  HomeView.swift
//  MBN
//
//  Created by Bruno Lafayette on 29/06/23.
//

import UIKit

class HomeView: UIView {
    
    private let screenWidth = UIScreen.main.bounds.width
    private let screenHeight = UIScreen.main.bounds.height
    private var dismissAction: (() -> Void)?
    lazy var search: SearchBarComponent = {
        let view = SearchBarComponent()
        view.placeholder = "Digite sua pesquisa"
        view.barTintColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var hinario: HinarioTableView = {
        let hinario = HinarioTableView()
        hinario.rowHeight = 90
        hinario.backgroundColor = .clear
        hinario.separatorColor = .white
        hinario.translatesAutoresizingMaskIntoConstraints = false
        return hinario
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

extension HomeView: ViewCode{
    func buildViewHierarchy() {
        [self.hinario, self.search, self.tabBar].forEach({self.addSubview($0)})
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            self.search.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.search.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.search.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.search.bottomAnchor.constraint(equalTo: self.hinario.topAnchor)
        ])
        NSLayoutConstraint.activate([
            self.hinario.topAnchor.constraint(equalTo: self.search.bottomAnchor),
            self.hinario.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.hinario.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.hinario.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            self.tabBar.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.tabBar.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            self.tabBar.widthAnchor.constraint(equalToConstant: (self.screenWidth * 0.5)),
            self.tabBar.heightAnchor.constraint(equalToConstant: (self.screenHeight * 0.1))
        ])
    }
    
    func setupAdditionalConfiguration() {
        self.tabBar.layer.cornerRadius = self.screenHeight * 0.05
        self.backgroundColor = UIColor(patternImage: UIImage(named: "Background")!)
    }
}

//MARK: - Functions here
extension HomeView {
    func setupDismissAction(dismissAction: @escaping (() -> Void)) {
        self.dismissAction = dismissAction
    }
}
