//
//  UITextView+.swift
//  HelperLib
//
//  Created by Edson Rottava on 22/06/21.
//  Copyright © 2021 Rattova's Dev. All rights reserved.
//

import UIKit

extension UITextView {

  func addHyperLinks(hyperLinks: [String: String]) {
    let color = self.textColor ?? .black
    let font = self.font ?? UIFont.systemFont(ofSize: 12)
    let text = self.text ?? ""
    let style = NSMutableParagraphStyle()
    let attributedOriginalText = NSMutableAttributedString(string: text)
    style.alignment = .left
    
    for (hyperLink, urlString) in hyperLinks {
        let linkRange = attributedOriginalText.mutableString.range(of: hyperLink)
        let fullRange = NSRange(location: 0, length: attributedOriginalText.length)
        
        attributedOriginalText.addAttribute(NSAttributedString.Key.link, value: urlString, range: linkRange)
        attributedOriginalText.addAttribute(NSAttributedString.Key.paragraphStyle, value: style, range: fullRange)
        attributedOriginalText.addAttribute(NSAttributedString.Key.font, value: font, range: fullRange)
    }

    self.linkTextAttributes = [ NSAttributedString.Key.foregroundColor: color,
                                NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue]
    
    self.attributedText = attributedOriginalText
  }
}
