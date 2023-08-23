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
    
    lazy var detailTableView: DetailTableView = {
        let detailTableView = DetailTableView()
        detailTableView.backgroundColor = .clear
        detailTableView.separatorColor = .white
        detailTableView .separatorStyle = .none
        detailTableView.translatesAutoresizingMaskIntoConstraints = false
        return detailTableView
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
        [self.title, self.detailTableView].forEach({self.addSubview($0)})
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            self.title.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            self.title.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.title.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.title.bottomAnchor.constraint(equalTo: self.detailTableView.topAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            self.detailTableView.topAnchor.constraint(equalTo: self.title.bottomAnchor),
            self.detailTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.detailTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.detailTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    func setupAdditionalConfiguration() {

    }
    
    
}
