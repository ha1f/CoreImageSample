//
//  QrCodeGenerator.swift
//  CoreImageSample
//
//  Created by はるふ on 2017/12/11.
//  Copyright © 2017年 ha1f. All rights reserved.
//

import Foundation
import CoreImage
import UIKit

/// QR Code Generator using CIFilter
/// https://developer.apple.com/library/content/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIQRCodeGenerator
struct QrCodeGenerator {
    enum InputCorrectionLevel: String {
        /// 7%
        case L = "L"
        /// 15%
        case M = "M"
        /// 25%
        case Q = "Q"
        /// 30%
        case H = "H"
    }
    
    let inputCorrectionLevel: InputCorrectionLevel = .M
    
    func generate(fromData data: Data) -> CIImage? {
        let filter = CIFilter.qRCodeGenerator(inputMessage: data as NSData, inputCorrectionLevel: inputCorrectionLevel.rawValue as NSString)
        return filter?.outputImage
    }
    
    func generate(fromData data: Data, imageWidth: CGFloat) -> CIImage? {
        guard let image = generate(fromData: data) else {
            return nil
        }
        let scale = imageWidth / image.extent.size.width
        return image.transformed(by: CGAffineTransform(scaleX: scale, y: scale))
    }
    
    func generate(fromString string: String, imageWidth: CGFloat) -> CIImage? {
        // According to the official reference above, we should use isoLatin1 encoding
        let data = string.data(using: .isoLatin1)
        return data.flatMap { self.generate(fromData: $0, imageWidth: imageWidth) }
    }
    
    func generateUiImage(fromString string: String, imageWidth: CGFloat, scale: CGFloat = UIScreen.main.scale) -> UIImage? {
        return generate(fromString: string, imageWidth: imageWidth * scale)
            .map { ciImage in UIImage(ciImage: ciImage, scale: scale, orientation: .up)
        }
    }
}
