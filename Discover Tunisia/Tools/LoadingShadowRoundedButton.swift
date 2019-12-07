//
//  LoadingShadowRoundedButton.swift
//  vynd
//
//  Created by Khalil nouisser on 6/7/19.
//  Copyright © 2019 khalil nouisser. All rights reserved.
//

import UIKit

import UIKit
class LoadingShadowRoundedButton: UIButton {

    @IBInspectable var activityIndicatorColor: UIColor = UIColor.white

    @IBInspectable var cornerRadius: CGFloat = 6.0
    @IBInspectable var shadowRadius: CGFloat = 3.0
    @IBInspectable var shadowOffset: CGSize = CGSize(width: 0, height: 1.0)
    @IBInspectable var shadowOpacity: Float = 0.2
    @IBInspectable var shadowColor: UIColor = UIColor.black
    @IBInspectable var borderColor: UIColor = UIColor.clear
    @IBInspectable var fillColor: UIColor = UIColor.black

    let containerView = UIView()
    var originalButtonText: String?
    var originalImage: UIImage?
    var activityIndicator: UIActivityIndicatorView!

    private var shadowLayer: CAShapeLayer!

    override func layoutSubviews() {
        super.layoutSubviews()

        if shadowLayer == nil {
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

    func showLoading() {
        originalButtonText = self.titleLabel?.text
        originalImage = self.image(for: .normal)

        shadowLayer.removeFromSuperlayer()

        self.setTitle("", for: .normal)
        self.setImage(nil, for: .normal)

        if (activityIndicator == nil) {
            activityIndicator = createActivityIndicator()
        }

        showSpinning()
    }

    func hideLoading() {
        self.setTitle(originalButtonText, for: UIControl.State.normal)
        self.setImage(originalImage, for: .normal)
        layer.insertSublayer(shadowLayer, at: 0)
        activityIndicator.stopAnimating()
    }

    private func createActivityIndicator() -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.hidesWhenStopped = true
        activityIndicator.color = activityIndicatorColor
        return activityIndicator
    }

    private func showSpinning() {
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        //self.addSubview(activityIndicator)
        self.insertSubview(activityIndicator, at: 0)
        centerActivityIndicatorInButton()
        activityIndicator.startAnimating()
    }

    private func centerActivityIndicatorInButton() {
        let xCenterConstraint = NSLayoutConstraint(item: self, attribute: .centerX, relatedBy: .equal, toItem: activityIndicator, attribute: .centerX, multiplier: 1, constant: 0)
        self.addConstraint(xCenterConstraint)

        let yCenterConstraint = NSLayoutConstraint(item: self, attribute: .centerY, relatedBy: .equal, toItem: activityIndicator, attribute: .centerY, multiplier: 1, constant: 0)
        self.addConstraint(yCenterConstraint)
    }

}
