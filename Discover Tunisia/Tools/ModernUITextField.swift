//
//  ModernUITextField.swift
//  vynd
//
//  Created by Khalil Nouisser on 13/01/2018.
//  Copyright © 2018 youssef boufaied. All rights reserved.
//

import Foundation
import UIKit

class ModernUITextField: UITextField {

    @IBInspectable var padding: UIEdgeInsets = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 0)

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}
