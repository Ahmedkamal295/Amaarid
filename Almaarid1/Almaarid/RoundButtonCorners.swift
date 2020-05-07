//
//  RoundButtonCorners.swift
//  Doctor booking
//
//  Created by Ahmed on 10/7/18.
//  Copyright © 2018 Ahmed. All rights reserved.
//

import UIKit
@IBDesignable
class RoundButtonCorners: UIButton {
    @IBInspectable var CornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = CornerRadius
            self.titleLabel?.minimumScaleFactor = 0.5
            self.titleLabel?.numberOfLines = 0
            self.titleLabel?.adjustsFontSizeToFitWidth = true
        }
    }

    @IBInspectable var BorderWidth: CGFloat = 0 {
        didSet {
            self.layer.borderWidth = BorderWidth
        }
    }

    @IBInspectable var BorderColer: UIColor = UIColor.clear {
        didSet {
            self.layer.borderColor = BorderColer.cgColor
        }
    }

    @IBInspectable var shadowColor: UIColor = UIColor.clear {
        didSet {
            layer.shadowColor = shadowColor.cgColor
        }
    }

    @IBInspectable var shadowOpacity: Float = 1.0 {
        didSet {
            layer.shadowOpacity = shadowOpacity
        }
    }

    @IBInspectable var shadowRaduis: CGFloat = 0.0 {
        didSet {
            layer.shadowRadius = shadowRaduis
        }
    }

    @IBInspectable var shadowOffset: CGFloat = 0.0 {
        didSet {
            layer.shadowOffset = CGSize(width: 0, height: shadowOffset)
        }
    }
}
