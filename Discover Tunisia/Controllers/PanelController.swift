//
//  PanelController.swift
//  Discover Tunisia
//
//  Created by Khalil nouisser on 11/25/19.
//  Copyright © 2019 Streamerz. All rights reserved.
//

import Foundation
import FAPanels
class PanelController: FAPanelController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let nav = self.navigationController?.navigationBar
        nav?.barStyle = UIBarStyle.black
        nav?.tintColor = UIColor(named: "MainColor")
        let imageView = UIImageView(frame: CGRect(x: 0, y: -5, width: 70, height: 25))
        imageView.contentMode = .scaleAspectFit
        let image = UIImage(named: "inspringLogoMini")
        imageView.image = image
        self.navigationItem.titleView = imageView
    }
    
    @IBAction func clickMenu(){
        self.openLeft(animated: true)
    }
}
