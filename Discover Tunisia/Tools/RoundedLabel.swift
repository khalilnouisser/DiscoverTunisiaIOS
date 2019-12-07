//
//  RoundedLabel.swift
//  vynd
//
//  Created by khalil nouisser on 9/2/17.
//  Copyright © 2017 youssef boufaied. All rights reserved.
//

import Foundation

import UIKit

@IBDesignable
class RoundedLabel: UILabel {

    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */

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

        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
        self.layer.masksToBounds = true
    }

    override func prepareForInterfaceBuilder() {
        setup()
        super.prepareForInterfaceBuilder()
    }

}
