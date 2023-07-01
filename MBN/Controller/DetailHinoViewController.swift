//
//  DetailHinoViewController.swift
//  MBN
//
//  Created by Bruno Lafayette on 30/06/23.
//

import UIKit

class DetailHinoViewController: UIViewController {
    
    let detailView = DetailHinoView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = self.detailView
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Background")!)
    }

}

extension DetailHinoViewController{
    func setup(_ hino: Hinario){
        self.detailView.title.text = hino.hinarioName
        let hinoText = hino.hinarioLyrics.map { $0.lines.joined(separator: "\n") }.joined(separator: "\n\n")
        self.detailView.hino.text = hinoText
    }
}
