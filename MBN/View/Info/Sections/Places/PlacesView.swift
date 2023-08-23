//
//  PlacesView.swift
//  MBN
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 05/07/23.
//

import UIKit

class PlacesView: UIView {
    
    var placesTableView: PlacesTableView = {
        let placesTableView = PlacesTableView()
        placesTableView.backgroundColor = .clear
        placesTableView.backgroundView = .none
        placesTableView.separatorStyle = .none
        placesTableView.translatesAutoresizingMaskIntoConstraints = false
        return placesTableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupViewConfiguration()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PlacesView: ViewCode {
    func buildViewHierarchy() {
        [self.placesTableView].forEach({self.addSubview($0)})
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            self.placesTableView.topAnchor.constraint(equalTo: self.topAnchor),
            self.placesTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.placesTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.placesTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
    }
    
    func setupAdditionalConfiguration() {
        self.backgroundColor = UIColor(patternImage: UIImage(named: "Background")!)
    }
}
