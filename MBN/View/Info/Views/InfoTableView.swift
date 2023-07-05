//
//  InfoTableView.swift
//  MBN
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 05/07/23.
//

import UIKit

class InfoTableView: UITableView {
    
    weak var infoDelegate: InfoDelegate? = nil
    private var infoOptions: [(image: UIImage?, title: String)] = [
        (image: UIImage(named: "about"), title: "Sobre"),
        (image: UIImage(named: "places"), title: "Locais"),
        (image: UIImage(named: "contact"), title: "Contato"),
        (image: UIImage(named: "privacyPolicy"), title: "Políticas de privacidade"),
    ]
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        self.dataSource = self
        self.delegate = self
        self.register(InfoTableViewCell.self, forCellReuseIdentifier: "InfoTableViewCell")
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension InfoTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.infoOptions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "InfoTableViewCell") as! InfoTableViewCell
        cell.image.image = self.infoOptions[indexPath.row].image
        cell.title.text = self.infoOptions[indexPath.row].title
        return cell
    }
    
    
}

extension InfoTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.deselectRow(at: indexPath, animated: true)
    }
}
