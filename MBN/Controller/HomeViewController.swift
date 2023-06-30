//
//  HomeViewController.swift
//  MBN
//
//  Created by Bruno Lafayette on 29/06/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    lazy var hinarioDataLoader = HinarioDataLoader(response: {
        self.dataArrived = true
        self.getHinarioData()
    })
    weak var hinoDelegate: HinoDelegate? = nil
    private var dataArrived = false
    private var hinario = [Hinario]()
    private let homeView = HomeView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hinarioDataLoader.loadData()
        self.view = self.homeView
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Background")!)
    }
}

extension HomeViewController: HinarioCRUDDelegate {
    func getHinarioData() {
        self.hinario = self.hinarioDataLoader.hinarioList
        self.homeView.hinario.setup(hinario, hinoDelegate)
    }
}
