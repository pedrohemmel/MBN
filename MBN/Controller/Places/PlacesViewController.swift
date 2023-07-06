//
//  PlacesViewController.swift
//  MBN
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 05/07/23.
//

import UIKit

class PlacesViewController: UIViewController {
    
    lazy var placesMBNDataLoader = PlacesMBNDataLoader(response: {
        self.getPlacesMBNData()
    })
    
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
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.placesMBNDataLoader.loadData()
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

extension PlacesViewController: PlacesMBNCRUDDelegate {
    func getPlacesMBNData() {
        self.placesView.placesTableView.setup(places: self.placesMBNDataLoader.places)
    }
}

extension PlacesViewController {
    @objc func back() {
        self.navigationController?.popViewController(animated: true)
    }
}
