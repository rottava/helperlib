//
//  Toast.swift
//  HelperLib
//
//  Created by Edson Rottava on 15/10/19.
//  Copyright © 2019 Rattova's Dev. All rights reserved.
//

import UIKit

class Toast {
    
    class func show(message: String) {
        if var topController = UIApplication.shared.keyWindow?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            Toast.show(message: message, controller: topController)
        }
    }
    
    class func show(message: String, controller: UIViewController) {
        let toastContainer = UIView(frame: CGRect())
        toastContainer.backgroundColor = Asset.Colors.error.color
        toastContainer.alpha = 0.0
        toastContainer.layer.cornerRadius = 4
        toastContainer.clipsToBounds  =  true
        toastContainer.layer.shadowRadius = 4
        toastContainer.isUserInteractionEnabled = false

        let toastLabel = UILabel(frame: CGRect())
        toastLabel.adjustsFontSizeToFitWidth = true
        toastLabel.clipsToBounds  =  true
        toastLabel.font = UIFont.systemFont(ofSize: 12)
        toastLabel.numberOfLines = 1
        toastLabel.text = message
        toastLabel.textAlignment = .left
        toastLabel.textColor = UIColor.white
        
        toastContainer.addSubview(toastLabel)
        controller.view.addSubview(toastContainer)

        toastLabel.translatesAutoresizingMaskIntoConstraints = false
        toastContainer.translatesAutoresizingMaskIntoConstraints = false
        
        let sh = controller.view.safeAreaInsets.bottom/2

        let a1 = NSLayoutConstraint(item: toastLabel, attribute: .leading, relatedBy: .equal,
                                    toItem: toastContainer, attribute: .leading, multiplier: 1, constant: Const.space)
        let a2 = NSLayoutConstraint(item: toastLabel, attribute: .trailing, relatedBy: .equal,
                                    toItem: toastContainer, attribute: .trailing, multiplier: 1, constant: -Const.space)
        let a3 = NSLayoutConstraint(item: toastLabel, attribute: .bottom, relatedBy: .equal,
                                    toItem: toastContainer, attribute: .bottom, multiplier: 1, constant: -Const.space)
        let a4 = NSLayoutConstraint(item: toastLabel, attribute: .top, relatedBy: .equal,
                                    toItem: toastContainer, attribute: .top, multiplier: 1, constant: Const.space)
        toastContainer.addConstraints([a1, a2, a3, a4])

        let c1 = NSLayoutConstraint(item: toastContainer, attribute: .leading, relatedBy: .equal,
                                    toItem: controller.view, attribute: .leading, multiplier: 1, constant: Const.space/2)
        let c2 = NSLayoutConstraint(item: toastContainer, attribute: .trailing, relatedBy: .equal,
                                    toItem: controller.view, attribute: .trailing, multiplier: 1, constant: -Const.space/2)
        let c3 = NSLayoutConstraint(item: toastContainer, attribute: .bottom, relatedBy: .equal,
                                    toItem: controller.view, attribute: .bottom, multiplier: 1, constant: Const.space*3*Helper.hr())
        controller.view.addConstraints([c1, c2, c3])
        
        controller.view.layoutIfNeeded()
        
        c3.constant = -Const.space*Helper.hr()-sh
        UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseIn, animations: {
            controller.view.layoutIfNeeded()
            toastContainer.alpha = 1.0
        }, completion: { _ in
            c3.constant = Const.space*3*Helper.hr()
            UIView.animate(withDuration: 0.5, delay: 1.5, options: .curveEaseOut, animations: {
                controller.view.layoutIfNeeded()
                toastContainer.alpha = 0.0
            }, completion: {_ in
                toastContainer.removeFromSuperview()
            })
        })
    }
    
    class func showDefault(message: String, controller: UIViewController) {
        let toastContainer = UIView(frame: CGRect())
        toastContainer.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastContainer.alpha = 0.0
        toastContainer.layer.cornerRadius = 16
        toastContainer.clipsToBounds  =  true

        let toastLabel = UILabel(frame: CGRect())
        toastLabel.adjustsFontSizeToFitWidth = true
        toastLabel.clipsToBounds  =  true
        toastLabel.font = UIFont.systemFont(ofSize: 12)
        toastLabel.numberOfLines = 1
        toastLabel.text = message
        toastLabel.textAlignment = .center
        toastLabel.textColor = UIColor.white
        
        toastContainer.addSubview(toastLabel)
        controller.view.addSubview(toastContainer)

        toastLabel.translatesAutoresizingMaskIntoConstraints = false
        toastContainer.translatesAutoresizingMaskIntoConstraints = false

        let a1 = NSLayoutConstraint(item: toastLabel, attribute: .leading, relatedBy: .equal,
                                    toItem: toastContainer, attribute: .leading, multiplier: 1, constant: 8)
        let a2 = NSLayoutConstraint(item: toastLabel, attribute: .trailing, relatedBy: .equal,
                                    toItem: toastContainer, attribute: .trailing, multiplier: 1, constant: -8)
        let a3 = NSLayoutConstraint(item: toastLabel, attribute: .bottom, relatedBy: .equal,
                                    toItem: toastContainer, attribute: .bottom, multiplier: 1, constant: -8)
        let a4 = NSLayoutConstraint(item: toastLabel, attribute: .top, relatedBy: .equal,
                                    toItem: toastContainer, attribute: .top, multiplier: 1, constant: 8)
        toastContainer.addConstraints([a1, a2, a3, a4])

        let c1 = NSLayoutConstraint(item: toastContainer, attribute: .leading, relatedBy: .equal,
                                    toItem: controller.view, attribute: .leading, multiplier: 1, constant: 65)
        let c2 = NSLayoutConstraint(item: toastContainer, attribute: .trailing, relatedBy: .equal,
                                    toItem: controller.view, attribute: .trailing, multiplier: 1, constant: -65)
        let c3 = NSLayoutConstraint(item: toastContainer, attribute: .bottom, relatedBy: .equal,
                                    toItem: controller.view, attribute: .bottom, multiplier: 1, constant: -75)
        controller.view.addConstraints([c1, c2, c3])

        UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseIn, animations: {
            toastContainer.alpha = 1.0
        }, completion: { _ in
            UIView.animate(withDuration: 0.5, delay: 1.5, options: .curveEaseOut, animations: {
                toastContainer.alpha = 0.0
            }, completion: {_ in
                toastContainer.removeFromSuperview()
            })
        })
    }
}
