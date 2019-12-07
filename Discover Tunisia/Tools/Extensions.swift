//
//  Extensions.swift
//  Discover Tunisia
//
//  Created by Khalil nouisser on 12/6/19.
//  Copyright © 2019 Streamerz. All rights reserved.
//

import UIKit
import SDWebImage
import Alamofire

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self,
                                                                 action: #selector(UIViewController.dismissEditing))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissEditing() {
        view.endEditing(true)
    }
}

extension UIColor {
    convenience init(rgb: UInt) {
        self.init(
            red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgb & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}

extension UIImageView {
    func setImage(url: String?,
                  defaultImage: String,
                  _ secondImage: String? = nil,
                  completion: ((Bool) -> Void)? = nil) {
        var imageUrl: String = ""
        if url != nil && !(url!.isEmpty) {
            imageUrl = url!
        } else if secondImage != nil && !(secondImage!.isEmpty) {
            imageUrl = secondImage!
        }
        self.sd_imageIndicator = SDWebImageActivityIndicator.gray
        self.sd_setImage(with: URL(string: imageUrl),
                         placeholderImage: UIImage(named: defaultImage),
                         options: [SDWebImageOptions.continueInBackground, SDWebImageOptions.highPriority]) { (_, error, _, url) in
            if error != nil {
                if secondImage != nil && imageUrl != secondImage {
                    self.setImage(url: secondImage, defaultImage: defaultImage, secondImage, completion: completion)
                }
                if completion != nil {
                    completion!(false)
                }
            } else {
                if completion != nil {
                    completion!(true)
                }
            }
        }
    }
}

