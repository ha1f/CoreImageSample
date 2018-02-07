//
//  UIImage+Extension.swift
//  RotatableImageView
//
//  Created by はるふ on 2017/10/27.
//  Copyright © 2017年 ha1f. All rights reserved.
//

import UIKit

extension UIImage {
    /// orientationを反映させる行列
    var orientationTransformer: CGAffineTransform {
        var transform = CGAffineTransform(translationX: size.width / 2, y: size.height / 2)
        switch imageOrientation {
        case .up, .upMirrored:
            break
        case .down, .downMirrored:
            transform = transform.rotated(by: CGFloat.pi)
        case .left, .leftMirrored:
            transform = transform.rotated(by: -CGFloat.pi / 2)
        case .right, .rightMirrored:
            transform = transform.rotated(by: CGFloat.pi / 2)
        }
        switch imageOrientation {
        case .upMirrored, .downMirrored, .rightMirrored, .leftMirrored:
            transform = transform.scaledBy(x: -1, y: 1)
        default:
            break
        }
        return transform.translatedBy(x: -size.width / 2, y: -size.height / 2)
    }
    
    /// orientationを消すための行列
    var inverseOrientationTransformer: CGAffineTransform {
        var transform = CGAffineTransform(translationX: size.width / 2, y: size.height / 2)
        switch imageOrientation {
        case .upMirrored, .downMirrored, .rightMirrored, .leftMirrored:
            transform = transform.scaledBy(x: -1, y: 1)
        default:
            break
        }
        switch imageOrientation {
        case .up, .upMirrored:
            break
        case .down, .downMirrored:
            transform = transform.rotated(by: CGFloat.pi)
        case .left, .leftMirrored:
            transform = transform.rotated(by: CGFloat.pi / 2)
        case .right, .rightMirrored:
            transform = transform.rotated(by: -CGFloat.pi / 2)
        }
        return transform.translatedBy(x: -size.width/2, y: -size.height/2)
    }
    
    /// CGImageに対する領域をUIImageに対する領域に変換する行列
    var transformer: CGAffineTransform {
        return orientationTransformer.scaledBy(x: 1 / scale, y: 1 / scale)
    }
    
    /// UIImageに対する領域をCGImageに対する領域に変換する行列
    var inverseTransformer: CGAffineTransform {
        return CGAffineTransform(scaleX: scale, y: scale).concatenating(inverseOrientationTransformer)
    }
    
    func orientationNormalized() {
        //CGImage.extractOrGenerate(from: self).
    }
    
    func resized(to size: CGSize, scale: CGFloat = UIScreen.main.scale) -> UIImage? {
        let scaledSize = size.uniformlyScaled(by: scale)
        guard let ciImage = CIImage.extractOrGenerate(from: self)?.resized(to: scaledSize) else {
            return nil
        }
        return ciImage.asUIImage()
    }
    
    /// https://qiita.com/coffeemk2/items/5f6f5352f9b8b1b02ec9
    func asPNGRepresentation() -> Data? {
        if let data = UIImagePNGRepresentation(self) {
            return data
        }
        if let cgImage = CGImage.extractOrGenerate(from: self) {
            let uiImage = UIImage(cgImage: cgImage)
            if let data = UIImagePNGRepresentation(uiImage) {
                return data
            }
        }
        return nil
    }
    
    /// Generate an image by adding clear padding to self.
    ///
    /// - parameter width: Width of the padding *in pixels*.
    ///
    /// - returns: The generated image with padding or nil on failure.
    func padded(with width: CGFloat) -> UIImage? {
        let newSize = CGSize(width: size.width + width * 2.0, height: size.height + width * 2.0)
        
        UIGraphicsBeginImageContextWithOptions(newSize, false, scale)
        
        defer {
            UIGraphicsEndImageContext()
        }
        
        draw(in: CGRect(origin: CGPoint(x: width, y: width), size: size))
        
        return UIGraphicsGetImageFromCurrentImageContext()
    }
    
    func withSetting(orientation: UIImageOrientation) -> UIImage? {
        if let cgImage = cgImage {
            return UIImage(cgImage: cgImage, scale: scale, orientation: orientation)
        }
        if let ciImage = ciImage {
            return UIImage(ciImage: ciImage, scale: scale, orientation: orientation)
        }
        return nil
    }
    
