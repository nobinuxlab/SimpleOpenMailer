//
//  UIBorderedButton.swift
//  SimpleOpenMailer
//
//  Created by Nobukazu Tanaka on 2017/02/02.
//  Copyright © 2017年 nobinux.home. All rights reserved.
//

import UIKit

@IBDesignable
class UIBorderedButton: UIButton {
    
//    @IBInspectable var textColor: UIColor?
    
    // ボタン角丸
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
    // ボーダーの幅
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    // ボーダーの色
    @IBInspectable var borderColor: UIColor = UIColor.clear {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
}
