//
//  HinarioTableViewController.swift
//  MBN
//
//  Created by Bruno Lafayette on 29/06/23.
//

import UIKit

class HinarioTableView: UITableView {
    
    var hinario = [Hinario]()
    weak var hinoDelegate: HinoDelegate? = nil

    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        setupAdditionalConfiguration()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HinarioTableView: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(hinario.count)
        return hinario.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HinoTableViewCell") as! HinoTableViewCell
        cell.title.text = "\(hinario[indexPath.row].hinarioId). \(hinario[indexPath.row].hinarioName)"
        cell.subTitle.text = "\"\(hinario[indexPath.row].hinarioLyrics[0].lines[0]) \(hinario[indexPath.row].hinarioLyrics[0].lines[1])...\""
        let image = UIImage(systemName: "chevron.right")
        let accessory  = UIImageView(frame:CGRect(x:0, y:0, width:(image?.size.width)!, height:(image?.size.height)!))
        accessory.image = image
        accessory.tintColor = UIColor.white
        cell.accessoryView = accessory
        cell.backgroundColor = .clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView()
        return view
    }
}

extension HinarioTableView: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.hinoDelegate?.showHino(hino: hinario[indexPath.row])
    }
}

extension HinarioTableView{
    func setup(_ list: [Hinario],_ hinoDelegate: HinoDelegate?){
        self.hinario = list
        self.hinoDelegate = hinoDelegate
        self.reloadData()
    }
    
    func setupAdditionalConfiguration() {
        self.register(HinoTableViewCell.self, forCellReuseIdentifier: "HinoTableViewCell")
        self.delegate = self
        self.dataSource = self
    }
}
