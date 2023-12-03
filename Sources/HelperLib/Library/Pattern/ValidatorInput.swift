//
//  ValidatorInput.swift
//  HelperLib
//
//  Created by Edson Rottava on 16/06/21.
//  Copyright © 2021 Rattova's Dev. All rights reserved.
//

import UIKit

protocol ValidatorInputDelegate: AnyObject {
    func didBeginEditing(_ input: ValidatorInput)
    func didChange(_ input: ValidatorInput)
    func didEndEditing(_ input: ValidatorInput, _ valid: Bool)
    func didReturn(_ input: ValidatorInput)
}

class ValidatorInput: UITextField {
    weak var validatorDelegate: ValidatorInputDelegate?
    var inputEnabled = true
    var kind: ValidateType = .none
    var padding = UIEdgeInsets(top: 4, left: 16, bottom: 4, right: 16)
    
    var disabledColor: UIColor = UIColor.gray
    var errorColor: UIColor = UIColor.red
    var hightlighColor: UIColor = UIColor.blue
    
    var tempColor: UIColor = UIColor.black

    var bgView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.clipsToBounds = true
        view.isUserInteractionEnabled = false
        view.layer.borderColor = UIColor.gray.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 6
        return view
    }()

    var errorLabel: UILabel = {
        let label = UILabel()
        label.alpha = 0
        label.font = UIFont(name: "Flexo-Regular", size: 12*Helper.wr())
        label.text = ""
        label.textColor = .red
        return label
    }()
    
    convenience init(kind: ValidateType) {
        self.init()
        self.kind = kind
    }
    
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
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
}

private extension ValidatorInput {
    func setup() {
        self.backgroundColor = .clear
        self.font = UIFont(name: "Flexo-Regular", size: 16*Helper.wr())
        self.textColor = Asset.Colors.black.color
        self.delegate = self
        self.addSubview(bgView)
        bgView.fill(to: self)
        
        
        self.addSubview(errorLabel)
        errorLabel.fillHorizontal(to: bgView, constant: 12)
        errorLabel.topToBottom(of: bgView, constant: 4)
        
        self.addTarget(self,
                       action: #selector(textFieldDidChange),
                       for: .editingChanged)
    }
    
    @objc
    func textFieldDidChange() {
        switch self.kind {
        case .cardCvv:
            self.text = Format.cardCVV(self.text ?? "")
        case .cardNumber:
            self.text = Format.cardNumber(self.text ?? "")
        case .cardVal:
            self.text = Format.cardVal(self.text ?? "")
        case .cep:
            self.text = Format.cep(self.text ?? "")
        case .cnh:
            self.text = Format.cnh(self.text ?? "")
        case .cnpj:
            self.text = Format.cnpj(self.text ?? "")
        case .cpf:
            self.text = Format.cpf(self.text ?? "")
        case .cpfj:
            let t = Sanityze.number(self.text ?? "")
            self.text = t.count > 11
                ? Format.cnpj(t)
                : Format.cpf(t)
        case .date:
            self.text = Format.date(self.text ?? "")
        case .number:
            self.text = Sanityze.number(self.text ?? "")
        case .phone:
            self.text = Format.phone(self.text ?? "")
        case .time:
            self.text = Format.time(self.text ?? "")
        default:
            break
        }
        validatorDelegate?.didChange(self)
    }
    
}
extension ValidatorInput: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        validatorDelegate?.didBeginEditing(self)
        
        UIView.animate(withDuration: 0.3, animations: {
            if self.textColor == self.errorColor { self.textColor = self.tempColor }
            else { self.tempColor = self.textColor ?? .black }
            self.bgView.layer.borderColor = self.hightlighColor.cgColor
            self.bgView.layer.borderWidth = 2
            self.errorLabel.alpha = 0
        })
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let t = self.text ?? ""
        let v = Validate.text(t, type: self.kind)
        
        if (v) {
            UIView.animate(withDuration: 0.3, animations: {
                self.bgView.layer.borderColor = self.disabledColor.cgColor
                self.bgView.layer.borderWidth = 1
                self.errorLabel.alpha = 0
            })
        } else {
            UIView.animate(withDuration: 0.3, animations: {
                self.textColor = self.errorColor
                self.bgView.layer.borderColor = self.errorColor.cgColor
                self.bgView.layer.borderWidth = 2
                self.errorLabel.alpha = 1
            })
        }
        
        validatorDelegate?.didEndEditing(self, v)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return inputEnabled
    }
    
    override func shouldChangeText(in range: UITextRange, replacementText text: String) -> Bool {
        return inputEnabled ? super.shouldChangeText(in: range, replacementText: text) : false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.resignFirstResponder()
        validatorDelegate?.didReturn(self)
        return true
    }
}
