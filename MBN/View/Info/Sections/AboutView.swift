//
//  AboutView.swift
//  MBN
//
//  Created by Bruno Lafayette on 06/07/23.
//

import UIKit

class AboutView: UIView {
    
    private let label: UILabel = {
        var label = UILabel()
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

extension AboutView: ViewCode{
    func buildViewHierarchy() {
        [self.label].forEach({self.addSubview($0)})
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            label.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
        ])
    }
    
    func setupAdditionalConfiguration() {
    
    }
    
    func setup(text: String){
        self.label.text = text
    }
    
}
