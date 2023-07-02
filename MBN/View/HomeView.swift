//
//  HomeView.swift
//  MBN
//
//  Created by Bruno Lafayette on 29/06/23.
//

import UIKit

class HomeView: UIView {
    
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
        [self.search, self.hinario].forEach({ self.addSubview($0)})
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
    }
    
    func setupAdditionalConfiguration() {
    
    }
    
    
}
