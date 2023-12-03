//
//  ValidatorInputSearch.swift
//  HelperLib
//
//  Created by Edson Rottava on 18/08/21.
//  Copyright © 2021 Rattova's Dev. All rights reserved.
//

import UIKit

class ValidatorInputSearch: ValidatorInput {
    var rotateEnabled = true
    var paddingEnabled = true
    
    var button: UIButton = {
        let button = UIButton(type: .system)
        button.isAccessibilityElement = false
        button.imageView?.clipsToBounds = true
        button.imageView?.contentMode = .scaleAspectFit
        button.imageView?.fill(to: button, constant: Const.space*0.8)
        button.setImage(Asset.Icons.search.image, for: .normal)
        button.setTitle("", for: .normal)
        button.tintColor = Asset.Colors.gray1.color
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
                           width: bounds.maxX-64, height: bounds.maxY-8)
        return paddingEnabled ? frame : super.editingRect(forBounds: bounds)
    }

}

private extension ValidatorInputSearch {
    func setup() {
        rightViewMode = .always
        
        padding = UIEdgeInsets(top: 4, left: 16, bottom: 4, right: 64)
        
        let v = UIView()
        //v.isUserInteractionEnabled = false
        v.addSubview(button)
        button.size(constant: Const.space*2+24*Helper.wr())
        button.centerY(equalTo: v)
        button.centerX(equalTo: v)
        //imageView.fillHorizontal(to: v, constant: Const.space)
        v.size(constant: Const.space*2+24*Helper.wr())
        
        rightView = v
        
        button.addTarget(self, action: #selector(didTouch(_:)), for: .touchUpInside)
    }
    
    @objc
    func didTouch(_ view: UIView) {
        self.resignFirstResponder()
    }
}
