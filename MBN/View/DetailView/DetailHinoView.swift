//
//  DetailHinoView.swift
//  MBN
//
//  Created by Bruno Lafayette on 30/06/23.
//

import UIKit

class DetailHinoView: UIView {
    
    lazy var title: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var hino: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupViewConfiguration()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension DetailHinoView: ViewCode {
    func buildViewHierarchy() {
        [self.title, self.hino].forEach({self.addSubview($0)})
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            self.title.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            self.title.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.title.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.title.bottomAnchor.constraint(equalTo: self.hino.topAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            self.hino.topAnchor.constraint(equalTo: self.title.bottomAnchor),
            self.hino.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.hino.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
        ])
    }
    
    func setupAdditionalConfiguration() {

    }
    
    
}
