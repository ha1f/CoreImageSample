//
//  UIView+Extension.swift
//  CropViewController
//
//  Created by ST20591 on 2017/10/27.
//  Copyright © 2017年 ha1f. All rights reserved.
//

import UIKit

extension UIView {
    /// Mask the view with UIBezierPath.
    ///
    /// - parameter path: The path to specify the mask
    /// - parameter fillRule: The rule to fill with the path
    func mask(with path: UIBezierPath, inverse: Bool = false) {
        let newPath = path.clone()
        
        if inverse {
            newPath.append(UIBezierPath(rect: bounds))
        }
        
        let maskLayer = CAShapeLayer()
        maskLayer.frame = bounds
        maskLayer.fillColor = UIColor.black.cgColor
        maskLayer.fillRule = kCAFillRuleEvenOdd
        maskLayer.path = newPath.cgPath
        layer.mask = maskLayer
    }
    
    /// Mask the view with the CGRect.
    ///
    /// - parameter rect: The rect to mask
    /// - parameter inverse: Reverse the mask or not
    func mask(rect: CGRect, inverse: Bool = false) {
        let path = UIBezierPath(rect: rect)
        self.mask(with: path, inverse: inverse)
    }
    
    /// Mask the view with the UIImage.
    /// Note that this mask uses alpha channel, different from CoreGraphics's masking.
    ///
    /// - parameter image: The image to mask the UIView
    func mask(image: UIImage) {
        let maskLayer = CALayer()
        maskLayer.frame = bounds
        maskLayer.contents = image.cgImage
        layer.mask = maskLayer
    }
}

// AutoLayoutHelper
extension UIView {
    func constraintTo(centerOf view: UIView, width: CGFloat, height: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            centerYAnchor.constraint(equalTo: view.centerYAnchor),
            centerXAnchor.constraint(equalTo: view.centerXAnchor),
            widthAnchor.constraint(equalToConstant: width),
            heightAnchor.constraint(equalToConstant: height)
            ])
    }
    
    func constraintTo(frameOf view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: view.topAnchor),
            leadingAnchor.constraint(equalTo: view.leadingAnchor),
            trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
    }
    
    @available(iOS 11.0, *)
    func constraintTo(safeAreaOf view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            ])
    }
}
