//
//  FavoriteViewController.swift
//  MBN
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 05/07/23.
//

import UIKit

class FavoriteViewController: UIViewController {
    private var hinario = [Hinario]()
    var favoriteView = FavoriteView()
    var emptyFavoriteView = EmptyFavoriteView()
    
    override func loadView() {
        super.loadView()
        self.setCurrentFavoriteView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let titleAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.white,
        ]
        self.navigationController?.navigationBar.titleTextAttributes = titleAttributes
        
        self.title = "Seus hinos favoritos"
        
        self.favoriteView.setupDismissAction {
            self.dismiss(animated: false)
        }
        self.emptyFavoriteView.setupDismissAction {
            self.dismiss(animated: false)
        }
    }
}

extension FavoriteViewController: FavoriteDataDelegate {
    func didSelectFavoriteButton() {
        self.favoriteView.hinario.setup(filterFavoriteHinario(hinario: self.hinario), self)
        self.setCurrentFavoriteView()
    }
}

extension FavoriteViewController: HinoDelegate{
    func showHino(hino: Hinario) {
        let hinoVC = DetailHinoViewController()
        hinoVC.setup(hino)
        hinoVC.title = "Hino"
        hinoVC.hymn = hino
        hinoVC.favoriteDataDelegate = self
        
        let backBtn = UIBarButtonItem(title: "Voltar", style: .plain, target: self, action: #selector(back))
        backBtn.tintColor = .white
        hinoVC.navigationItem.leftBarButtonItem = backBtn
        
        let favoriteBtn = UIBarButtonItem(image: UIImage(systemName: "star"), style: .plain, target: self, action: #selector(favoriteHino))
        favoriteBtn.tintColor = .white
        hinoVC.navigationItem.rightBarButtonItem = favoriteBtn
        
        self.view.endEditing(true)
        
        self.navigationController?.pushViewController(hinoVC, animated: true)
    }
}

extension FavoriteViewController {
    func setup(_ list: [Hinario], searchBarDelegate: SearchBarDelegate) {
        self.hinario = list
        self.favoriteView.hinario.setup(filterFavoriteHinario(hinario: list), self)
        self.favoriteView.search.searchBarDelegate = searchBarDelegate
    }
    
    func setCurrentFavoriteView() {
        if self.verifyItHasFavoriteHinario() {
            self.view = self.favoriteView
        } else {
            self.view = self.emptyFavoriteView
        }
    }
    
    func verifyItHasFavoriteHinario() -> Bool {
        if let favoriteHinario = UserDefaults.standard.array(forKey: "hinario") as? [Int] {
            if favoriteHinario.count != .zero {
                return true
            }
        }
        return false
    }
    func filterFavoriteHinario(hinario: [Hinario]) -> [Hinario] {
        if let favoriteHinario = UserDefaults.standard.array(forKey: "hinario") as? [Int] {
            var filteredHinario = [Hinario]()
            for hymn in hinario {
                if favoriteHinario.contains(hymn.hinarioId) {
                    filteredHinario.append(hymn)
                }
            }
            return filteredHinario
        } else {
            return [Hinario]()
        }
        
    }
    
    @objc func back() {
        self.navigationController?.popViewController(animated: true)
    }

    @objc func favoriteHino() {

    }
}


