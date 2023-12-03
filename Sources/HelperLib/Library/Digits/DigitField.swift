//
//  DigitField.swift
//  HelperLib
//
//  Created by Edson Rottava on 17/06/21.
//  Copyright © 2021 Rattova's Dev. All rights reserved.
//

import UIKit

protocol DigitFieldDelegate: AnyObject {
    func digitFieldDidChange(_ digitField: DigitField)
    func moveToNext(_ digitField: DigitField)
    func moveToPrevious(_ digitField: DigitField)
}

class DigitField: UITextField {
    weak var digitDelegate: DigitFieldDelegate?
    
    let padding = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)

    var bgView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.clipsToBounds = true
        view.isUserInteractionEnabled = false
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 4
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func deleteBackward() {
        if(self.text?.isEmpty ?? true) { digitDelegate?.moveToPrevious(self) }
        super.deleteBackward()
    }
}

private extension DigitField {
    func setup() {
        self.layoutMargins = UIEdgeInsets(top: 8, left: 12, bottom: 8, right: 12)

        self.addSubview(bgView)
        bgView.fill(to: self)
        
        self.addTarget(self,
                       action: #selector(textFieldDidChange(_:)),
                       for: .editingChanged)
    }
    
    @objc
    func textFieldDidChange(_ digitField: DigitField) {
        var f = ""
        var i = 0
        let t = Sanityze.number(digitField.text ?? "")
        
        for c in t {
            i += 1
            if (i < 2) { f.append(c) }
        }
        
        digitField.text = f
        if (!f.isEmpty) { digitDelegate?.moveToNext(self) }
        digitDelegate?.digitFieldDidChange(digitField)
    }
}
