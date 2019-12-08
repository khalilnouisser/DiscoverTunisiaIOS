//
//  SearchTableViewController.swift
//  Discover Tunisia
//
//  Created by Khalil nouisser on 12/7/19.
//  Copyright © 2019 Streamerz. All rights reserved.
//

import UIKit

class SearchTableViewController: UITableViewController {
    
    @IBOutlet weak var searchBar : UISearchBar!
    var list : [SearchItem] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        getData()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? SearchTableViewCell {
            let item = list[indexPath.row]
            cell.searchTitleUILabel.text = item.title
            cell.searchContentUILabel.text = item.description
            return cell
        }
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = list[indexPath.row]
        switch item.type ?? "" {
        case "event":
            if let vc = self.storyboard?.instantiateViewController(identifier: "DetailEventViewController") as? DetailEventViewController {
                vc.event = item.event!
                self.navigationController?.pushViewController(vc, animated: true)
            }
        case "incontournable":
            if let vc = self.storyboard?.instantiateViewController(identifier: "DetailActivityViewController") as? DetailActivityViewController {
                vc.incontournable = item.incontournable!
                self.navigationController?.pushViewController(vc, animated: true)
            }
        case "monsejour":
            if let vc = self.storyboard?.instantiateViewController(identifier: "SejourDetailViewController") as? SejourDetailViewController {
                vc.sejour = item.monsejour!
                self.navigationController?.pushViewController(vc, animated: true)
            }
        case "monsejourelements":
            if let vc = self.storyboard?.instantiateViewController(identifier: "DetailSejourItemViewController") as? DetailSejourItemViewController {
                vc.sejour = item.monsejourelements!
                self.navigationController?.pushViewController(vc, animated: true)
            }
        default:
            break
        }
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.view.endEditing(true)
    }
    
    func getData(){
        APIService.search(keyword: searchBar.text ?? "") { (list, error) in
            if error == nil {
                self.list = (list ?? []).filter({ (elm) -> Bool in
                    return (elm.type ?? "") != "incontournable_detail"
                })
                self.tableView.reloadData()
            }
        }
    }

}

extension SearchTableViewController : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        getData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.view.endEditing(true)
    }
}


class SearchTableViewCell: UITableViewCell {
    @IBOutlet weak var searchTitleUILabel : UILabel!
    @IBOutlet weak var searchContentUILabel : UILabel!

}
