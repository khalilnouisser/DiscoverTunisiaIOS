//
//  DiscoveryContentViewController.swift
//  Discover Tunisia
//
//  Created by Khalil nouisser on 11/25/19.
//  Copyright © 2019 Streamerz. All rights reserved.
//

import Foundation
import UIKit

class DiscoveryContentViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet var cover1ImageView: UIImageView!
    @IBOutlet var cover2ImageView: UIImageView!
    @IBOutlet var cover3ImageView: UIImageView!
    @IBOutlet var cover4ImageView: UIImageView!
    @IBOutlet var mapImageView: UIImageView!
    @IBOutlet var descriptionUILabel: UILabel!
    @IBOutlet var titleUILabel: UILabel!


    // MARK: - Properties
    
    var index = 0
    var city: City!

    override func viewDidLoad() {
        super.viewDidLoad()
        cover1ImageView.setImage(url: self.city.cover1, defaultImage: "empty_image")
        cover2ImageView.setImage(url: self.city.cover2, defaultImage: "empty_image")
        cover3ImageView.setImage(url: self.city.cover3, defaultImage: "empty_image")
        cover4ImageView.setImage(url: self.city.cover4, defaultImage: "empty_image")
        mapImageView.setImage(url: self.city.map_picture, defaultImage: "tunisia-map")
        descriptionUILabel.text = self.city.description ?? ""
        titleUILabel.text = self.city.name ?? ""
    }
    
    @IBAction func clickMore(){
        if let url = URL(string: self.city.link ?? "") {
            UIApplication.shared.open(url)
        }
    }

}

