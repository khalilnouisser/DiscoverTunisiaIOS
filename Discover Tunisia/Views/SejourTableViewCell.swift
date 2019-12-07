//
//  SejourTableViewCell.swift
//  Discover Tunisia
//
//  Created by Khalil nouisser on 11/24/19.
//  Copyright © 2019 Streamerz. All rights reserved.
//

import UIKit

class SejourTableViewCell: UITableViewCell {

    @IBOutlet weak var height : NSLayoutConstraint!
    @IBOutlet weak var collectionView : UICollectionView!
    var list : [Sejour] = []
    var didSelected : ((Int)->())?

    func initElements(){
        let nbLignes = ceil(Double(list.count)/3.0)
        self.collectionView.reloadData()
        self.height.constant = CGFloat(60*nbLignes)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}

extension SejourTableViewCell : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "itemCell", for: indexPath) as? ImageTextCollectionViewCell {
            cell.initElements(title: list[indexPath.row].name ?? "", img: list[indexPath.row].thumbnail)
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        didSelected?(indexPath.row)
    }
    
    
}
