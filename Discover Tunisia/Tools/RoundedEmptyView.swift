//
//  RoundedEmptyView.swift
//  vynd
//
//  Created by boufaied youssef on 23/08/2017.
//  Copyright © 2017 youssef boufaied. All rights reserved.
//

import UIKit

@IBDesignable
class RoundedEmptyView: UIView {
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
    @IBInspectable var isClear: Bool = false {
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
