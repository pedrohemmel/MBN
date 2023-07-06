//
//  DetailHinoView.swift
//  MBN
//
//  Created by Bruno Lafayette on 30/06/23.
//

import UIKit

class DetailHinoView: UIView {
    
    weak var hinoDelegate: HinoDelegate? = nil
    
    lazy var title: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
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
        self.scrollView.addSubview(self.hino)
        [self.title, self.scrollView].forEach({self.addSubview($0)})
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            self.title.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            self.title.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.title.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.title.bottomAnchor.constraint(equalTo: self.scrollView.topAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            self.scrollView.topAnchor.constraint(equalTo: self.title.bottomAnchor, constant: 20),
            self.scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            
        ])
        
        NSLayoutConstraint.activate([
            self.hino.topAnchor.constraint(equalTo: self.scrollView.bottomAnchor),
            self.hino.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor),
            self.hino.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor),
            self.hino.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor)
        ])
    }
    
    func setupAdditionalConfiguration() {
        self.scrollView.isScrollEnabled = true
    }
}
