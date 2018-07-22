//
//  PrimaryActionButton.swift
//  DemoUI
//
//  Created by Yosuke Ishikawa on 2018/07/22.
//  Copyright © 2018年 Yosuke Ishikawa. All rights reserved.
//

import UIKit

@IBDesignable
public final class PrimaryActionButton: UIButton {
    public override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    public override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        configure()
        
        if let title = title(for: state) {
            let attributes: [NSAttributedStringKey: Any] = [
                NSAttributedStringKey(kCTLanguageAttributeName as String): "ja",
            ]
            
            titleLabel?.attributedText = NSAttributedString(string: title, attributes: attributes)
        }
    }
    
    public override var intrinsicContentSize: CGSize {
        var size = super.intrinsicContentSize
        size.height = 48
        
        if let titleLabel = titleLabel {
            size.width = titleLabel.intrinsicContentSize.width + 48
        }
        
        return size
    }
    
    private func configure() {
        backgroundColor = #colorLiteral(red: 0, green: 0.6730770469, blue: 1, alpha: 1)
        layer.cornerRadius = 24
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 19)
        setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        
        layer.shadowOpacity = 0.3
        layer.shadowOffset = CGSize(width: 0, height: 1)
        layer.shadowRadius = 4
        layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).cgColor
    }
}
