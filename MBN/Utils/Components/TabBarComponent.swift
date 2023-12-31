//
//  TabBarComponent.swift
//  MBN
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 29/06/23.
//

import UIKit

//MARK: - Instructions to call TabBarComponent
/// 1 - Receive right delegate in tabBarControlDelegate to the screens control
/// 2 - Receive dismiss of the TabBarComponent Controller parent
class TabBarComponent: UIView {
    var dismissAction: (() -> Void)? = nil
    weak var tabBarControlDelegate: TabBarControlDelegate? = nil
    
    var currentController = String() {
        didSet {
            self.setSelectedItem()
            self.setupViewConfiguration()
        }
    }
    
    private lazy var firstItem: UIButton = {
        let firstItem = UIButton()
        firstItem.setImage(UIImage(named: "homeSelected"), for: .normal)
        firstItem.addTarget(self, action: #selector(firstItemAction), for: .touchUpInside)
        firstItem.contentMode = .scaleAspectFill
        firstItem.translatesAutoresizingMaskIntoConstraints = false
        return firstItem
    }()
    private lazy var secondItem: UIButton = {
        let secondItem = UIButton()
        secondItem.setImage(UIImage(named: "star"), for: .normal)
        secondItem.addTarget(self, action: #selector(secondItemAction), for: .touchUpInside)
        secondItem.contentMode = .scaleAspectFit
        secondItem.translatesAutoresizingMaskIntoConstraints = false
        return secondItem
    }()
    private lazy var tertiaryItem: UIButton = {
        let tertiaryItem = UIButton()
        tertiaryItem.setImage(UIImage(named: "info"), for: .normal)
        tertiaryItem.addTarget(self, action: #selector(tertiaryItemAction), for: .touchUpInside)
        tertiaryItem.contentMode = .scaleAspectFit
        tertiaryItem.translatesAutoresizingMaskIntoConstraints = false
        return tertiaryItem
    }()
    
    init(frame: CGRect, dismissAction: @escaping (() -> Void)) {
        self.dismissAction = dismissAction
        super.init(frame: frame)
        self.setupViewConfiguration()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - ViewCode extension
extension TabBarComponent: ViewCode {
    func buildViewHierarchy() {
        [self.firstItem, self.secondItem, self.tertiaryItem].forEach({ self.addSubview($0) })
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            self.firstItem.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.firstItem.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.firstItem.trailingAnchor.constraint(equalTo: self.secondItem.leadingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            self.secondItem.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.secondItem.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.secondItem.leadingAnchor.constraint(equalTo: self.firstItem.trailingAnchor, constant: 20),
            self.secondItem.trailingAnchor.constraint(equalTo: self.tertiaryItem.leadingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            self.tertiaryItem.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.tertiaryItem.leadingAnchor.constraint(equalTo: self.secondItem.trailingAnchor, constant: 20),
            self.tertiaryItem.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
        ])
    }
    
    func setupAdditionalConfiguration() {
        self.backgroundColor = .white
    }
}

//MARK: - Functions here
extension TabBarComponent {
    func setSelectedItem() {
        if self.currentController == "home" {
            self.firstItem.setImage(UIImage(named: "homeSelected"), for: .normal)
            self.secondItem.setImage(UIImage(named: "star"), for: .normal)
            self.tertiaryItem.setImage(UIImage(named: "info"), for: .normal)
        } else if self.currentController == "favorite" {
            self.firstItem.setImage(UIImage(named: "home"), for: .normal)
            self.secondItem.setImage(UIImage(named: "starSelected"), for: .normal)
            self.tertiaryItem.setImage(UIImage(named: "info"), for: .normal)
        } else if self.currentController == "info" {
            self.firstItem.setImage(UIImage(named: "home"), for: .normal)
            self.secondItem.setImage(UIImage(named: "star"), for: .normal)
            self.tertiaryItem.setImage(UIImage(named: "infoSelected"), for: .normal)
        }
    }
    
    @objc func firstItemAction() {
        if self.currentController != "home" {
            guard let dismiss = self.dismissAction else { return }
            dismiss()
            self.tabBarControlDelegate?.didTapHomeScreen()
        }
    }
    
    @objc func secondItemAction() {
        if self.currentController != "favorite" {
            guard let dismiss = self.dismissAction else { return }
            dismiss()
            self.tabBarControlDelegate?.didTapFavoriteScreen()
        }
    }
    
    
    @objc func tertiaryItemAction() {
        if self.currentController != "info" {
            guard let dismiss = self.dismissAction else { return }
            dismiss()
            self.tabBarControlDelegate?.didTapInfoScreen()
        }
    }
}
