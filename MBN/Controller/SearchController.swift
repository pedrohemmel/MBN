//
//  SearchController.swift
//  MBN
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 26/06/23.
//

import UIKit

class SearchController: UIViewController {
    lazy var hinarioDataLoader = HinarioDataLoader(response: {
        self.dataArrived = true
        self.getHinarioData()
    })
    private var dataArrived = false
    private var hinarioList = [Hinario]()
    
    private var label = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont(name: "", size: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
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
        self.view.backgroundColor = .green
        self.hinarioDataLoader.loadData()
        self.view.addSubview(label)
        self.view.addSubview(tabBar)
        self.tabBar.layer.cornerRadius = self.view.frame.height * 0.05
        
        NSLayoutConstraint.activate([
            self.tabBar.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.tabBar.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            self.tabBar.widthAnchor.constraint(equalToConstant: self.view.frame.width * 0.5),
            self.tabBar.heightAnchor.constraint(equalToConstant: self.view.frame.height * 0.1)
        ])
        NSLayoutConstraint.activate([
            self.label.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.label.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
    }
}

extension SearchController: HinarioCRUDDelegate {
    func getHinarioData() {
        self.hinarioList = self.hinarioDataLoader.hinarioList
        //test
        self.label.text = self.hinarioList[0].hinarioLyrics[0].lines[0]
    }
}

