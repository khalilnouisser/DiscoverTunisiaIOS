//
//  RoundedShadowView.swift
//  vynd
//
//  Created by Khalil nouisser on 6/7/19.
//  Copyright © 2019 khalil nouisser. All rights reserved.
//

import UIKit

class RoundedShadowView: UIView {

    let containerView = UIView()

    @IBInspectable var cornerRadius: CGFloat = 6.0
    @IBInspectable var shadowRadius: CGFloat = 3.0
    @IBInspectable var shadowOffset: CGSize = CGSize(width: 0, height: 1.0)
    @IBInspectable var shadowOpacity: Float = 0.2
    @IBInspectable var shadowColor: UIColor = UIColor.black
    @IBInspectable var fillColor: UIColor = UIColor.black
    @IBInspectable var borderColor: UIColor = UIColor.clear

    private var shadowLayer: CAShapeLayer!

    override func layoutSubviews() {
        super.layoutSubviews()

        if shadowLayer == nil {
            shadowLayer = CAShapeLayer()

            shadowLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
            shadowLayer.borderColor = borderColor.cgColor
            if self.backgroundColor != nil {
                shadowLayer.fillColor = fillColor == UIColor.black ? self.backgroundColor!.cgColor : fillColor.cgColor
            } else {
                shadowLayer.fillColor = fillColor.cgColor
            }

            shadowLayer.shadowColor = shadowColor.cgColor
            shadowLayer.shadowPath = shadowLayer.path
            shadowLayer.shadowOffset = shadowOffset
            shadowLayer.shadowOpacity = shadowOpacity
            shadowLayer.shadowRadius = shadowRadius
            layer.insertSublayer(shadowLayer, at: 0)
        }
        self.backgroundColor = UIColor.clear
    }

    func reloadData() {
        self.layer.sublayers?.forEach { $0.removeFromSuperlayer() }
        shadowLayer = CAShapeLayer()

        shadowLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
        shadowLayer.borderColor = borderColor.cgColor
        shadowLayer.fillColor = fillColor.cgColor

        shadowLayer.shadowColor = shadowColor.cgColor
        shadowLayer.shadowPath = shadowLayer.path
        shadowLayer.shadowOffset = shadowOffset
        shadowLayer.shadowOpacity = shadowOpacity
        shadowLayer.shadowRadius = shadowRadius
        layer.insertSublayer(shadowLayer, at: 0)
    }

}
