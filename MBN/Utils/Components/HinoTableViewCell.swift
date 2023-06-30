//
//  HinoTableViewCell.swift
//  MBN
//
//  Created by Bruno Lafayette on 29/06/23.
//

import UIKit

class HinoTableViewCell: UITableViewCell {
    
    let title: UILabel = {
        let text = UILabel()
        text.numberOfLines = 0
        text.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        text.textColor = .white
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    let subTitle: UILabel = {
        let text = UILabel()
        text.numberOfLines = 2
        text.font = UIFont.systemFont(ofSize: 12, weight: .light)
        text.textColor = .white
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupViewConfiguration()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension HinoTableViewCell: ViewCode{
    func buildViewHierarchy() {
        [self.title, self.subTitle].forEach({self.addSubview($0)})
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            self.title.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            self.title.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.title.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.title.bottomAnchor.constraint(equalTo: self.subTitle.topAnchor, constant: -5)
        ])
        
        NSLayoutConstraint.activate([
            self.subTitle.topAnchor.constraint(equalTo: self.title.bottomAnchor, constant: 5),
            self.subTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.subTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -50),
        ])
    }
    
    func setupAdditionalConfiguration() {
        
    }
    
    
}
