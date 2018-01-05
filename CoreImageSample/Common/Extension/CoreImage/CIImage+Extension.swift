//
//  CIImage+Extension.swift
//  CoreImageSample
//
//  Created by ST20591 on 2017/12/11.
//  Copyright © 2017年 ha1f. All rights reserved.
//

import UIKit

extension CIImage {
    /// Extract or generate CIImage
    /// If the UIImage is build from CGImage, ciImage is nil.
    /// https://developer.apple.com/documentation/uikit/uiimage/1624129-ciimage
    /// If so, we must build by CIImage(image:_).
    ///
    /// - parameter image: UIImage from which you want to get CIImage
    ///
    /// - returns: Generated CIImage
    static func extractOrGenerate(from image: UIImage) -> CIImage? {
        return image.ciImage ?? CIImage(image: image)
    }
    
//    static func extractOrGenerate(from image: CGImage) -> CIImage? {
//        return image.
//    }
    
    func resized(to size: CGSize) -> CIImage? {
        let xScale = size.width / extent.width
        let yScale = size.height / extent.height
        return transformed(by: CGAffineTransform(scaleX: xScale, y: yScale))
    }
    
    func asUIImage(scale: CGFloat = UIScreen.main.scale, orientation: UIImageOrientation = .up) -> UIImage {
        return UIImage(ciImage: self, scale: scale, orientation: orientation)
    }
}
