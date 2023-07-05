//
//  InfoViewController.swift
//  MBN
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 05/07/23.
//

import UIKit

class InfoViewController: UIViewController {
    var infoView = InfoView()
    
    override func loadView() {
        super.loadView()
        self.view = self.infoView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let titleAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.white,
        ]
        self.navigationController?.navigationBar.titleTextAttributes = titleAttributes
        
        self.title = "Informações"
        self.infoView.infoTableView.infoDelegate = self
        self.infoView.setupDismissAction {
            self.dismiss(animated: false)
        }
    }
}

extension InfoViewController: InfoDelegate {
    func didSelectAboutSection() {
        
    }
    
    func didSelectPlacesSection() {
        
    }
    
    func didSelectContactSection() {
        
    }
    
    func didSelectPrivacyPolicySection() {
        
    }
}
