//
//  HinarioDataLoader.swift
//  MBN
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 27/06/23.
//

import Foundation

class HinarioDataLoader {
    private var response: (() -> Void)
    var hinarioList = [Hinario]()
    
    init(response: @escaping (() -> Void)) {
        self.response = response
    }
    
    func loadData() {
        if let jsonFile = Bundle.main.path(forResource: "hinarioJSON", ofType: "json") {
            do {
                guard let jsonFileContent = try String(contentsOfFile: jsonFile).data(using: .utf8) else {return}
                let jsonDecoder = JSONDecoder()
                let jsonData = try jsonDecoder.decode([Hinario].self, from: jsonFileContent)
                
                DispatchQueue.main.async {
                    self.hinarioList = jsonData
                    self.response()
                }
            } catch {
                print("JSON file could not be decoded.")
            }
        } else {
            print("It wasn't possible to get json file.")
        }
    }
}
