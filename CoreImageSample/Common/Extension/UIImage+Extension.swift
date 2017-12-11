//
//  UIImage+Extension.swift
//  RotatableImageView
//
//  Created by はるふ on 2017/10/27.
//  Copyright © 2017年 ha1f. All rights reserved.
//

import UIKit

extension UIImage {
    /// Create UIImage by drawing current image on colored context.
    ///
    /// - parameter color: Color of the background context
    ///
    /// - returns: The created image. Nil on error.
    func withSettingBackground(color: UIColor) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, true, 0.0)
        defer {
            UIGraphicsEndImageContext()
        }
        guard let context = UIGraphicsGetCurrentContext() else {
            return nil
        }
        guard let cgImage = CGImage.extractOrGenerate(from: self) else {
            return nil
        }
        let frame = CGRect(origin: .zero, size: size)
        context.clear(frame)
        context.setFillColor(color.cgColor)
        context.fill(frame)
        context.draw(cgImage, in: frame)
        return UIGraphicsGetImageFromCurrentImageContext()
    }
    
    /// Create UIImage of black or transparent.
    /// CIImage-masking treats white as transparent, while CALayer-masking
    /// treats transparent as transparent.
    /// For this reason, we should make white of UIImage transparent to use
    /// the CIImage-masking image for CALayer-masking image.
    ///
    /// - parameter inverse: Invert transparent area or not
    ///
    /// - returns: The created image. Nil on error.
    func blacked(inverse: Bool = false) -> UIImage? {
        if inverse {
            guard let mask = UIImage.empty(size: size, color: .white)?.masked(with: self)?.withSettingBackground(color: .black) else {
                return nil
            }
            return UIImage.empty(size: size, color: .black)?.masked(with: mask)
        } else {
            return UIImage.empty(size: size, color: .black)?.masked(with: self)
        }
    }
    
    /// Create UIImage by masking current image with another image.
    /// Treat white as transparent.
    ///
    /// - parameter image: Image for masking
    ///
    /// - returns: The created image. Nil on error.
    func masked(with image: UIImage) -> UIImage? {
        guard let maskRef = CGImage.extractOrGenerate(from: image),
            let ref = CGImage.extractOrGenerate(from: self),
            let dataProvider = maskRef.dataProvider else {
                return nil
        }
        
        let mask = CGImage(maskWidth: maskRef.width,
                           height: maskRef.height,
                           bitsPerComponent: maskRef.bitsPerComponent,
                           bitsPerPixel: maskRef.bitsPerPixel,
                           bytesPerRow: maskRef.bytesPerRow,
                           provider: dataProvider,
                           decode: nil,
                           shouldInterpolate: false)
        return mask
            .flatMap { ref.masking($0) }
            .map { UIImage(cgImage: $0) }
    }
    
    /// Create UIImage filled with a color.
    ///
    /// - parameter size: Size of output image
    /// - parameter color: Color to fill
    ///
    /// - returns: The created image. Nil on error.
    static func empty(size: CGSize, color: UIColor = .clear) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, true, 0.0)
        defer {
            UIGraphicsEndImageContext()
        }
        guard let context = UIGraphicsGetCurrentContext() else {
            return nil
        }
        let frame = CGRect(origin: .zero, size: size)
        context.clear(frame)
        context.setFillColor(color.cgColor)
        context.fill(frame)
        return UIGraphicsGetImageFromCurrentImageContext()
    }
    
    /// Create UIImage of circle.
    ///
    /// - parameter size: Size of output image
    /// - parameter color: Color of the circle
    /// - parameter backgroundColor: Background color of the image
    ///
    /// - returns: The created image. Nil on error.
    static func circle2(size: CGSize, color: UIColor, backgroundColor: UIColor = .clear) -> UIImage? {
        let frame = CGRect(origin: .zero, size: size)
        return UIGraphicsImageRenderer(size: size).image { context in
            let cgContext = context.cgContext
            backgroundColor.setFill()
            context.fill(frame)
            color.setFill()
            cgContext.setLineWidth(0)
            cgContext.addEllipse(in: frame)
            cgContext.fillPath()
        }
    }
}
