//
//  HomeViewController.swift
//  MBN
//
//  Created by Bruno Lafayette on 29/06/23.
//

import UIKit

class HomeViewController: UIViewController {
    private var hinario = [Hinario]()
    private var detailHinoViewController = DetailHinoViewController()
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
        
        let favoriteBtn = UIBarButtonItem(image: nil, style: .plain, target: self, action: nil)
        favoriteBtn.tag = hino.hinarioId
        if verifyFavoriteHymn(hymn: hino) {
            favoriteBtn.image = UIImage(systemName: "star.fill")
            favoriteBtn.action = #selector(self.deselectFavoriteHino)
        } else {
            favoriteBtn.image = UIImage(systemName: "star")
            favoriteBtn.action = #selector(self.selectFavoriteHino)
        }
        favoriteBtn.tintColor = .white
        hinoVC.navigationItem.rightBarButtonItem = favoriteBtn
        
        self.detailHinoViewController = hinoVC
        
        self.navigationController?.pushViewController(self.detailHinoViewController, animated: true)
    }
}

extension HomeViewController {
    func setup(_ list: [Hinario], searchBarDelegate: SearchBarDelegate){
        self.hinario = list
        self.homeView.hinario.setup(list, self)
        self.homeView.search.searchBarDelegate = searchBarDelegate
    }
    
    func verifyFavoriteHymn(hymn: Hinario) -> Bool {
        if let favoriteHinario = UserDefaults.standard.array(forKey: "hinario") as? [Int] {
            if favoriteHinario.contains(where: {$0 == hymn.hinarioId}) {
                return true
            }
        }
        return false
    }
    
    @objc func back() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func selectFavoriteHino(button: UIButton) {
        if let favoriteHinario = UserDefaults.standard.array(forKey: "hinario") as? [Int] {
            var newFavoriteHinario = favoriteHinario
            if !newFavoriteHinario.contains(button.tag) {
                newFavoriteHinario.append(button.tag)
                UserDefaults.standard.set(newFavoriteHinario, forKey: "hinario")
                self.detailHinoViewController.navigationItem.rightBarButtonItem?.image = UIImage(systemName: "star.fill")
                self.detailHinoViewController.navigationItem.rightBarButtonItem?.action = #selector(self.deselectFavoriteHino)
            }
        } else {
            UserDefaults.standard.setValue([button.tag], forKey: "hinario")
            self.detailHinoViewController.navigationItem.rightBarButtonItem?.image = UIImage(systemName: "star.fill")
            self.detailHinoViewController.navigationItem.rightBarButtonItem?.action = #selector(self.deselectFavoriteHino)
        }
    }
    
    @objc func deselectFavoriteHino(button: UIButton) {
        if let favoriteHinario = UserDefaults.standard.array(forKey: "hinario") as? [Int] {
            var newFavoriteHinario = favoriteHinario
            if newFavoriteHinario.contains(button.tag) {
                newFavoriteHinario.remove(at: newFavoriteHinario.firstIndex(where: {$0 == button.tag}) ?? 0)
                UserDefaults.standard.set(newFavoriteHinario, forKey: "hinario")
                self.detailHinoViewController.navigationItem.rightBarButtonItem?.image = UIImage(systemName: "star")
                self.detailHinoViewController.navigationItem.rightBarButtonItem?.action = #selector(self.selectFavoriteHino)
            }
        }
    }
}


