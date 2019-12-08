//
//  UnavoidableTableViewCell.swift
//  Discover Tunisia
//
//  Created by Khalil nouisser on 11/24/19.
//  Copyright © 2019 Streamerz. All rights reserved.
//

import UIKit

class UnavoidableTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView : UICollectionView!
    var list : [Incontournable] = []
    var didSelected : ((Int)->())?

}

extension UnavoidableTableViewCell : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? ImageTextCollectionViewCell {
            cell.initElements(title: list[indexPath.row].type ?? "", img: list[indexPath.row].cover ?? "")
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        didSelected?(indexPath.row)
    }
    
    
}
