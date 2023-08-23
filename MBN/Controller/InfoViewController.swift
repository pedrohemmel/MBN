//
//  InfoViewController.swift
//  MBN
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 05/07/23.
//

import UIKit
import MessageUI

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
        let newVC = AboutViewController()
        let backBtn = UIBarButtonItem(title: "Voltar", style: .plain, target: self, action: #selector(back))
        backBtn.tintColor = .white
        newVC.navigationItem.leftBarButtonItem = backBtn
        
        self.navigationController?.pushViewController(newVC, animated: true)
    }
    
    func didSelectPlacesSection() {
        let newVC = PlacesViewController()
        let backBtn = UIBarButtonItem(title: "Voltar", style: .plain, target: self, action: #selector(back))
        backBtn.tintColor = .white
        newVC.navigationItem.leftBarButtonItem = backBtn
        
        self.navigationController?.pushViewController(newVC, animated: true)
    }
    
    func didSelectContactSection() {
        if MFMailComposeViewController.canSendMail() {
            let mailComposeViewController = MFMailComposeViewController()
            mailComposeViewController.mailComposeDelegate = self
            mailComposeViewController.setToRecipients(["phenrique_h2016@hotmail.com"])
//           mailComposeViewController.setToRecipients(["contato@missaoboanoticia.org.br"])
            mailComposeViewController.setSubject("E-mail para contato com Missão Boa Notícia pelo aplicativo iOS.")
            mailComposeViewController.setMessageBody("<Digite sua mensagem aqui>", isHTML: false)
           
            present(mailComposeViewController, animated: true, completion: nil)
       } else {
           let alertController = UIAlertController(title: "Erro", message: "Seu dispositivo não está habilitado para mandar e-mail.", preferredStyle: .alert)
           let okayAction = UIAlertAction(title: "OK", style: .default, handler: nil)
           alertController.addAction(okayAction)
           present(alertController, animated: true, completion: nil)
       }
    }
    
    func didSelectPrivacyPolicySection() {
        let newVC = PrivacyPoliciesControllerViewController()
        let backBtn = UIBarButtonItem(title: "Voltar", style: .plain, target: self, action: #selector(back))
        backBtn.tintColor = .white
        newVC.navigationItem.leftBarButtonItem = backBtn
        
        self.navigationController?.pushViewController(newVC, animated: true)
    }
}

extension InfoViewController: MFMailComposeViewControllerDelegate {
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
}

extension InfoViewController {
    @objc func back() {
        self.navigationController?.popViewController(animated: true)
    }
}
