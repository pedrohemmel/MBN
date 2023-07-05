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

protocol HinoDelegate: AnyObject {
    func showHino(hino: Hinario)
}

protocol SearchBarDelegate: AnyObject {
    func search(text: String)
}

protocol FavoriteDataDelegate: AnyObject {
    func didSelectFavoriteButton()
}

protocol InfoDelegate: AnyObject {
    func didSelectAboutSection()
    func didSelectPlacesSection()
    func didSelectContactSection()
    func didSelectPrivacyPolicySection()
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
