//
//  DetailTableView.swift
//  MBN
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 07/07/23.
//

import UIKit

class DetailTableView: UITableView {
    
    var hymn: Hinario? = nil {
        didSet {
            self.reloadData()
        }
    }
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        self.dataSource = self
        self.register(DetailTableViewCell.self, forCellReuseIdentifier: "DetailTableViewCell")
        self.showsVerticalScrollIndicator = false
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // When we don't call super of this function, tableView doesn't have click action
    }
}

extension DetailTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.hymn?.hinarioLyrics.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailTableViewCell") as! DetailTableViewCell
        let hinoText = hymn?.hinarioLyrics[indexPath.row].lines.joined(separator: "\n")
        cell.hino.text = hinoText
        return cell
    }
}
