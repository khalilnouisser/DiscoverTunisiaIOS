//
//  ListEventsTableViewCell.swift
//  Discover Tunisia
//
//  Created by Khalil nouisser on 11/24/19.
//  Copyright © 2019 Streamerz. All rights reserved.
//

import UIKit

class ListEventsTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView : UICollectionView!
    
    var events : [Event] = []
    
    var selectItem : ((Int)->())?
    
    override func awakeFromNib() {
    }
    
    func initElements(){
        collectionView.reloadData()
    }
}

extension ListEventsTableViewCell : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return events.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EventCollectionViewCell", for: indexPath) as? EventCollectionViewCell {
            cell.initElements(event: events[indexPath.row])
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.selectItem?(indexPath.row)
    }
    
    
}
