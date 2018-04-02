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
    
    /// Resize image to given size
    ///
    /// - parameter size: size to fit
    ///
    /// - returns: Generated CIImage. Nil on error.
    func resized(to size: CGSize) -> CIImage? {
        guard extent.width > 0 && extent.height > 0 else {
            debugPrint("extent.width or extent.height is 0 so you cannot resize this CIImage to the size: \(size)")
            return nil
        }
        let xScale = size.width / extent.width
        let yScale = size.height / extent.height
        return transformed(by: CGAffineTransform(scaleX: xScale, y: yScale))
    }
    
    /// Resize image to given size with `aspect fit` manner
    /// Note: trailing / bottom edge is not correct (Size of extent will not match)
    ///
    /// - parameter size: size to fit
    ///
    /// - returns: Generated CIImage. Nil on error.
    func aspectFit(to size: CGSize) -> CIImage? {
        guard extent.width > 0 && extent.height > 0 else {
            debugPrint("extent.width or extent.height is 0 so you cannot resize this CIImage to the size: \(size)")
            return nil
        }
        let scale = min(size.width / extent.width, size.height / extent.height)
        let xTranslation = (size.width - extent.width * scale) / 2
        let yTranslation = (size.height - extent.height * scale) / 2
        let transform = CGAffineTransform(translationX: xTranslation, y: yTranslation)
            .scaledBy(x: scale, y: scale)
        return transformed(by: transform)
    }
    
    func applying(_ filter: CIFilter) -> CIImage? {
        guard filter.inputKeys.contains(kCIInputImageKey) else {
            return nil
        }
        filter.setValue(self, forKey: kCIInputImageKey)
        return filter.outputImage
    }
    
    /// Convert to UIImage
    func asUIImage(useCgImage: Bool = false, scale: CGFloat = UIScreen.main.scale, orientation: UIImageOrientation = .up) -> UIImage {
        if useCgImage, let cgImage = CGImage.extractOrGenerate(from: self) {
            return UIImage(cgImage: cgImage, scale: scale, orientation: orientation)
        } else {
            return UIImage(ciImage: self, scale: scale, orientation: orientation)
        }
    }
}
