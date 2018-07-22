//
//  TitleLabel.swift
//  DemoUI
//
//  Created by Yosuke Ishikawa on 2018/07/22.
//  Copyright © 2018年 Yosuke Ishikawa. All rights reserved.
//

import UIKit

@IBDesignable
public final class TitleLabel: UILabel {
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
        font = UIFont.boldSystemFont(ofSize: 32)
        textColor = #colorLiteral(red: 0.2, green: 0.137254902, blue: 0.02352941176, alpha: 1)
    }
}