    /// Crop image with rect. rect is relative to UIImage coordinate.
    /// faster
    ///
    /// - parameter rect: rectanble to crop image
    ///
    /// - returns: cropped image
    func cropped(to rect: CGRect) -> UIImage? {
        return CGImage.extractOrGenerate(from: self)?
            .cropping(to: rect.applying(inverseTransformer))
            .map { UIImage(cgImage: $0, scale: scale, orientation: imageOrientation) }
    }
    
    /// slower
    func croppedUsingCoreGraphics(to rect: CGRect) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(rect.size, false, scale)
        defer {
            UIGraphicsEndImageContext()
        }
        
        guard let context = UIGraphicsGetCurrentContext() else {
            return nil
        }
        context.translateBy(x: -rect.origin.x, y: -rect.origin.y)
        
        draw(at: .zero)
        
        return UIGraphicsGetImageFromCurrentImageContext()
    }
    
    /// 不透明領域を計算する
    func opaqueRect() -> CGRect? {
        return CGImage.extractOrGenerate(from: self)?.opaqueRect().map { $0.applying(transformer) }
    }
    
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
    /// treats clear color as transparent.
    /// For this reason, we should make white of UIImage transparent to use
    /// the CIImage-masking image for CALayer-masking image.
    ///
    /// - parameter inverse: Invert transparent area or not
    ///
    /// - returns: The created image. Nil on error.
    func blacked(inverse: Bool = false) -> UIImage? {
        if inverse {
            guard let mask = UIImage.emptyUsingCoreGraphics(size: size, color: .white)?.masked(with: self)?.withSettingBackground(color: .black) else {
                return nil
            }
            return UIImage.emptyUsingCoreGraphics(size: size, color: .black)?.masked(with: mask)
        } else {
            return UIImage.emptyUsingCoreGraphics(size: size, color: .black)?.masked(with: self)
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
}

extension UIImage {
    // MARK: - Image Generator
    
    /// Create UIImage filled with a color. Faster, but if you will use cgImage, you should use coregraphics version.
    ///
    /// - parameter size: Size of output image
    /// - parameter color: Color to fill
    ///
    /// - returns: The created image. Nil on error.
    static func empty(size: CGSize, color: UIColor = .clear, scale: CGFloat = UIScreen.main.scale) -> UIImage? {
        let actualScale = scale > 0 ? scale : UIScreen.main.scale
        let scaledSize = size.uniformlyScaled(by: actualScale)
        let ciImage = CIFilter.constantColorGenerator(inputColor: CIColor(color: color))?
            .outputImage?
            .cropped(to: CGRect(origin: .zero, size: scaledSize))
        return ciImage.map { UIImage(ciImage: $0, scale: actualScale, orientation: .up) }
    }
    
    /// Create UIImage filled with a color. If you modify using cgImage, you should use this version.
    ///
    /// - parameter size: Size of output image
    /// - parameter color: Color to fill
    ///
    /// - returns: The created image. Nil on error.
    static func emptyUsingCoreGraphics(size: CGSize, color: UIColor = .clear, scale: CGFloat = UIScreen.main.scale) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, true, scale)
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
    static func circle(size: CGSize, color: UIColor, backgroundColor: UIColor = .clear) -> UIImage? {
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
    
    /// Create UIImage by drawing text
    ///
    /// - parameter text: string to draw
    /// - parameter fontSize: size of text
    ///
    /// - returns: The created image. Nil on error.
    static func fromText(text: String, fontSize: CGFloat, textColor: UIColor = .white) -> UIImage? {
        let attributes = [
            NSAttributedStringKey.font: UIFont.systemFont(ofSize: fontSize),
            NSAttributedStringKey.foregroundColor: textColor,
            NSAttributedStringKey.paragraphStyle: NSMutableParagraphStyle.default
        ]
        let imageSize = (text as NSString).size(withAttributes: attributes)
        
        UIGraphicsBeginImageContextWithOptions(imageSize, false, 0.0)
        defer {
            UIGraphicsEndImageContext()
        }
        
        guard let context = UIGraphicsGetCurrentContext() else {
            return nil
        }
        
        context.setTextDrawingMode(CGTextDrawingMode.fill)
        
        let textRect = CGRect(origin: .zero, size: imageSize)
        (text as NSString).draw(in: textRect, withAttributes: attributes)
        
        return UIGraphicsGetImageFromCurrentImageContext()
    }
}
