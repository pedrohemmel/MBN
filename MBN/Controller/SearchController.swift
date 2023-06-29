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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .green
        self.hinarioDataLoader.loadData()
        self.view.addSubview(label)
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

