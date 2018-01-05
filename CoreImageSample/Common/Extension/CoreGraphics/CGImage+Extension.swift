//
//  CGImage+Extension.swift
//  CoreImageSample
//
//  Created by はるふ on 2017/12/11.
//  Copyright © 2017年 ha1f. All rights reserved.
//

import Foundation
import UIKit

extension CGImage {
    /// Get as CGImage
    /// If the UIImage is build from CIImage, cgImage is nil.
    /// https://developer.apple.com/documentation/uikit/uiimage/1624147-cgimage
    /// If so, we must build with CIContext
    static func extractOrGenerate(from image: UIImage) -> CGImage? {
        if let cgImge = image.cgImage {
            return cgImge
        }
        if let ciImage = CIImage.extractOrGenerate(from: image) {
            return CGImage.extractOrGenerate(from: ciImage)
        }
        return nil
    }
    
    static func extractOrGenerate(from image: CIImage) -> CGImage? {
        if let cgImage = image.cgImage {
            return cgImage
        }
        let context = CIContext(options: nil)
        return context.createCGImage(image, from: image.extent)
    }
}

