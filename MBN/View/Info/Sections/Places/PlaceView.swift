//
//  PlaceView.swift
//  MBN
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 05/07/23.
//

import UIKit

class PlaceView: UIView {
    
    private var title: UILabel = {
        let title = UILabel()
        title.numberOfLines = 0
        title.font = UIFont.systemFont(ofSize: 30, weight: .semibold)
        title.textColor = UIColor(named: "MBNBlue")
        title.textAlignment = .center
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private var street: UILabel = {
        let street = UILabel()
        street.numberOfLines = 0
        street.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        street.textColor = UIColor(named: "MBNBlue")
        street.translatesAutoresizingMaskIntoConstraints = false
        return street
    }()
    
    private var neighborhood: UILabel = {
        let neighborhood = UILabel()
        neighborhood.numberOfLines = 0
        neighborhood.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        neighborhood.textColor = UIColor(named: "MBNBlue")
        neighborhood.translatesAutoresizingMaskIntoConstraints = false
        return neighborhood
    }()
    
    private var zipCode: UILabel = {
        let zipCode = UILabel()
        zipCode.numberOfLines = 0
        zipCode.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        zipCode.textColor = UIColor(named: "MBNBlue")
        zipCode.translatesAutoresizingMaskIntoConstraints = false
        return zipCode
    }()
    
    private var phoneNumber: UILabel = {
        let phoneNumber = UILabel()
        phoneNumber.numberOfLines = 0
        phoneNumber.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        phoneNumber.textColor = UIColor(named: "MBNBlue")
        phoneNumber.translatesAutoresizingMaskIntoConstraints = false
        return phoneNumber
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupViewConfiguration()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PlaceView: ViewCode {
    func buildViewHierarchy() {
        [self.title, self.street, self.neighborhood, self.zipCode, self.phoneNumber].forEach({self.addSubview($0)})
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            self.title.topAnchor.constraint(equalTo: self.topAnchor, constant: 30),
            self.title.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.title.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.title.bottomAnchor.constraint(equalTo: self.street.topAnchor, constant: -30)
        ])
        NSLayoutConstraint.activate([
            self.street.topAnchor.constraint(equalTo: self.title.bottomAnchor, constant: 30),
            self.street.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.street.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.street.bottomAnchor.constraint(equalTo: self.neighborhood.topAnchor, constant: -15)
        ])
        NSLayoutConstraint.activate([
            self.neighborhood.topAnchor.constraint(equalTo: self.street.bottomAnchor, constant: 15),
            self.neighborhood.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.neighborhood.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.neighborhood.bottomAnchor.constraint(equalTo: self.zipCode.topAnchor, constant: -15)
        ])
        NSLayoutConstraint.activate([
            self.zipCode.topAnchor.constraint(equalTo: self.neighborhood.bottomAnchor, constant: 15),
            self.zipCode.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.zipCode.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.zipCode.bottomAnchor.constraint(equalTo: self.phoneNumber.topAnchor, constant: -15)
        ])
        NSLayoutConstraint.activate([
            self.phoneNumber.topAnchor.constraint(equalTo: self.zipCode.bottomAnchor, constant: 15),
            self.phoneNumber.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.phoneNumber.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
        ])
    }
    
    func setupAdditionalConfiguration() {
        self.backgroundColor = .white
    }
}

extension PlaceView {
    func setupInformation(place: PlaceMBN) {
        self.title.text = "\(place.title)"
        self.street.text = "Endereço: \(place.street)"
        self.neighborhood.text = "Bairro: \(place.neighborhood)"
        self.zipCode.text = "CEP: \(place.zipCode)"
        self.phoneNumber.text = "Telefone: \(place.phoneNumber)"
    }
}
