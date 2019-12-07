//
//  DiscoveryViewController.swift
//  Discover Tunisia
//
//  Created by Khalil nouisser on 11/25/19.
//  Copyright © 2019 Streamerz. All rights reserved.
//

import UIKit

class DiscoveryViewController: UIViewController {

    var list : [City] = []
    var discoveryPageUIViewController: DiscoveryPageUIViewController!
    
    @IBOutlet var backgroundImageView: UIImageView!

    
    override func viewDidLoad() {
        self.navigationController?.navigationBar.alpha = 0
        super.viewDidLoad()
        if list.count > 0 {
            backgroundImageView.setImage(url: self.list[0].cover1, defaultImage: "")
        }
    }
    
    @IBAction func clickBack(){
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.alpha = 0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.navigationBar.alpha = 0
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.navigationController?.navigationBar.alpha = 1
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.navigationController?.navigationBar.alpha = 1
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination
        if let pageViewController = destination as? DiscoveryPageUIViewController {
            discoveryPageUIViewController = pageViewController
            discoveryPageUIViewController?.list = self.list
            discoveryPageUIViewController?.walkthroughDelegate = self
        }
    }

}
extension DiscoveryViewController : DiscoveryPageViewControllerDelegate {
    func didUpdatePageIndex(currentIndex: Int) {
        backgroundImageView.setImage(url: self.list[currentIndex].cover1, defaultImage: "")
    }
}
