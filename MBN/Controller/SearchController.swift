//
//  SearchController.swift
//  MBN
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 26/06/23.
//

import UIKit

class SearchController: UIViewController {
    lazy var hinarioDataLoader = HinarioDataLoader(response: {
        self.dataArrived = true
        self.getHinarioData()
    })
    private var dataArrived = false
    private var hinarioList = [Hinario]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .green
        self.hinarioDataLoader.loadData()
    }


}

extension SearchController: HinarioCRUDDelegate {
    func getHinarioData() {
        self.hinarioList = self.hinarioDataLoader.hinarioList
        print("\(hinarioList[0].hinarioName)")
    }
}

