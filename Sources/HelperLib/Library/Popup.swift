//
//  Popup.swift
//  HelperLib
//
//  Created by Edson Rottava on 17/06/21.
//  Copyright © 2021 Rattova's Dev. All rights reserved.
//

import UIKit

class Popup: UIView {
    var completion = {}
    
    let popup: UIView = {
        let view = UIView()
        view.alpha = 0
        view.backgroundColor = Asset.Colors.white.color
        view.layer.cornerRadius = 8
        return view
    }()
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let headLabel: UILabel = {
        let label = UILabel()
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont(name: "Flexo-Bold", size: 20*Helper.wr())
        label.text = "Header"
        label.textAlignment = .center
        label.textColor = Asset.Colors.black.color
        return label
    }()
    
    let textView: UITextView = {
        let view = UITextView()
        view.backgroundColor = .white
        view.font = UIFont(name: "Flexo-Regular", size: 16*Helper.wr())
        //label.numberOfLines = 0
        view.isEditable = false
        view.isScrollEnabled = false
        view.text = "Description"
        view.textAlignment = .center
        view.textColor = Asset.Colors.black.color
        return view
    }()
    
    let doneButton: AnimatedButton = {
        let button = AnimatedButton(.replace)
        button.backgroundColor = Asset.Colors.primary.color
        button.contentEdgeInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        button.layer.cornerRadius = 24*Helper.wr()
        button.setTitle("OK", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Flexo-Medium", size: 14*Helper.hr())
        
        button.animatedBackgroundColor = Asset.Colors.primaryDark.color
        return button
    }()
    
    let closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.contentEdgeInsets = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
        button.imageView?.contentMode = .scaleAspectFit
        button.setTitle("", for: .normal)
        button.setImage(Asset.Icons.close.image, for: .normal)
        button.tintColor = UIColor.black.withAlphaComponent(0.9)
        return button
    }()
    
    convenience init(_ image: UIImage?, _ head: String?, _ desc: String?, _ done: String?, _ action: @escaping () -> Void = {}) {
        self.init()
        imageView.image = image
        headLabel.text = head
        setText(desc)
        //textView.text = desc
        doneButton.setTitle(done, for: .normal)
        completion = action
        setupImage()
        setMaxHeight()
    }
    
    convenience init(_ head: String?,
                     _ desc: String?,
                     _ done: String?,
                     _ action: @escaping () -> Void = {}) {
        self.init()
        headLabel.text = head
        setText(desc)
        //textView.text = desc
        doneButton.setTitle(done, for: .normal)
        completion = action
        setupHeader()
        setMaxHeight()
    }
    
    convenience init(_ desc: String?,
                     _ done: String?,
                     _ action: @escaping () -> Void = {}) {
        self.init()
        //headLabel.text = head
        setText(desc)
        //textView.text = desc
        doneButton.setTitle(done, for: .normal)
        completion = action
        setMaxHeight()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func setCancelable(_ cancelable: Bool) {
        if cancelable {
            doneButton.option = .fade
            doneButton.backgroundColor = .clear
            doneButton.setTitleColor(Asset.Colors.gray1.color, for: .normal)
        } else {
            doneButton.option = .replace
            doneButton.backgroundColor = Asset.Colors.primary.color
            doneButton.setTitleColor(.white, for: .normal)
            doneButton.animatedBackgroundColor = Asset.Colors.primaryDark.color
        }
    }
    
    func setClosable(_ closable: Bool) {
        if closable {
            popup.addSubview(closeButton)
            closeButton.top(equalTo: popup, constant: 12)
            closeButton.right(equalTo: popup, constant: -12)
            closeButton.size(constant: 24)
        } else {
            closeButton.removeFromSuperview()
        }
    }
    
    func setText(_ text: String?) {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.19
        paragraphStyle.alignment = .center
        textView.attributedText = NSMutableAttributedString(string: text ?? "", attributes: [NSAttributedString.Key.kern: 0.25, NSAttributedString.Key.paragraphStyle: paragraphStyle, NSAttributedString.Key.font: UIFont(name: "Flexo-Regular", size: 16*Helper.wr()) ?? UIFont.systemFont(ofSize: 16)])
    }
}

extension Popup {
    
