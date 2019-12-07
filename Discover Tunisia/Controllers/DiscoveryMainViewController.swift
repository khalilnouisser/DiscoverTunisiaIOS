//
//  DiscoveryMainViewController.swift
//  Discover Tunisia
//
//  Created by Khalil nouisser on 12/6/19.
//  Copyright © 2019 Streamerz. All rights reserved.
//

import UIKit

class DiscoveryMainViewController: UIViewController {

    @IBOutlet weak var loadButton: LoadingButton!
    
    var list : [City] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func clickDiscovery(){
        loadButton.showLoading()
        APIService.getCities { (list, error) in
            self.loadButton.hideLoading()
            if error == nil {
                self.list = list ?? []
                if let vc = self.storyboard?.instantiateViewController(identifier: "DiscoveryViewController") as? DiscoveryViewController {
                    vc.list = self.list
                    self.navigationController?.pushViewController(vc, animated: true)
                }
            }
        }
    }

}
