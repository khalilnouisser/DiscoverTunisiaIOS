//
//  ThreeEqualColumnUICollectionViewLayout.swift
//  Discover Tunisia
//
//  Created by Khalil nouisser on 11/24/19.
//  Copyright © 2019 Streamerz. All rights reserved.
//

import UIKit

class ThreeEqualColumnUICollectionViewLayout: UICollectionViewFlowLayout {

    var cellWidth: CGFloat = 0.0
    override func prepare() {
        super.prepare()

        guard let collectionView = collectionView else { return }

        let availableWidth = collectionView.frame.width - 32.0
        self.cellWidth = (availableWidth / CGFloat(3)).rounded(.down)

        self.itemSize = CGSize(width: self.cellWidth - self.minimumInteritemSpacing, height: cellWidth)
        self.sectionInset = UIEdgeInsets(top: self.minimumInteritemSpacing, left: 16.0, bottom: 0.0, right: 16.0)
    }
}
