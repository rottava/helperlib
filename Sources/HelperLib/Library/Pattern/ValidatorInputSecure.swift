//
//  ValidatorInputSecure.swift
//  HelperLib
//
//  Created by Edson Rottava on 16/06/21.
//  Copyright © 2021 Rattova's Dev. All rights reserved.
//

import UIKit

class ValidatorInputSecure: ValidatorInput {
    var button: UIButton = {
        let button = UIButton()
        button.setTitle("", for: .normal)
        button.setImage(Asset.Icons.eye.image, for: .normal)
        button.imageView?.clipsToBounds = true
        button.imageView?.contentMode = .scaleAspectFit
        button.imageEdgeInsets = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
        return button
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
                           width: bounds.maxX-44, height: bounds.maxY-8)
        return frame
    }
}

private extension ValidatorInputSecure {
    func setup() {
        self.rightViewMode = .always
        self.isSecureTextEntry = true
        
        let v = UIView()
        v.height(constant: 30)
        v.width(constant: 44)
        
        v.addSubview(button)
        button.size(constant: 30)
        button.centerX(equalTo: v)
        
        rightView = v
        
        button.addTarget(self,
                       action: #selector(didTapButton),
                       for: .touchUpInside)
        self.bringSubviewToFront(button)
    }
    
    @objc
    func didTapButton() {
        isSecureTextEntry = !isSecureTextEntry
        
        UIView.transition(with: button, duration: 0.2, options: .transitionCrossDissolve, animations: {
            self.isSecureTextEntry
                ? self.button.setImage(Asset.Icons.eye.image, for: .normal)
                : self.button.setImage(Asset.Icons.eyeClosed.image, for: .normal)
        }, completion: nil)
    }
}
