//
//  DiscoveryPageUIViewController.swift
//  Discover Tunisia
//
//  Created by Khalil nouisser on 11/25/19.
//  Copyright © 2019 Streamerz. All rights reserved.
//

import UIKit

protocol DiscoveryPageViewControllerDelegate: class {
    func didUpdatePageIndex(currentIndex: Int)
}

class DiscoveryPageUIViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    

    // MARK: - Properties
    
    weak var walkthroughDelegate: DiscoveryPageViewControllerDelegate?
    var list : [City] = []
    
    var currentIndex = 0 {
        didSet {
            walkthroughDelegate?.didUpdatePageIndex(currentIndex: currentIndex)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the data source and the delegate to itself
        dataSource = self
        delegate = self
        
        // Create the first walkthrough screen
        if let startingViewController = contentViewController(at: 0) {
            setViewControllers([startingViewController], direction: .forward, animated: true, completion: nil)
        }
    }
    
    // MARK: - Page View Controller Data Source
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! DiscoveryContentViewController).index
        self.currentIndex = index
        index -= 1
        
        return contentViewController(at: index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! DiscoveryContentViewController).index
        self.currentIndex = index
        index += 1
        
        
        return contentViewController(at: index)
    }
    
    // MARK: - Helper
    
    func contentViewController(at index: Int) -> DiscoveryContentViewController? {
        if index < 0 || index >= list.count {
            return nil
        }
        
        // Create a new view controller and pass suitable data
        if let pageContentViewController = self.storyboard?.instantiateViewController(withIdentifier: "DiscoveryContentViewController") as? DiscoveryContentViewController {
            pageContentViewController.city = list[index]
            pageContentViewController.index = index
            self.currentIndex = index
            return pageContentViewController
        }
        
        return nil
    }
    
    func forwardPage() {
        currentIndex += 1
        if let nextViewController = contentViewController(at: currentIndex) {
            setViewControllers([nextViewController], direction: .forward, animated: true, completion: nil)
        }
    }
    
    // MARK: - Page View Controller delegate
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed {
            if let contentViewController = pageViewController.viewControllers?.first as? WalkthroughContentViewController {
                currentIndex = contentViewController.index
                
                walkthroughDelegate?.didUpdatePageIndex(currentIndex: currentIndex)
            }
        }
    }

}
