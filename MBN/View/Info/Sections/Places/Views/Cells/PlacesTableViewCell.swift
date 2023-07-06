//
//  PlacesTableViewCell.swift
//  MBN
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 05/07/23.
//

import UIKit

class PlacesTableViewCell: UITableViewCell {
    
    var container: UIView = {
        let container = UIView()
        container.backgroundColor = .white
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    var title: UILabel = {
        let title = UILabel()
        title.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        title.textColor = UIColor(named: "MBNBlue")
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    var street: UILabel = {
        let street = UILabel()
        street.font = UIFont.systemFont(ofSize: 14, weight: .light)
        street.textColor = UIColor(named: "MBNBlue")
        street.translatesAutoresizingMaskIntoConstraints = false
        return street
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupViewConfiguration()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PlacesTableViewCell: ViewCode {
    func buildViewHierarchy() {
        [self.container, self.title, self.street].forEach({self.addSubview($0)})
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            self.container.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            self.container.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.container.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.container.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5)
        ])
        NSLayoutConstraint.activate([
            self.title.topAnchor.constraint(equalTo: self.container.topAnchor, constant: 10),
            self.title.bottomAnchor.constraint(equalTo: self.street.topAnchor, constant: -5),
            self.title.leadingAnchor.constraint(equalTo: self.container.leadingAnchor, constant: 15),
            self.title.trailingAnchor.constraint(equalTo: self.container.trailingAnchor, constant: -15)
        ])
        NSLayoutConstraint.activate([
            self.street.topAnchor.constraint(equalTo: self.title.bottomAnchor, constant: 5),
            self.street.bottomAnchor.constraint(equalTo: self.container.bottomAnchor, constant: -10),
            self.street.leadingAnchor.constraint(equalTo: self.container.leadingAnchor, constant: 15),
            self.street.trailingAnchor.constraint(equalTo: self.container.trailingAnchor, constant: -15)
        ])
        
    }
    
    func setupAdditionalConfiguration() {
        self.container.layer.cornerRadius = 10
        self.backgroundView = .none
        self.backgroundColor = .clear
    }
}
