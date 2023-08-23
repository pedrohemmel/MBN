//
//  DetailHinoViewController.swift
//  MBN
//
//  Created by Bruno Lafayette on 30/06/23.
//

import UIKit

class DetailHinoViewController: UIViewController {
    
    weak var favoriteDataDelegate: FavoriteDataDelegate? = nil
    
    var hymn: Hinario? = nil
    let detailView = DetailHinoView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = self.detailView
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Background")!)
        
        let favoriteBtn = UIBarButtonItem(image: nil, style: .plain, target: self, action: nil)
        favoriteBtn.tag = hymn?.hinarioId ?? 0
        if self.verifyFavoriteHymn(hymn: self.hymn ?? Hinario(hinarioId: .zero, hinarioName: String(), hinarioLyrics: [Paragraph]())) {
            favoriteBtn.image = UIImage(systemName: "star.fill")
            favoriteBtn.action = #selector(self.deselectFavoriteHino)
        } else {
            favoriteBtn.image = UIImage(systemName: "star")
            favoriteBtn.action = #selector(self.selectFavoriteHino)
        }
        favoriteBtn.tintColor = .white
        self.navigationItem.rightBarButtonItem = favoriteBtn
    }

}

extension DetailHinoViewController{
    func setup(_ hino: Hinario){
        self.detailView.title.text = hino.hinarioName
        self.detailView.detailTableView.hymn = hino
    }
    
    func verifyFavoriteHymn(hymn: Hinario) -> Bool {
        if let favoriteHinario = UserDefaults.standard.array(forKey: "hinario") as? [Int] {
            if favoriteHinario.contains(where: {$0 == hymn.hinarioId}) {
                return true
            }
        }
        return false
    }
    
    @objc func selectFavoriteHino(button: UIButton) {
        if let favoriteHinario = UserDefaults.standard.array(forKey: "hinario") as? [Int] {
            var newFavoriteHinario = favoriteHinario
            if !newFavoriteHinario.contains(button.tag) {
                newFavoriteHinario.append(button.tag)
                UserDefaults.standard.set(newFavoriteHinario, forKey: "hinario")
                self.navigationItem.rightBarButtonItem?.image = UIImage(systemName: "star.fill")
                self.navigationItem.rightBarButtonItem?.action = #selector(self.deselectFavoriteHino)
            }
        } else {
            UserDefaults.standard.setValue([button.tag], forKey: "hinario")
            self.navigationItem.rightBarButtonItem?.image = UIImage(systemName: "star.fill")
            self.navigationItem.rightBarButtonItem?.action = #selector(self.deselectFavoriteHino)
        }
        self.favoriteDataDelegate?.didSelectFavoriteButton()
    }
    
    @objc func deselectFavoriteHino(button: UIButton) {
        if let favoriteHinario = UserDefaults.standard.array(forKey: "hinario") as? [Int] {
            var newFavoriteHinario = favoriteHinario
            if newFavoriteHinario.contains(button.tag) {
                newFavoriteHinario.remove(at: newFavoriteHinario.firstIndex(where: {$0 == button.tag}) ?? 0)
                UserDefaults.standard.set(newFavoriteHinario, forKey: "hinario")
                self.navigationItem.rightBarButtonItem?.image = UIImage(systemName: "star")
                self.navigationItem.rightBarButtonItem?.action = #selector(self.selectFavoriteHino)
            }
        }
        self.favoriteDataDelegate?.didSelectFavoriteButton()
    }
}
