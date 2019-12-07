//
//  RoundedCornerImageView.swift
//  Discover Tunisia
//
//  Created by Khalil nouisser on 11/24/19.
//  Copyright © 2019 Streamerz. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class RoundedCornerImageView: UIImageView {
    @IBInspectable var borderColor: UIColor = UIColor.clear {
        didSet {
            setup()
        }
    }

    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            setup()
        }
    }
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            setup()
        }
    }
    //from storyboard
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    //from code
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    private func setup() {

        self.backgroundColor = UIColor.clear
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
        self.layer.cornerRadius = cornerRadius

    }

    override func prepareForInterfaceBuilder() {
        setup()
        super.prepareForInterfaceBuilder()
    }

}
