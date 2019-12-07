//
//  SejourDetailViewController.swift
//  Discover Tunisia
//
//  Created by Khalil nouisser on 11/25/19.
//  Copyright © 2019 Streamerz. All rights reserved.
//

import UIKit

class SejourDetailViewController: UITableViewController {

    var list : [MonSejourElement] = []
    var sejour: Sejour!
    
    @IBOutlet weak var coverUIImage : UIImageView!
    @IBOutlet weak var titleUILabel : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.alpha = 0
        coverUIImage.setImage(url: sejour.cover, defaultImage: "empty_image", "https://www.discovertunisia.com/sites/default/files/75258657_1035885843432340_8419676500634107904_o-1.jpg")
        titleUILabel.text = sejour.name ?? ""
        APIService.getListSejourElementsById(id: sejour.id ?? "") { (list, error) in
            if error == nil {
                self.list = list ?? []
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.alpha = 0
    }
    
    @IBAction func goBack(){
        self.navigationController?.navigationBar.alpha = 1
        self.navigationController?.popViewController(animated: true)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 1 : list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "header", for: indexPath)
            cell.selectionStyle = .none
            return cell
        }
        if let cell = tableView.dequeueReusableCell(withIdentifier: "sejourItemCell", for: indexPath) as? SejourItemTableViewCell {
            cell.initElements(title: list[indexPath.row].name ?? "", imageUrl: list[indexPath.row].thumbnail ?? "")
            cell.selectionStyle = .none
            return cell
        }
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = self.storyboard?.instantiateViewController(identifier: "DetailSejourItemViewController") as? DetailSejourItemViewController {
            vc.sejour = self.list[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }

}
