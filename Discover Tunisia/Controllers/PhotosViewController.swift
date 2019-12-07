//
//  PhotosViewController.swift
//  Discover Tunisia
//
//  Created by Khalil nouisser on 11/24/19.
//  Copyright © 2019 Streamerz. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController {

    // MARK: - Outlets
    
    @IBOutlet var collectionView : UICollectionView!
    
    // MARK: - Proporties
    var list = ["s1", "s2", "s3", "s2", "s3", "s1", "s3", "s1", "s2", "s1", "s2", "s3", "s2", "s3", "s1", "s3", "s1", "s2"]

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}


extension PhotosViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        if let image = cell.viewWithTag(1000) as? UIImageView {
            image.image = UIImage(named: list[indexPath.row])
        }
        return cell
    }
    
    
}
