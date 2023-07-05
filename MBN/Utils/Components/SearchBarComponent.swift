//
//  SearchBarComponent.swift
//  MBN
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 30/06/23.
//

import UIKit

class SearchBarComponent: UISearchBar {
    
    weak var searchBarDelegate: SearchBarDelegate? = nil
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupViewConfiguration()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension SearchBarComponent: ViewCode {
    func buildViewHierarchy() {
    }
    
    func setupConstraints() {
    }
    
    func setupAdditionalConfiguration() {
        self.delegate = self
        self.layer.borderWidth = 1;
        self.layer.borderColor = UIColor.clear.cgColor
        self.searchBarStyle = UISearchBar.Style.minimal
        
        self.searchTextField.layer.cornerRadius = 10
        
        self.searchTextField.background = .none
        self.searchTextField.backgroundColor = .white
    }
}

extension SearchBarComponent: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        searchViewController?.filterFoods(with: searchText)
        searchBarDelegate?.search(text: searchText)
    }
}

