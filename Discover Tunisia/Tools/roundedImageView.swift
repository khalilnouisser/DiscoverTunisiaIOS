//
//  roundedImageView.swift
//  vynd
//
//  Created by boufaied youssef on 04/08/2017.
//  Copyright © 2017 youssef boufaied. All rights reserved.
//

import Foundation
import UIKit

public class roundedImageView: UIImageView {

    override public func layoutSubviews() {
        super.layoutSubviews()

        self.frame = CGRect(x: self.frame.origin.x, y: self.frame.origin.x, width: self.frame.height, height: self.frame.height)
        self.clipsToBounds = true
        self.layer.cornerRadius = self.frame.height / 2.0
    }
}
