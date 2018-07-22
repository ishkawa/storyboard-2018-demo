//
//  BodyLabel.swift
//  DemoUI
//
//  Created by Yosuke Ishikawa on 2018/07/22.
//  Copyright © 2018年 Yosuke Ishikawa. All rights reserved.
//

import UIKit

@IBDesignable
public final class BodyLabel: UILabel {
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
        
        if let mutableAttributedText = attributedText.map(NSMutableAttributedString.init) {
            let range = NSRange(location: 0, length: mutableAttributedText.length)
            let attributes: [NSAttributedStringKey: Any] = [
                NSAttributedStringKey(kCTLanguageAttributeName as String): "ja",
            ]
            
            mutableAttributedText.addAttributes(attributes, range: range)
            attributedText = mutableAttributedText
        }
    }
    
    public override var text: String? {
        didSet {
            applyPragraphStyle()
        }
    }
    
    private func configure() {
        font = UIFont.systemFont(ofSize: 16)
        textColor = #colorLiteral(red: 0.2, green: 0.137254902, blue: 0.02352941176, alpha: 1)
        numberOfLines = 0
        applyPragraphStyle()
    }
    
    private func applyPragraphStyle() {
        guard let text = text else {
            return
        }
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = textAlignment
        paragraphStyle.lineSpacing = 2
        paragraphStyle.lineBreakMode = .byTruncatingTail
        
        attributedText = NSAttributedString(string: text, attributes: [
            .paragraphStyle: paragraphStyle,
        ])
    }
}
