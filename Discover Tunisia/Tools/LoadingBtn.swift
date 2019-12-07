//
//  LoadingBtn.swift
//  vynd
//
//  Created by Khalil nouisser on 12/17/18.
//  Copyright © 2018 khalil nouisser. All rights reserved.
//

import Foundation
import UIKit
class LoadingButton: RoundedEmtyButton {

    var originalButtonText: String?
    var originalImage: UIImage?
    var activityIndicator: UIActivityIndicatorView!
    @IBInspectable var activityIndicatorColor: UIColor = UIColor.white

    func showLoading() {
        originalButtonText = self.titleLabel?.text
        originalImage = self.image(for: .normal)

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
        self.addSubview(activityIndicator)
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
