//
//  EventsCollectionViewController.swift
//  Discover Tunisia
//
//  Created by Khalil nouisser on 12/7/19.
//  Copyright © 2019 Streamerz. All rights reserved.
//

import UIKit

class EventsCollectionViewController: UICollectionViewController , UICollectionViewDelegateFlowLayout {

    var listEvents : [Event] = []
    var index : Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        if index == 0 {
            APIService.getListEvents { (list, error) in
                if error == nil {
                    self.listEvents = list ?? []
                    self.collectionView.reloadData()
                }
            }
        } else {
            APIService.getListActualites { (list, error) in
                if error == nil {
                    self.listEvents = list ?? []
                    self.collectionView.reloadData()
                }
            }
        }
        
        
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listEvents.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EventCollectionViewCell", for: indexPath) as? EventCollectionViewCell {
            cell.initElements(event: listEvents[indexPath.row])
            return cell
        }
        return UICollectionViewCell()
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let vc = self.storyboard?.instantiateViewController(identifier: "DetailEventViewController") as? DetailEventViewController {
            vc.event = self.listEvents[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width - 32, height: 200)
    }
    
}

class FullWidhUICollectionViewLayout: UICollectionViewFlowLayout {

    var cellWidth: CGFloat = 0.0
    override func prepare() {
        super.prepare()

        guard let collectionView = collectionView else { return }

        self.cellWidth = collectionView.frame.width - 32.0

        self.itemSize = CGSize(width: self.cellWidth - self.minimumInteritemSpacing, height: 180)
        self.sectionInset = UIEdgeInsets(top: self.minimumInteritemSpacing, left: 16.0, bottom: 0.0, right: 16.0)
    }
}
