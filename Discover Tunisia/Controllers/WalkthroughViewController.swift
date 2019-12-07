//
//  WalkthroughViewController.swift
//  Discover Tunisia
//
//  Created by Khalil nouisser on 11/23/19.
//  Copyright © 2019 Streamerz. All rights reserved.
//

import Foundation
import UIKit

class WalkthroughViewController: UIViewController, WalkthroughPageViewControllerDelegate {
    
    // MARK: - Outlets
    
    @IBOutlet var pageControl: UIPageControl!
    
    @IBOutlet var backgroundImage: UIImageView!
    
    @IBOutlet var nextButton: UIButton!
        
    // MARK: - Properties
    
    var walkthroughPageViewController: WalkthroughPageViewController?
    var pageImages = ["tuto1", "tuto2", "tuto3"]
    var lastIndex = 0
    
    // MARK: - Actions
    
    @IBAction func nextButtonTapped(sender: UIButton) {
        if let index = walkthroughPageViewController?.currentIndex {
            switch index {
            case 0...1:
                walkthroughPageViewController?.forwardPage()
                
            case 2:
                AuthService.displayedIntro = true
                if let vc = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") {
                    self.navigationController?.pushViewController(vc, animated: true)
                }
            default: break
            }
        }
        
        updateUI()
    }
    
    func updateUI() {
        if let index = walkthroughPageViewController?.currentIndex {
            switch index {
            case 0...1:
                nextButton.setTitle("NEXT", for: .normal)
            
            case 2:
                nextButton.setTitle("GET STARTED", for: .normal)
                
            default: break
            }
            
            pageControl.currentPage = index
            UIView.animate(withDuration: 1,
                         delay: 0,
                         options: .curveEaseInOut,
                         animations: { [weak self] in
                            let images = [UIImage(named: self!.pageImages[index])!,UIImage(named: self!.pageImages[index])!]
                          self!.backgroundImage.image = UIImage.animatedImage(with: images, duration: 0.5)
                          self!.lastIndex = index
            }, completion: nil)
        }
    }
    
    func didUpdatePageIndex(currentIndex: Int) {
        updateUI()
    }
    
    // MARK: - View controller life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination
        if let pageViewController = destination as? WalkthroughPageViewController {
            walkthroughPageViewController = pageViewController
            walkthroughPageViewController?.walkthroughDelegate = self
        }
    }
 

}
