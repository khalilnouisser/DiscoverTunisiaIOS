//
//  MainTabBarViewController.swift
//  Discover Tunisia
//
//  Created by Khalil nouisser on 11/24/19.
//  Copyright © 2019 Streamerz. All rights reserved.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

    }
}
