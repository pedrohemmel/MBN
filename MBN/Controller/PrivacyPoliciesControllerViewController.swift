//
//  PrivacyPoliciesControllerViewController.swift
//  MBN
//
//  Created by Bruno Lafayette on 06/07/23.
//

import UIKit

class PrivacyPoliciesControllerViewController: UIViewController {
    
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
     
     private let privacyPoliciesView: PrivacyPoliciesView = {
         let view = PrivacyPoliciesView()
         view.translatesAutoresizingMaskIntoConstraints = false
         return view
     }()

    override func viewDidLoad() {
        super.viewDidLoad()
        getTextPrivacyPolicies()
        setupViewConfiguration()
    }
    
}

extension PrivacyPoliciesControllerViewController: ViewCode{

    func setupAdditionalConfiguration() {
        let titleAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.white,
        ]
        self.navigationController?.navigationBar.titleTextAttributes = titleAttributes
        
        self.title = "Políticas de Privacidade"
    }
    
    
    func buildViewHierarchy() {
        view.addSubview(backgroundView)
        view.addSubview(containerView)
        containerView.addSubview(privacyPoliciesView)
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
            
            privacyPoliciesView.topAnchor.constraint(equalTo: containerView.topAnchor),
            privacyPoliciesView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            privacyPoliciesView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            privacyPoliciesView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
    }
    
    func getTextPrivacyPolicies(){
        if let path = Bundle.main.path(forResource: "MBNInfo", ofType: "strings"),
            let stringsDict = NSDictionary(contentsOfFile: path) as? [String: Any] {
            if let privacyText = stringsDict["PrivacyPolicies"] as? String {
                self.privacyPoliciesView.setup(text: privacyText)
            }
        }
    }
}
