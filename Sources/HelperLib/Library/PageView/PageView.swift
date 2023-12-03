//
//  PageView.swift
//  HelperLib
//
//  Created by Edson Rottava on 21/07/21.
//  Copyright © 2021 Rattova's Dev. All rights reserved.
//

import UIKit

class PageView: UIView {
    
    // MARK: View
    let headerImage: UIImageView = {
        let view = UIImageView()
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    let headerLabel: UILabel = {
        let label = UILabel()
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont(name: "Flexo-Regular", size: 14*Helper.wr())
        label.numberOfLines = 2
        label.textColor = Asset.Colors.black.color
        return label
    }()
    
    let headerView: UIView = {
        let view = UIView()
        return view
    }()
    
    let pageView: UIView = {
        let view = UIView()
        return view
    }()
    
    // MARK: Overrides
    convenience init(_ text: String?, _ image: UIImage, _ page: UIView) {
        self.init()
        setHeader(text, image)
        setPage(page)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    // MARK: Setup
    private func setup() {
        self.addSubview(headerView)
        headerView.top(equalTo: self)
        headerView.fillHorizontal(to: self)
        
        headerView.addSubview(headerImage)
        headerImage.top(equalTo: headerView, constant: Const.space*1.5)
        headerImage.bottom(equalTo: headerView, constant: -Const.space*1.5)
        headerImage.left(equalTo: headerView, constant: Const.space)
        headerImage.size(constant: 48*Helper.wr())
        
        headerView.addSubview(headerLabel)
        headerLabel.centerY(equalTo: headerImage)
        headerLabel.left(equalTo: headerImage.rightAnchor, constant: Const.space)
        headerLabel.right(equalTo: headerView, constant: -Const.space)
        
        self.addSubview(pageView)
        pageView.topToBottom(of: headerView)
        pageView.fillHorizontal(to: self)
        pageView.bottom(equalTo: self)
    }
    
    func setHeader(_ text: String?, _ image: UIImage = UIImage()) {
        headerImage.image = image
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.19
        headerLabel.attributedText =
        NSAttributedString(string: text ?? "",
                           attributes: [NSAttributedString.Key.kern: 0.25,
                                        NSAttributedString.Key.paragraphStyle: paragraphStyle])
    }
    
    func setPage(_ page: UIView) {
        pageView.addSubview(page)
        page.fill(to: pageView)
    }
}
