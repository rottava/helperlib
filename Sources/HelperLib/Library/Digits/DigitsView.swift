//
//  DigitsView.swift
//  HelperLib
//
//  Created by Edson Rottava on 17/06/21.
//  Copyright © 2021 Rattova's Dev. All rights reserved.
//

import UIKit

protocol DigitsViewDelegate: AnyObject {
    func didCompleted(with code: String)
}

class DigitsView: UIStackView {
    
    weak var delegate: DigitsViewDelegate?
    
    let digit1: DigitField = {
        let field = DigitField()
        field.font = UIFont(name: "Flexo-Regular", size: 16*Helper.wr())
        field.keyboardType = .numberPad
        field.tag = 1
        field.textAlignment = .center
        field.textColor = Asset.Colors.black.color
        return field
    }()
    
    let digit2: DigitField = {
        let field = DigitField()
        field.font = UIFont(name: "Flexo-Regular", size: 16*Helper.wr())
        field.keyboardType = .numberPad
        field.tag = 2
        field.textAlignment = .center
        field.textColor = Asset.Colors.black.color
        return field
    }()
    
    let digit3: DigitField = {
        let field = DigitField()
        field.font = UIFont(name: "Flexo-Regular", size: 16*Helper.wr())
        field.keyboardType = .numberPad
        field.tag = 3
        field.textAlignment = .center
        field.textColor = Asset.Colors.black.color
        return field
    }()
    
    let digit4: DigitField = {
        let field = DigitField()
        field.font = UIFont(name: "Flexo-Regular", size: 16*Helper.wr())
        field.keyboardType = .numberPad
        field.tag = 4
        field.textAlignment = .center
        field.textColor = Asset.Colors.black.color
        return field
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func isFull() -> Bool {
        guard let d1 = digit1.text?.isEmpty,
              let d2 = digit2.text?.isEmpty,
              let d3 = digit3.text?.isEmpty,
              let d4 = digit4.text?.isEmpty else { return false }
        return !(d1 && d2 && d3 && d4)
    }
    
    func getCode() -> String {
        guard let d1 = digit1.text,
              let d2 = digit2.text,
              let d3 = digit3.text,
              let d4 = digit4.text else { return "" }
        return d1+d2+d3+d4
    }
}

private extension DigitsView {
    func setup() {
        self.axis = .horizontal
        self.distribution = .fill
        
        let v1 = UIView()
        v1.width(constant: 8)
        let v2 = UIView()
        v2.width(constant: 8)
        let v3 = UIView()
        v3.width(constant: 8)
        
        self.addArrangedSubview(digit1)
        self.addArrangedSubview(v1)
        self.addArrangedSubview(digit2)
        self.addArrangedSubview(v2)
        self.addArrangedSubview(digit3)
        self.addArrangedSubview(v3)
        self.addArrangedSubview(digit4)
        
        digit2.width(equalTo: digit1)
        digit3.width(equalTo: digit1)
        digit4.width(equalTo: digit1)
        
        digit1.digitDelegate = self
        digit2.digitDelegate = self
        digit3.digitDelegate = self
        digit4.digitDelegate = self
    }
}



extension DigitsView: DigitFieldDelegate {
    
    func moveToNext(_ digitField: DigitField) {
        switch digitField.tag {
        case 1:
            if let v = self.viewWithTag(2) { v.becomeFirstResponder() }
        case 2:
            if let v = self.viewWithTag(3) { v.becomeFirstResponder() }
        case 3:
            if let v = self.viewWithTag(4) { v.becomeFirstResponder() }
        case 4:
            break
        default:
            break
        }
    }
    
    func moveToPrevious(_ digitField: DigitField) {
        switch digitField.tag {
        case 1:
            break
        case 2:
            if let v = self.viewWithTag(1) { v.becomeFirstResponder() }
        case 3:
            if let v = self.viewWithTag(2) { v.becomeFirstResponder() }
        case 4:
            if let v = self.viewWithTag(3) { v.becomeFirstResponder() }
        default:
            break
        }
    }
    
    func digitFieldDidChange(_ digitField: DigitField) {
        delegate?.didCompleted(with: getCode())
    }
}
