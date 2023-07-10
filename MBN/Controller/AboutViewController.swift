//
//  AboutViewController.swift
//  MBN
//
//  Created by Bruno Lafayette on 06/07/23.
//

import UIKit

class AboutViewController: UIViewController {
    
    private let backgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(patternImage: UIImage(named: "Background")!)
        return view
    }()
    
    private let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let aboutView: AboutView = {
        let aboutView = AboutView()
        aboutView.translatesAutoresizingMaskIntoConstraints = false
        return aboutView
    }()
    
    let titleAttributes: [NSAttributedString.Key: Any] = [
        .foregroundColor: UIColor.white,
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.aboutText()
        self.setupViewConfiguration()
    }
    

}

extension AboutViewController: ViewCode{

    func setupAdditionalConfiguration() {
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Background")!)
        self.navigationController?.navigationBar.titleTextAttributes = titleAttributes
        self.title = "Sobre"
    }
    
    
    func buildViewHierarchy() {
        view.addSubview(backgroundView)
        view.addSubview(containerView)
        containerView.addSubview(aboutView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            containerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            aboutView.topAnchor.constraint(equalTo: containerView.topAnchor),
            aboutView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            aboutView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            aboutView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
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
