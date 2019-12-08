//
//  IncontournablesCollectionViewController.swift
//  Discover Tunisia
//
//  Created by Khalil nouisser on 12/7/19.
//  Copyright © 2019 Streamerz. All rights reserved.
//

import UIKit

class IncontournablesCollectionViewController: UICollectionViewController , UICollectionViewDelegateFlowLayout {

    var listIncontournables : [Incontournable] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        APIService.getListIncontournables { (list, error) in
            if error == nil {
                self.listIncontournables = list ??  []
                self.collectionView.reloadData()
            }
        }
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listIncontournables.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? ImageTextCollectionViewCell {
            cell.initElements(title: listIncontournables[indexPath.row].type ?? "", img: listIncontournables[indexPath.row].cover ?? "")
            return cell
        }
        return UICollectionViewCell()
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let vc = self.storyboard?.instantiateViewController(identifier: "DetailActivityViewController") as? DetailActivityViewController {
            vc.incontournable = self.listIncontournables[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width - 32, height: 71)
    }
    
}
