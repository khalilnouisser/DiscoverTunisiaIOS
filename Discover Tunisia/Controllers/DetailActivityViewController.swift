//
//  DetailActivityViewController.swift
//  Discover Tunisia
//
//  Created by Khalil nouisser on 11/25/19.
//  Copyright © 2019 Streamerz. All rights reserved.
//

import UIKit

class DetailActivityViewController: UITableViewController {

    var incontournable : Incontournable!
    var list : [IncontournableAddress] = []
    
    @IBOutlet weak var coverUIImage : UIImageView!
    @IBOutlet weak var titleUILabel : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.alpha = 0
        coverUIImage.setImage(url: incontournable.cover, defaultImage: "empty_image", "https://www.discovertunisia.com/sites/default/files/75258657_1035885843432340_8419676500634107904_o-1.jpg")
        titleUILabel.text = incontournable.type ?? ""
        APIService.getListAdressesIncoutournable(id: incontournable.id ?? "") { (list, error) in
            self.list = list ?? []
            self.tableView.reloadData()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.alpha = 1
    }
    
    @IBAction func clickBack(){
        self.navigationController?.popViewController(animated: true)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count > 0 ? 3 : 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            return tableView.dequeueReusableCell(withIdentifier: "header", for: indexPath)
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "description", for: indexPath)
            let text = cell.viewWithTag(1000) as? UILabel
            text?.text = incontournable.detail ?? ""
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "adresses", for: indexPath)
            let back = UIImageView()
            back.setImage(url: incontournable.cover, defaultImage: "empty_image", "https://www.discovertunisia.com/sites/default/files/75258657_1035885843432340_8419676500634107904_o-1.jpg")
            back.contentMode = .scaleAspectFill
            cell.backgroundView = back
            let stack = cell.viewWithTag(2000) as? UIStackView
            list.forEach { (elm) in
                let elm_view = RoundedEmptyView()
                elm_view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
                elm_view.cornerRadius = 8
                let elm_stack = UIStackView()
                elm_stack.axis = .vertical
                elm_stack.alignment = .leading
                elm_stack.distribution = .fill
                elm_stack.spacing = 14
                let view_title = UILabel()
                view_title.text = elm.titre ?? ""
                view_title.textColor = UIColor.white
                view_title.font = UIFont.boldSystemFont(ofSize: 18)
                view_title.numberOfLines = 0
                let view_content = UILabel()
                view_content.text = elm.content ?? ""
                view_content.textColor = UIColor.white
                view_content.font = UIFont.systemFont(ofSize: 14)
                view_content.numberOfLines = 0
                elm_stack.addArrangedSubview(view_title)
                elm_stack.addArrangedSubview(view_content)
                elm_view.addSubview(elm_stack)
                elm_stack.translatesAutoresizingMaskIntoConstraints = false
                elm_view.translatesAutoresizingMaskIntoConstraints = false
                elm_stack.widthAnchor.constraint(equalTo: elm_view.widthAnchor, multiplier: 1, constant: -30).isActive = true
                elm_view.heightAnchor.constraint(equalTo: elm_stack.heightAnchor, multiplier: 1, constant: 20).isActive = true
                elm_stack.centerXAnchor.constraint(equalTo: elm_view.centerXAnchor).isActive = true
                elm_stack.centerYAnchor.constraint(equalTo: elm_view.centerYAnchor).isActive = true
                stack?.addArrangedSubview(elm_view)
            }
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

}
