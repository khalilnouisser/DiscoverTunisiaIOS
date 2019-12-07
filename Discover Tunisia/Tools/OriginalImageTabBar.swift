//
//  OriginalImageTabBar.swift
//  Discover Tunisia
//
//  Created by Khalil nouisser on 11/24/19.
//  Copyright © 2019 Streamerz. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class OriginalImageTabBar: UITabBarItem {
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    func setup() {
        if let image = image {
            self.image = image.withRenderingMode(.alwaysOriginal)
        }
        if let image = selectedImage {
            selectedImage = image.withRenderingMode(.alwaysOriginal)
        }

    }
}
