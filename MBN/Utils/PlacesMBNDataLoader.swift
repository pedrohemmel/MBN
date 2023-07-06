//
//  PlacesMBNDataLoader.swift
//  MBN
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 05/07/23.
//

import Foundation

class PlacesMBNDataLoader {
    var places = [PlaceMBN]()
    private var response: (() -> Void)
    
    init(response: @escaping () -> Void) {
        self.response = response
    }
    
    func loadData() {
        if let jsonFile = Bundle.main.path(forResource: "placesMBN", ofType: "json") {
            do {
                guard let jsonFileContent = try String(contentsOfFile: jsonFile).data(using: .utf8) else {return}
                let jsonDecoder = JSONDecoder()
                let jsonData = try jsonDecoder.decode([PlaceMBN].self, from: jsonFileContent)
                
                DispatchQueue.main.async {
                    self.places = jsonData
                    self.response()
                }
            } catch {
                
            }
        } else {
            print("Couldn't find placesMBN.json file.")
        }
    }
}
