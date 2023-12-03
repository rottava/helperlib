//
//  ValidatorInputPicker.swift
//  HelperLib
//
//  Created by Edson Rottava on 07/07/21.
//  Copyright © 2021 Rattova's Dev. All rights reserved.
//

import UIKit

class ValidatorInputPicker: ValidatorInput {
    var rotateEnabled = true
    var paddingEnabled = true
    
    var imageView: UIImageView = {
        let imageView = UIImageView(image: Asset.Icons.drop.image)
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        let frame = CGRect(x: bounds.minX+16, y: bounds.minY+4,
                           width: bounds.maxX-56, height: bounds.maxY-8)
        return paddingEnabled ? frame : super.editingRect(forBounds: bounds)
    }

}

private extension ValidatorInputPicker {
    func setup() {
        self.autocorrectionType = .no
        self.inputEnabled = false
        self.rightViewMode = .always        
        
        let v = UIView()
        v.height(constant: 10)
        v.width(constant: 56)
        
        v.addSubview(imageView)
        imageView.size(constant: 10)
        imageView.centerX(equalTo: v)
        
        rightView = v
        
        tintColor = .clear
    }
}

extension ValidatorInputPicker {
    override func textFieldDidBeginEditing(_ textField: UITextField) {
        super.textFieldDidBeginEditing(textField)
        if self.rotateEnabled {
            UIView.animate(withDuration: 0.3, animations: {
                self.imageView.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
            })
        }
    }
    
    override func textFieldDidEndEditing(_ textField: UITextField) {
        super.textFieldDidEndEditing(textField)
        if self.rotateEnabled {
            UIView.animate(withDuration: 0.3, animations: {
                self.imageView.transform = CGAffineTransform(rotationAngle: 0)
            })
        }
    }
    
    override func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return false
    }
    
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        if action == #selector(paste(_:)) {
            return false
        }

        return false
    }
}
