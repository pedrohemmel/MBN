//
//  DetailTableViewCell.swift
//  MBN
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 07/07/23.
//

import UIKit

class DetailTableViewCell: UITableViewCell {
    
    lazy var hino: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupViewConfiguration()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DetailTableViewCell: ViewCode {
    func buildViewHierarchy() {
        [self.hino].forEach({self.addSubview($0)})
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            self.hino.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            self.hino.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.hino.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.hino.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5)
        ])
    }
    
    func setupAdditionalConfiguration() {
        self.backgroundView = .none
        self.backgroundColor = .clear
    }
}
