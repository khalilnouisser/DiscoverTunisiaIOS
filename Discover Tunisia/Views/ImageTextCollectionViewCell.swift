//
//  ImageTextCollectionViewCell.swift
//  Discover Tunisia
//
//  Created by Khalil nouisser on 11/24/19.
//  Copyright © 2019 Streamerz. All rights reserved.
//

import UIKit

class ImageTextCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageUIView : UIImageView!
    @IBOutlet weak var titleUILabel : UILabel!

    func initElements(title: String, img: String?){
        titleUILabel.text = title
        imageUIView.setImage(url: img, defaultImage: "empty_image")
    }
}
