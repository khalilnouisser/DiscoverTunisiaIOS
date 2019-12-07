//
//  SejourItemTableViewCell.swift
//  Discover Tunisia
//
//  Created by Khalil nouisser on 11/25/19.
//  Copyright © 2019 Streamerz. All rights reserved.
//

import UIKit

class SejourItemTableViewCell: UITableViewCell {

    @IBOutlet weak var sejourImage: UIImageView!
    @IBOutlet weak var titleUILabel : UILabel!
    
    func initElements(title: String, imageUrl: String) {
        self.sejourImage.setImage(url: imageUrl, defaultImage: "empty_image", "https://www.discovertunisia.com/sites/default/files/75258657_1035885843432340_8419676500634107904_o-1.jpg")
        self.titleUILabel.text = title
    }
}
