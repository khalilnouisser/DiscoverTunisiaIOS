//
//  DetailEventViewController.swift
//  Discover Tunisia
//
//  Created by Khalil nouisser on 11/25/19.
//  Copyright © 2019 Streamerz. All rights reserved.
//

import UIKit

class DetailEventViewController: UITableViewController {

    var event: Event!
    
    @IBOutlet weak var coverUIImage : UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.alpha = 0
        coverUIImage.setImage(url: event.thumbnail, defaultImage: "empty_image", "https://www.discovertunisia.com/sites/default/files/75258657_1035885843432340_8419676500634107904_o-1.jpg")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.alpha = 1
    }
    
    @IBAction func clickBack(){
        self.navigationController?.popViewController(animated: true)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "titleCell", for: indexPath)
            let title = cell.viewWithTag(1000) as! UILabel
            let date = cell.viewWithTag(2000) as! UILabel
            title.text = event.name ?? ""
            date.text = event.date ?? ""
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "descriptionCell", for: indexPath)
            let description = cell.viewWithTag(1000) as! UILabel
            description.text = event.description ?? ""
            return cell
        }
    }

}
