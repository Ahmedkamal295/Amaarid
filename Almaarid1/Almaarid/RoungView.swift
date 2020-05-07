//
//  RoungView.swift
//  Tsahil
//
//  Created by Ahmed on 10/16/18.
//  Copyright © 2018 elryad. All rights reserved.
//

import UIKit
@IBDesignable
class RoundView: UIView {
    @IBInspectable var CornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = CornerRadius
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
