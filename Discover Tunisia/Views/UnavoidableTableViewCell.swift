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
    var list = ["GOLF","SPORTS NAUTIQUES", "CHASSE", "GOLF","SPORTS NAUTIQUES", "CHASSE"]
    var images = ["s1","s2","s3","s1","s2","s3"]
    var didSelected : ((Int)->())?

}

extension UnavoidableTableViewCell : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? ImageTextCollectionViewCell {
            cell.initElements(title: list[indexPath.row], img: images[indexPath.row])
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        didSelected?(indexPath.row)
    }
    
    
}
