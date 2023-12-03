//
//  ImageZoomView.swift
//  HelperLib
//
//  Created by Edson Rottava on 10/08/21.
//  Copyright © 2021 Rattova's Dev. All rights reserved.
//

import UIKit

class ImageZoomView: UIScrollView {
    var tap = UITapGestureRecognizer()
    
    var imageView: UIImageView = {
        let view = UIImageView(image: UIImage())
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    convenience init(frame: CGRect, image: UIImage) {
        self.init(frame: frame)
        
        imageView.image = image
        imageView.frame = frame
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
}

extension ImageZoomView: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
}

private extension ImageZoomView {
    func setup() {
        alwaysBounceHorizontal = false
        alwaysBounceVertical = false
        
        delegate = self
        
        maximumZoomScale = 2.0
        minimumZoomScale = 1.0
        
        showsHorizontalScrollIndicator = false
        showsVerticalScrollIndicator = false
        
        addSubview(imageView)
        imageView.frame = frame
        
        tap = UITapGestureRecognizer(target: self, action: #selector(handleDoubleTap))
        tap.numberOfTapsRequired = 2
        addGestureRecognizer(tap)
    }

    @objc
    func handleDoubleTap() {
        if zoomScale == 1 {
            zoom(to: zoomRectForScale(maximumZoomScale, center: tap.location(in: tap.view)), animated: true)
        } else {
            setZoomScale(1, animated: true)
        }
    }

    func zoomRectForScale(_ scale: CGFloat, center: CGPoint) -> CGRect {
        var zoomRect = CGRect.zero
        zoomRect.size.height = imageView.frame.size.height / scale
        zoomRect.size.width = imageView.frame.size.width / scale
        let newCenter = convert(center, from: imageView)
        zoomRect.origin.x = newCenter.x - (zoomRect.size.width / 2.0)
        zoomRect.origin.y = newCenter.y - (zoomRect.size.height / 2.0)
        return zoomRect
    }
}
