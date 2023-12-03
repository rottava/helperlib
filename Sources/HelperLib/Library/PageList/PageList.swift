//
//  PageList.swift
//  HelperLib
//
//  Created by Edson Rottava on 21/07/21.
//  Copyright © 2021 Rattova's Dev. All rights reserved.
//

import UIKit

class PageList: UIView {
    weak var delegate: GenericDelegate?

    var currentPage = 1
    var pages: [UIView] = []
    var completion: NSLayoutConstraint?
    var leftPage: NSLayoutConstraint?
    
    // MARK: View
    let innerView: UIView = {
        let view = UIView()
        return view
    }()
    
    let divider: UIView = {
        let view = UIView()
        view.backgroundColor = Asset.Colors.offWhite.color
        view.height(constant: 2)
        view.isUserInteractionEnabled = false
        return view
    }()
    
    let fCompletionView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    let completionView: UIView = {
        let view = UIView()
        view.backgroundColor = Asset.Colors.secondary.color
        return view
    }()
    
    let backButton: IconButton = {
        let i = Asset.Icons.chevL.image
        let l = L10n.System.Button.back.uppercased()
        let button = IconButton(i, l)
        button.accessibilityHint = L10n.System.Button.backHint
        button.accessibilityLabel = L10n.System.Button.back
        button.alpha = 0
        //button.setImage(Asset.Icons.chevL.image, for: .normal)
        //button.setTitle(L10n.System.Button.back, for: .normal)
        button.setTitleColor(Asset.Colors.gray2.color, for: .disabled)
        button.setTitleColor(Asset.Colors.black.color, for: .normal)
        button.tag = 1
        button.iconLabel.adjustsFontSizeToFitWidth = true
        button.iconLabel.font = UIFont(name: "Flexo-Regular", size: 14*Helper.wr())
        return button
    }()
    
    let nextButton: IconButton = {
        let i = Asset.Icons.chevR.image
        let l = L10n.System.Button.cont.uppercased()
        let button = IconButton(l, i)
        button.accessibilityHint = L10n.System.Button.contHint
        button.accessibilityLabel = L10n.System.Button.cont
        button.isEnabled = false
        //button.setImage(Asset.Icons.chevR.image, for: .normal)
        //button.setTitle(L10n.System.Button.cont, for: .normal)
        button.setTitleColor(Asset.Colors.gray2.color, for: .disabled)
        button.setTitleColor(Asset.Colors.secondary.color, for: .normal)
        button.tag = 2
        button.iconLabel.adjustsFontSizeToFitWidth = true
        button.iconLabel.font = UIFont(name: "Flexo-Regular", size: 14*Helper.wr())
        return button
    }()
    
    // MARK: Overrides
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    // MARK: Set Inner Views
    func setInner(_ views: [UIView]) {
        for i in 0..<views.count {
            pages.append(views[i])
            
            innerView.addSubview(views[i])
            views[i].fillVertical(to: innerView)
            views[i].width(equalTo: self)
            views[i].left(equalTo: i == 0 ? innerView.leftAnchor : views[i-1].rightAnchor)
            
            if i == views.count-1 { views[i].right(equalTo: innerView) }
        }
        
        innerView.width(equalTo: self, multiplier: CGFloat(pages.count))
        completion?.constant = UIScreen.main.bounds.width*0.35/CGFloat(pages.count)
    }
}

private extension PageList {
    // MARK: Setup
    func setup() {
        self.backgroundColor = .white
        self.clipsToBounds = true
        
        self.addSubview(innerView)
        innerView.top(equalTo: self, constant: 0)
        leftPage = innerView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0)
        leftPage?.isActive = true
        //innerView.width(constant: self.bounds.width*CGFloat(pages.count))
        
        self.addSubview(divider)
        divider.topToBottom(of: innerView, constant: 0)
        divider.fillHorizontal(to: self, constant: 0)
        
        self.addSubview(backButton)
        backButton.topToBottom(of: divider, constant: Const.space/2)
        backButton.left(equalTo: self, constant: Const.space/2)
        backButton.bottom(equalTo: self, constant: -Const.space/2)
        //backButton.width(constant: 100*Helper.wr())
        
        self.addSubview(nextButton)
        nextButton.topToBottom(of: divider, constant: Const.space/2)
        nextButton.right(equalTo: self, constant: -Const.space/2)
        nextButton.bottom(equalTo: self, constant: -Const.space/2)
        //nextButton.width(constant: 100*Helper.wr())
        
        self.addSubview(fCompletionView)
        fCompletionView.centerY(equalTo: backButton)
        fCompletionView.centerX(equalTo: self)
        fCompletionView.width(equalTo: self, multiplier: 0.35)
        fCompletionView.height(constant: 4*Helper.wr())
        
        fCompletionView.addSubview(completionView)
        completionView.fillVertical(to: fCompletionView)
        completionView.left(equalTo: fCompletionView)
        completion = completionView.widthAnchor.constraint(equalToConstant: 0)
        completion?.isActive = true
        
        backButton.addTarget(self,
                             action: #selector(didTouchButton(_:)),
                             for: .touchUpInside)
        
        nextButton.addTarget(self,
                             action: #selector(didTouchButton(_:)),
                             for: .touchUpInside)
        
        //setupInner()
    }
    
}

extension PageList {
    @objc
    func didTouchButton(_ button: UIButton) {
        switch(button.tag) {
        case 1:
            didTapBack()
        case 2:
            didTapNext(button)
        default:
            break
        }
        
        delegate?.didTouch(button)
    }
    
    // MARK: Back Action
    func didTapBack() {
        if(currentPage > 1) {
            currentPage = currentPage-1
            let m = CGFloat(currentPage)/CGFloat(pages.count)
            completion?.constant = fCompletionView.bounds.width * m
            
            let n = CGFloat(currentPage-1)
            leftPage?.constant = -bounds.width * n
            
            UIView.animate(withDuration: 0.3, animations: {
                self.layoutIfNeeded()
                
                if (self.currentPage == 1) {
                    self.backButton.alpha = 0
                }
                
            }, completion: nil)
        }
    }
    
    // MARK: Next Action
    func didTapNext(_ button: UIButton) {
        if(currentPage < pages.count) {
            currentPage = currentPage+1
            let m = CGFloat(currentPage)/CGFloat(pages.count)
            completion?.constant = fCompletionView.bounds.width * m
            
            let n = CGFloat(currentPage-1)
            leftPage?.constant = -bounds.width * n
            
            UIView.animate(withDuration: 0.3, animations: {
                self.layoutIfNeeded()
                
                if (self.currentPage > 1) {
                    self.backButton.alpha = 1
                }
                
            }, completion: nil)
        } else {
            //delegate.didTapRegister(button)
        }
    }
}
