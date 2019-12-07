//
//  LoadingScreenViewController.swift
//  Discover Tunisia
//
//  Created by Khalil nouisser on 11/24/19.
//  Copyright © 2019 Streamerz. All rights reserved.
//

import UIKit
import FAPanels

class LoadingScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)

            let leftMenuVC = mainStoryboard.instantiateViewController(withIdentifier: "LeftMenuVC")

            let centerVC = mainStoryboard.instantiateViewController(withIdentifier: "MainTabBarViewController") as! MainTabBarViewController
            
            let faPanel = mainStoryboard.instantiateViewController(withIdentifier: "PanelController") as! PanelController

            faPanel.center(centerVC).left(leftMenuVC)
            
            self.navigationController?.pushViewController(faPanel, animated: true)
            self.navigationController?.setNavigationBarHidden(false, animated: true)
                        
        }
    }

}
