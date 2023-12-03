//
//  UnderlineTextView.swift
//  HelperLib
//
//  Created by Edson Rottava on 15/07/21.
//  Copyright © 2021 Rattova's Dev. All rights reserved.
//

import UIKit

protocol UnderlineTextViewDelegate: AnyObject {
    func didBeginEditing(_ input: UnderlineTextView)
    func didEndEditing(_ input: UnderlineTextView)
}

class UnderlineTextView: UITextView {
    weak var underlineDelegate: UnderlineTextViewDelegate?
    
    var normalColor: UIColor = UIColor.gray
    var hightlighColor: UIColor = UIColor.blue
    
    var tempColor: UIColor = UIColor.black

    var bgView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.clipsToBounds = true
        view.isUserInteractionEnabled = false
        view.layer.borderColor = UIColor.gray.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 6
        return view
    }()
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
}

private extension UnderlineTextView {
    func setup() {
        self.textContainerInset = UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
        self.contentInset = UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
        self.delegate = self
        self.addSubview(bgView)
        bgView.fill(to: self, constant: 0)
        
        self.sendSubviewToBack(bgView)
    }
    
}
extension UnderlineTextView: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        UIView.animate(withDuration: 0.3, animations: {
            self.bgView.layer.borderColor = self.hightlighColor.cgColor
            self.bgView.layer.borderWidth = 2
        })
        
        underlineDelegate?.didBeginEditing(self)
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        UIView.animate(withDuration: 0.3, animations: {
            self.bgView.layer.borderColor = self.normalColor.cgColor
            self.bgView.layer.borderWidth = 1
        })
        
        underlineDelegate?.didEndEditing(self)
    }
}
