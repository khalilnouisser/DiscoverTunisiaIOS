//
//  DetailActivityViewController.swift
//  Discover Tunisia
//
//  Created by Khalil nouisser on 11/25/19.
//  Copyright © 2019 Streamerz. All rights reserved.
//

import UIKit

class DetailActivityViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.alpha = 0
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.alpha = 1
    }
    
    @IBAction func clickBack(){
        self.navigationController?.popViewController(animated: true)
    }

}
