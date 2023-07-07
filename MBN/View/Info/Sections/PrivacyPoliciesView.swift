//
//  PrivacyPoliciesView.swift
//  MBN
//
//  Created by Bruno Lafayette on 06/07/23.
//

import UIKit

class PrivacyPoliciesView: UIScrollView {

    private let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.numberOfLines = 0
        label.textColor = .white
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

extension PrivacyPoliciesView: ViewCode {
    
    func buildViewHierarchy() {
        self.addSubview(label)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            label.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            label.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),
            label.widthAnchor.constraint(equalTo: widthAnchor, constant: -40)
            ])
    }
    
    func setupAdditionalConfiguration() {
        self.showsVerticalScrollIndicator = true
        self.showsHorizontalScrollIndicator = false
        self.alwaysBounceVertical = true 
        self.backgroundColor = .clear
    }
    
    func setup(text: String) {
        self.label.text = text
    }
}
