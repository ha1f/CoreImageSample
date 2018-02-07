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
    
    init(image: CGImage) {
        let bytesPerComponent = MemoryLayout<UInt8>.size
        let bytesPerRow = MemoryLayout<Rgba>.stride * image.width
        let dataSize = image.width * image.height
        
        pixelData = [Rgba](repeating: Rgba.clear, count: dataSize)
        
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        
        context = CGContext(data: &pixelData,
                            width: image.width,
                            height: image.height,
                            bitsPerComponent: bytesPerComponent * 8,
                            bytesPerRow: bytesPerRow,
                            space: colorSpace,
                            bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue)!
        context.draw(image, in: CGRect(x: 0, y: 0, width: image.width, height: image.height))
    }
}
