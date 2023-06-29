//
//  protocols.swift
//  MBN
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 27/06/23.
//

import Foundation

protocol HinarioCRUDDelegate: AnyObject {
    func getHinarioData()
}

protocol ViewCode {
    func buildViewHierarchy()
    func setupConstraints()
    func setupAdditionalConfiguration()
    func setupViewConfiguration()
}

extension ViewCode {
    func setupViewConfiguration() {
        buildViewHierarchy()
        setupConstraints()
        setupAdditionalConfiguration()
    }
}
