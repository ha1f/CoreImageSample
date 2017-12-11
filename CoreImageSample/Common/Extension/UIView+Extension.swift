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
    func mask(path: UIBezierPath, inverse: Bool = false) {
        let newPath = path.duplicated()
        
        if inverse {
            newPath.append(UIBezierPath(rect: self.bounds))
        }
        
        let maskLayer = CAShapeLayer()
        maskLayer.frame = self.bounds
        maskLayer.fillColor = UIColor.black.cgColor
        maskLayer.fillRule = kCAFillRuleEvenOdd
        maskLayer.path = newPath.cgPath
        self.layer.mask = maskLayer
    }
    
    /// Mask the view with the CGRect.
    ///
    /// - parameter rect: The rect to mask
    /// - parameter inverse: Reverse the mask or not
    func mask(rect: CGRect, inverse: Bool = false) {
        let path = UIBezierPath(rect: rect)
        self.mask(path: path, inverse: inverse)
    }
    
    /// Mask the view with the UIImage.
    /// Note that this mask uses alpha channel, different from CoreGraphics's masking.
    ///
    /// - parameter image: The image to mask the UIView
    func mask(image: UIImage) {
        let maskLayer = CALayer()
        maskLayer.frame = self.bounds
        maskLayer.contents = image.cgImage
        self.layer.mask = maskLayer
    }
}
