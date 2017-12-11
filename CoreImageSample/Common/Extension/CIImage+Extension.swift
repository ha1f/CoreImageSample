//
//  CIImage+Extension.swift
//  CoreImageSample
//
//  Created by ST20591 on 2017/12/11.
//  Copyright © 2017年 ha1f. All rights reserved.
//

import Foundation
import UIKit
import CoreImage

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
}
