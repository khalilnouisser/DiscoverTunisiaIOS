//
//  SectionHeaderTableViewCell.swift
//  Discover Tunisia
//
//  Created by Khalil nouisser on 11/24/19.
//  Copyright © 2019 Streamerz. All rights reserved.
//

import UIKit

class SectionHeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var titleUILabel : UILabel!
    
    func initElements(title: String){
        self.titleUILabel.text = title
    }
    
}
