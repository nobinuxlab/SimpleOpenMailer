//
//  UIPlaceHolderTextView.swift
//  SimpleOpenMailer
//  TextViewにプレースホルダー等のカスタム要素を追加するクラス
//
//  Created by Nobukazu Tanaka on 2017/02/03.
//  Copyright © 2017年 nobinux.home. All rights reserved.
//

import UIKit

@IBDesignable
class UIPlaceHolderTextView: UITextView {
    
    
    private var placeHolderLable: UILabel = UILabel()   // プレースホルダーのラベル
    
    // ストーリーボードからの呼び出し
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        initialize()
    }
    
    
    // 初期化
    func initialize() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.TextChanged(notification:)), name: NSNotification.Name.UITextViewTextDidChange, object: nil)
        
        self.textContainerInset = UIEdgeInsetsMake(5, 5, 5, 5)
        placeHolderLable = UILabel(frame: CGRect(x: 8, y: 5, width: self.bounds.size.width - 16, height: 0))
        placeHolderLable.font = UIFont.systemFont(ofSize: 14.0)
        placeHolderLable.lineBreakMode = NSLineBreakMode.byCharWrapping
        self.addSubview(placeHolderLable)
    }
    
    // プレースホルダーのテキスト設定
    @IBInspectable var placeHolder: String = "Place Holder" {
        didSet {
            self.placeHolderLable.text = placeHolder
            self.placeHolderLable.sizeToFit()
        }
    }
    
    // プレースホルダーの文字色設定
    @IBInspectable var placeHolderColor: UIColor = UIColor.lightGray {
        didSet {
            self.placeHolderLable.textColor = placeHolderColor
        }
    }
    
    // TextView枠線の色の設定
    @IBInspectable var borderColor: UIColor = UIColor.clear {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    // TextView枠線の太さの設定
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    
    // TextView角の丸みの設定
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
            self.layer.masksToBounds = true
        }
    }
    
    // MARK: - プレースホルダーの枠線の色の設定テキストが変更された際に呼ばれる
    func TextChanged(notification: NSNotification) {
        placeHolderLable.isHidden = (0 == text.characters.count) ? false : true
    }
    
    // 通知の解放
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