    func hide() {
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: [], animations: {
            self.backgroundColor = .clear
            self.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
         }) { (success) in
            self.removeFromSuperview()
            self.completion()
         }
    }
    
    func show() {
        if var topController = UIApplication.shared.keyWindow?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            show(in: topController.view)
        }
    }
    
    func show(in view: UIView) {
        self.center = view.center
        self.popup.alpha = 1
        self.transform = CGAffineTransform(scaleX: 0.8, y: 1.2)

        view.addSubview(self)
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: [],  animations: {
            self.backgroundColor = UIColor.black.withAlphaComponent(0.8)
            self.transform = .identity
        })
    }
}

private extension Popup {
    func setup() {
        self.height(constant: UIScreen.main.bounds.height)
        self.width(constant: UIScreen.main.bounds.width)
        
        self.addSubview(popup)
        popup.fillHorizontal(to: self, constant: 16)
        popup.centerY(equalTo: self)
        
        //popup.addSubview(headLabel)
        //headLabel.top(equalTo: popup, constant: 24*Helper.hr())
        //headLabel.fillHorizontal(to: popup, constant: 16)
        
        popup.addSubview(textView)
        //descLabel.topToBottom(of: headLabel, constant: 24*Helper.hr())
        textView.top(greaterThan: popup, constant: 24*Helper.hr())
        textView.fillHorizontal(to: popup, constant: 16)
        
        popup.addSubview(doneButton)
        doneButton.topToBottom(of: textView, constant: 32*Helper.hr())
        doneButton.centerX(equalTo: popup)
        doneButton.bottom(equalTo: popup, constant: -24*Helper.hr())
        doneButton.width(equalTo: popup, multiplier: 0.5)
        doneButton.height(constant: 48*Helper.wr())
        //headLabel.fillHorizontal(to: self, constant: 16)
        
        doneButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        closeButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    func setupHeader() {
        popup.addSubview(headLabel)
        headLabel.top(equalTo: popup, constant: 24*Helper.hr())
        headLabel.fillHorizontal(to: popup, constant: 16)
        headLabel.bottom(equalTo: textView.topAnchor, constant: -24*Helper.hr())
    }
    
    func setupImage() {
        popup.addSubview(imageView)
        imageView.top(equalTo: popup, constant: 24*Helper.hr())
        //imageView.fillHorizontal(to: popup, constant: 16)
        imageView.centerX(equalTo: popup)
        imageView.size(constant: 88*Helper.wr())
        
        popup.addSubview(headLabel)
        headLabel.top(equalTo: imageView.bottomAnchor, constant: 24*Helper.hr())
        headLabel.fillHorizontal(to: popup, constant: 16)
        headLabel.bottom(equalTo: textView.topAnchor, constant: -24*Helper.hr())
    }
    
    @objc
    func didTapButton() {
        hide()
    }
    
    func setMaxHeight() {
        //let height = UIApplication.shared.keyWindow?.window?.safeAreaLayoutGuide.layoutFrame.size.height ?? UIScreen.main.bounds.height
        let textSize = CGSize(width: CGFloat(textView.frame.size.width), height: CGFloat(MAXFLOAT))
        let rHeight = CGFloat(lroundf(Float(textView.sizeThatFits(textSize).height)))
        //let sub = 96+((128)*Helper.hr())+((156)*Helper.wr())
        let maxH: CGFloat = 210*Helper.hr()//height-sub
        let h = rHeight * 1.5
        if h > maxH {
            textView.isScrollEnabled = true
            textView.height(constant: maxH)
        }
    }
}
