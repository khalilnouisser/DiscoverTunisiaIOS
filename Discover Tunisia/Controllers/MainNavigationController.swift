//
//  MainNavigationController.swift
//  Discover Tunisia
//
//  Created by Khalil nouisser on 12/6/19.
//  Copyright © 2019 Streamerz. All rights reserved.
//

import UIKit

class MainNavigationController: UINavigationController, UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        if AuthService.displayedIntro {
            if AuthService.connectedUser != nil {
                let vc = self.storyboard?.instantiateViewController(identifier: "LoadingScreenViewController")
                viewControllers = [vc!]
            } else {
                let vc = self.storyboard?.instantiateViewController(identifier: "LoginViewController")
                viewControllers = [vc!]
            }
        } else {
            let vc = self.storyboard?.instantiateViewController(identifier: "WalkthroughViewController")
            viewControllers = [vc!]
        }
    }
}
