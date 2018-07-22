//
//  InfoLabel.swift
//  DemoUI
//
//  Created by Yosuke Ishikawa on 2018/07/22.
//  Copyright © 2018年 Yosuke Ishikawa. All rights reserved.
//

import Foundation

@IBDesignable
public final class InfoLabel: UILabel {
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
        
        if let text = text {
            let attributes: [NSAttributedStringKey: Any] = [
                NSAttributedStringKey(kCTLanguageAttributeName as String): "ja",
            ]
            
            attributedText = NSAttributedString(string: text, attributes: attributes)
        }
    }
    
    private func configure() {
        font = UIFont.systemFont(ofSize: 14)
        textColor = #colorLiteral(red: 0.5411764706, green: 0.5215686275, blue: 0.4901960784, alpha: 1)
        numberOfLines = 0
    }
}
