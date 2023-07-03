//
//  HomeViewController.swift
//  MBN
//
//  Created by Bruno Lafayette on 29/06/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    lazy var homeView = HomeView()
    
    override func loadView() {
        super.loadView()
        self.view = homeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let titleAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.white,
        ]
        self.navigationController?.navigationBar.titleTextAttributes = titleAttributes
        
        self.title = "Missão boa noticia"
        
        self.homeView.setupDismissAction {
            self.dismiss(animated: false)
        }
    }
}

extension HomeViewController: HinoDelegate{
    func showHino(hino: Hinario) {
        let hinoVC = DetailHinoViewController()
        hinoVC.setup(hino)
        hinoVC.title = "Hino"
        
        let backBtn = UIBarButtonItem(title: "Voltar", style: .plain, target: self, action: #selector(back))
        backBtn.tintColor = .white
        hinoVC.navigationItem.leftBarButtonItem = backBtn
        
        let favoriteBtn = UIBarButtonItem(image: UIImage(systemName: "star"), style: .plain, target: self, action: #selector(favoriteHino))
        favoriteBtn.tintColor = .white
        hinoVC.navigationItem.rightBarButtonItem = favoriteBtn
        self.navigationController?.pushViewController(hinoVC, animated: true)
    }
}

extension HomeViewController {
    func setup(_ list: [Hinario]){
        self.homeView.hinario.setup(list, self)
    }
    
    @objc func back() {
        self.navigationController?.popViewController(animated: true)
    }

    @objc func favoriteHino() {

    }
}


