//
//  PlaceViewController.swift
//  MBN
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 05/07/23.
//

import UIKit

class PlaceViewController: UIViewController {
    
    var placeView = PlaceView()
    
    override func loadView() {
        super.loadView()
        self.view = placeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
