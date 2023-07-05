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
        let newVC = PlacesViewController()
        let backBtn = UIBarButtonItem(title: "Voltar", style: .plain, target: self, action: #selector(back))
        backBtn.tintColor = .white
        newVC.navigationItem.leftBarButtonItem = backBtn
        
        self.navigationController?.pushViewController(newVC, animated: true)
    }
    
    func didSelectContactSection() {
        
    }
    
    func didSelectPrivacyPolicySection() {
        
    }
}

extension InfoViewController {
    @objc func back() {
        self.navigationController?.popViewController(animated: true)
    }
}
