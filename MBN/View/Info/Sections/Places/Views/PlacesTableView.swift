//
//  PlacesTableView.swift
//  MBN
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 05/07/23.
//

import UIKit

class PlacesTableView: UITableView {
    
    weak var placesDelegate: PlacesDelegate? = nil
    private var placesMBN = [PlaceMBN]()
    
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
        return self.placesMBN.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlacesTableViewCell") as! PlacesTableViewCell
        cell.title.text = self.placesMBN[indexPath.row].title
        cell.street.text = self.placesMBN[indexPath.row].street
        return cell
    }
}

extension PlacesTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.deselectRow(at: indexPath, animated: true)
        self.placesDelegate?.showPlace(place: placesMBN[indexPath.row])
    }
}

extension PlacesTableView {
    func setup(places: [PlaceMBN]) {
        self.placesMBN = places
        self.reloadData()
    }
}


