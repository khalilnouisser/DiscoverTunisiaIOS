//
//  MonSejoursCollectionViewController.swift
//  Discover Tunisia
//
//  Created by Khalil nouisser on 12/7/19.
//  Copyright © 2019 Streamerz. All rights reserved.
//

import UIKit

class MonSejoursCollectionViewController: UICollectionViewController , UICollectionViewDelegateFlowLayout {

    var listSejours : [Sejour] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        APIService.getListSejour { (list, error) in
            if error == nil {
                self.listSejours = list ??  []
                self.collectionView.reloadData()
            }
        }
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listSejours.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "itemCell", for: indexPath) as? ImageTextCollectionViewCell {
            cell.initElements(title: listSejours[indexPath.row].name ?? "", img: listSejours[indexPath.row].thumbnail)
            return cell
        }
        return UICollectionViewCell()
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let vc = self.storyboard?.instantiateViewController(identifier: "SejourDetailViewController") as? SejourDetailViewController {
            vc.sejour = self.listSejours[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width - 32, height: 80)
    }
    
}
