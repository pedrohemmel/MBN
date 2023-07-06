//
//  AboutViewController.swift
//  MBN
//
//  Created by Bruno Lafayette on 06/07/23.
//

import UIKit

class AboutViewController: UIViewController {
    
    let aboutView = AboutView()
    let titleAttributes: [NSAttributedString.Key: Any] = [
        .foregroundColor: UIColor.white,
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.aboutText()
        self.view = self.aboutView
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Background")!)
        self.navigationController?.navigationBar.titleTextAttributes = titleAttributes
        self.title = "Sobre"
    }
    

}

extension AboutViewController{
    func aboutText(){
        if let path = Bundle.main.path(forResource: "MBNInfo", ofType: "strings"),
            let stringsDict = NSDictionary(contentsOfFile: path) as? [String: Any] {
            if let aboutText = stringsDict["about"] as? String {
                self.aboutView.setup(text: aboutText)
            }
        }
    }
}
