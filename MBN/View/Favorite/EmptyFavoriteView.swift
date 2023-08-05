//
//  EmptyFavoriteView.swift
//  MBN
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 05/07/23.
//

import UIKit

class EmptyFavoriteView: UIView {
    
    private let screenHeight = UIScreen.main.bounds.height
    private var dismissAction: (() -> Void)?
    private var image: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "bookEmptyFavorite")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private var label: UILabel = {
        let label = UILabel()
        label.text = "Sem hinos favoritados até o momento."
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 12, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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

extension EmptyFavoriteView: ViewCode {
    func buildViewHierarchy() {
        [self.image, self.label, self.tabBar].forEach({self.addSubview($0)})
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            self.image.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.image.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            self.label.topAnchor.constraint(equalTo: self.image.bottomAnchor),
            self.label.centerXAnchor.constraint(equalTo: self.centerXAnchor)
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

extension EmptyFavoriteView {
    func setupDismissAction(dismissAction: @escaping (() -> Void)) {
        self.dismissAction = dismissAction
    }
}
