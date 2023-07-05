//
//  InfoTableViewCell.swift
//  MBN
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 05/07/23.
//

import UIKit

class InfoTableViewCell: UITableViewCell {
    
    var container: UIView = {
        let container = UIView()
        container.backgroundColor = .white
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    var image: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    var title: UILabel = {
        let title = UILabel()
        title.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        title.textColor = UIColor(named: "MBNBlue")
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    var chevron: UIImageView = {
        let chevron = UIImageView()
        chevron.image = UIImage(systemName: "chevron.right")
        chevron.tintColor = UIColor(named: "MBNBlue")
        chevron.contentMode = .scaleAspectFit
        chevron.translatesAutoresizingMaskIntoConstraints = false
        return chevron
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupViewConfiguration()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension InfoTableViewCell: ViewCode {
    func buildViewHierarchy() {
        [self.container, self.image, self.title, self.chevron].forEach({self.addSubview($0)})
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            self.container.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            self.container.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.container.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.container.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5)
        ])
        NSLayoutConstraint.activate([
            self.image.centerYAnchor.constraint(equalTo: self.container.centerYAnchor),
            self.image.leadingAnchor.constraint(equalTo: self.container.leadingAnchor, constant: 15),
            self.image.trailingAnchor.constraint(equalTo: self.title.leadingAnchor, constant: -10)
        ])
        NSLayoutConstraint.activate([
            self.title.centerYAnchor.constraint(equalTo: self.container.centerYAnchor),
            self.title.leadingAnchor.constraint(equalTo: self.image.trailingAnchor, constant: 10)
        ])
        NSLayoutConstraint.activate([
            self.chevron.centerYAnchor.constraint(equalTo: self.container.centerYAnchor),
            self.chevron.trailingAnchor.constraint(equalTo: self.container.trailingAnchor, constant: -15)
        ])
        
    }
    
    func setupAdditionalConfiguration() {
        self.container.layer.cornerRadius = 10
        self.backgroundView = .none
        self.backgroundColor = .clear
    }
}
