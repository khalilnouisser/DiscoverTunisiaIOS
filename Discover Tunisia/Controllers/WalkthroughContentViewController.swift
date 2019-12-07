//
//  WalkthroughContentViewController.swift
//  Discover Tunisia
//
//  Created by Khalil nouisser on 11/23/19.
//  Copyright © 2019 Streamerz. All rights reserved.
//

import UIKit

class WalkthroughContentViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet var contentImageView: UIImageView!
    
    // MARK: - Properties
    
    var index = 0
    var imageFile = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        contentImageView.image = UIImage(named: imageFile)
    }

}

