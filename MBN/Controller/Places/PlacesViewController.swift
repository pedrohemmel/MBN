//
//  PlacesViewController.swift
//  MBN
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 05/07/23.
//

import UIKit

class PlacesViewController: UIViewController {
    var placesView = PlacesView()
    
    override func loadView() {
        super.loadView()
        self.view = placesView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Locais"
        self.placesView.placesTableView.placesDelegate = self
    }
}

extension PlacesViewController: PlacesDelegate {
    func showPlace(place: PlaceMBN) {
        let newVC = PlaceViewController()
        newVC.placeView.setupInformation(place: place)
        newVC.sheetPresentationController?.detents = [.medium()]
        present(newVC, animated: true)
    }
}

extension PlacesViewController {
    @objc func back() {
        self.navigationController?.popViewController(animated: true)
    }
}
