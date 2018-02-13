//
//  BitmapImage.swift
//  CoreImageSample
//
//  Created by ST20591 on 2018/02/02.
//  Copyright © 2018年 ha1f. All rights reserved.
//

import Foundation
import CoreGraphics

struct BitmapImage {
    private var pixelData: [Rgba]
    private let context: CGContext
    
    init?(image: CGImage) {
        pixelData = [Rgba](repeating: Rgba.clear, count: image.width * image.height)
        guard let _context = CGContext(data: &pixelData,
                            width: image.width,
                            height: image.height,
                            bitsPerComponent: Rgba.bytesPerComponent * 8,
                            bytesPerRow: Rgba.bytesPerRow(withWidth: image.width),
                            space: Rgba.preferredColorSpace,
                            bitmapInfo: Rgba.preferredBitmapInfo) else {
                           return nil
        }
        _context.draw(image, in: CGRect(origin: .zero, size: CGSize(width: image.width, height: image.height)))
        context = _context
    }
}
