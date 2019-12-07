//
//  GradientUIView.swift
//  vynd
//
//  Created by Khalil nouisser on 07/09/2018.
//  Copyright © 2018 khalil nouisser. All rights reserved.
//

import UIKit

@IBDesignable
class GradientUIView: UIView {

    @IBInspectable var topColor: UIColor = UIColor.clear {
        didSet {
            setup()
        }
    }

    @IBInspectable var bottomColor: UIColor = UIColor.clear {
        didSet {
            setup()
        }
    }

    func setup() {
        let gradient = CAGradientLayer()

        gradient.frame = self.bounds

        gradient.colors = [topColor.cgColor, bottomColor.cgColor]
        self.backgroundColor = UIColor.clear
        gradient.startPoint = CGPoint(x: 0.0, y: 0)
        gradient.endPoint = CGPoint(x: 0.0, y: 1)
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
            self.layoutIfNeeded()
        }, completion: nil)
        self.layer.sublayers?.removeAll()
        self.layer.addSublayer(gradient)
    }

}
