//
//  PhotosViewController.swift
//  Discover Tunisia
//
//  Created by Khalil nouisser on 11/24/19.
//  Copyright © 2019 Streamerz. All rights reserved.
//

import UIKit
import GSImageViewerController

class PhotosViewController: UIViewController {

    // MARK: - Outlets
    
    @IBOutlet var collectionView : UICollectionView!
    
    // MARK: - Proporties
    var list : [Gallery] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        APIService.getListGallery { (list, error) in
            if error == nil {
                self.list = list ?? []
                self.collectionView.reloadData()
            }
        }
    }

}


extension PhotosViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        if let image = cell.viewWithTag(1000) as? UIImageView {
            image.setImage(url: list[indexPath.row].image, defaultImage: "empty_image")
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = list[indexPath.row]
        let cell = collectionView.cellForItem(at: indexPath)
        switch item.type {
        case "image":
            if let image = cell?.viewWithTag(1000) as? UIImageView {
                let imageInfo   = GSImageInfo(image: image.image!, imageMode: .aspectFit)
                let imageViewer = GSImageViewerController(imageInfo: imageInfo)
                present(imageViewer, animated: true, completion: nil)
            }
        default:
            if let url = URL(string: item.video_link ?? "") {
                UIApplication.shared.open(url)
            }
        }
    }
    
}
