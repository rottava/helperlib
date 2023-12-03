//
//  IconButton.swift
//  HelperLib
//
//  Created by Edson Rottava on 17/06/21.
//  Copyright © 2021 Rattova's Dev. All rights reserved.
//

import UIKit

class IconButton: UIButton {
    let iconLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let iconImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage()
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    let contentView: UIView = {
        let view = UIView()
        view.isUserInteractionEnabled = false
        return view
    }()
    
    var normalColor: UIColor? = .black
    var disabledColor: UIColor? = .black
    
    var normalImage: UIImage? = UIImage()
    var disabledImage: UIImage? = UIImage()
    
    convenience init(_ label: String, _ image: UIImage) {
        self.init()
        prepare(label, image)
    }
    
    convenience init(_ image: UIImage, _ label: String) {
        self.init()
        prepare(image, label)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    override func setTitle(_ title: String?, for state: UIControl.State) {
        iconLabel.text = title
    }
    
    override func setTitleColor(_ color: UIColor?, for state: UIControl.State) {
        if (state == .normal) { normalColor = color }
        else { disabledColor = color }
        if (self.state == state) {
            iconLabel.textColor = color
            let c = isEnabled ? normalColor : disabledColor
            iconImage.image = iconImage.image?.withColor(c ?? .black)
        }
    }
    
    override func setImage(_ image: UIImage?, for state: UIControl.State) {
        if (state == .normal) { normalImage = image }
        else { disabledImage = image }
        if (self.state == state) {
            let c = state == .normal ? normalColor : disabledColor
            iconImage.image = iconImage.image?.withColor(c ?? .black)
        }
    }
    
    override var isEnabled: Bool {
        didSet {
            iconLabel.textColor = isEnabled ? normalColor : disabledColor
            
            let c = isEnabled ? normalColor : disabledColor
            iconImage.image = iconImage.image?.withColor(c ?? .black)
        }
    }
    
    @objc
    func animateStart() {
        UIView.animate(withDuration: 0.3, animations: {
            self.iconLabel.alpha = 0.4
            self.iconImage.alpha = 0.4
        })
    }
    
    @objc
    func animateEnd() {
        UIView.animate(withDuration: 0.3, animations: {
            self.iconLabel.alpha = 1
            self.iconImage.alpha = 1
         })
    }
    
    func centralize() {
        contentView.removeFromSuperview()
        self.addSubview(contentView)
        contentView.height(lessThan: self)
        contentView.width(lessThan: self)
        contentView.centerX(equalTo: self)
        contentView.centerY(equalTo: self)
    }
}

private extension IconButton {
    func setup() {
        self.imageView?.removeFromSuperview()
        self.titleLabel?.removeFromSuperview()
    
        self.addSubview(contentView)
        contentView.addSubview(iconLabel)
        contentView.addSubview(iconImage)
        
        self.clipsToBounds = true
        self.addTarget(self, action: #selector(animateStart), for: .touchDown)
        self.addTarget(self, action: #selector(animateEnd), for: [.touchCancel, .touchUpOutside, .touchUpInside])
    }
    
    func prepare(_ label: String, _ image: UIImage) {
        contentView.fill(to: self)
        
        iconLabel.fillVertical(to: contentView, constant: 4)
        iconLabel.left(equalTo: contentView, constant: 4)
        //iconImage.fillVertical(to: self, constant: 12)
        iconImage.centerY(equalTo: iconLabel, constant: -0.5)
        iconImage.left(equalTo: iconLabel.rightAnchor, constant: 8)
        iconImage.right(equalTo: contentView, constant: -4)
        iconImage.aspectRatio(1)
        
        iconLabel.text = label
        iconImage.image = image
        normalImage = image
        disabledImage = image
    }
    
    func prepare(_ image: UIImage, _ label: String) {
        contentView.fill(to: self)
        //iconImage.fillVertical(to: self, constant: 12)
        iconImage.centerY(equalTo: iconLabel, constant: -0.5)
        iconImage.left(equalTo: contentView, constant: 4)
        iconImage.aspectRatio(1)
        iconLabel.fillVertical(to: contentView, constant: 4)
        iconLabel.left(equalTo: iconImage.rightAnchor, constant: 8)
        iconLabel.right(equalTo: contentView, constant: -4)
        
        iconLabel.text = label
        iconImage.image = image
        normalImage = image
        disabledImage = image
    }
}
