//
//  EventCollectionViewCell.swift
//  Discover Tunisia
//
//  Created by Khalil nouisser on 11/24/19.
//  Copyright © 2019 Streamerz. All rights reserved.
//

import UIKit

class EventCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageUIView : UIImageView!
    @IBOutlet weak var titleUILabel : UILabel!
    @IBOutlet weak var dateUILabel : UILabel!


    func initElements(event: Event){
        imageUIView.setImage(url: event.thumbnail, defaultImage: "empty_image", "https://www.discovertunisia.com/sites/default/files/75258657_1035885843432340_8419676500634107904_o-1.jpg")
        titleUILabel.text = event.name ?? ""
        dateUILabel.text = event.date ?? ""
    }
}
