//
//  PlacesTableView.swift
//  MBN
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 05/07/23.
//

import UIKit

class PlacesTableView: UITableView {
    
    weak var placesDelegate: PlacesDelegate? = nil
    private var places: [PlaceMBN] = [
        PlaceMBN(title: "titulo 1", street: "Rua 1", neighborhood: "Bairro 1", zipCode: "0001", phoneNumber: "0001"),
        PlaceMBN(title: "titulo 2", street: "Rua 2", neighborhood: "Bairro 2", zipCode: "0002", phoneNumber: "0002"),
        PlaceMBN(title: "titulo 3", street: "Rua 3", neighborhood: "Bairro 3", zipCode: "0003", phoneNumber: "0003")
    ]
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        self.dataSource = self
        self.delegate = self
        self.register(PlacesTableViewCell.self, forCellReuseIdentifier: "PlacesTableViewCell")
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PlacesTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.places.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlacesTableViewCell") as! PlacesTableViewCell
        cell.title.text = self.places[indexPath.row].title
        cell.street.text = self.places[indexPath.row].street
        return cell
    }
    
    
}

extension PlacesTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.deselectRow(at: indexPath, animated: true)
        self.placesDelegate?.showPlace(place: places[indexPath.row])
    }
}


