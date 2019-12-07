//
//  RoundedEmtyButton.swift
//  vynd
//
//  Created by khalil nouisser on 8/28/17.
//  Copyright © 2017 youssef boufaied. All rights reserved.
//

import Foundation
import UIKit

class RoundedEmtyButton: UIButton {
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

    @IBInspectable var isClear: Bool = true {
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

    }

    override func prepareForInterfaceBuilder() {
        setup()
        super.prepareForInterfaceBuilder()
    }
}
