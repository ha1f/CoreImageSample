//
//  BitmapImage.swift
//  CoreImageSample
//
//  Created by ST20591 on 2018/02/02.
//  Copyright © 2018年 ha1f. All rights reserved.
//

import Foundation
import CoreGraphics
import UIKit

struct BitmapImage {
    private var pixelData: [Rgba]
    private let context: CGContext
    
    var width: Int {
        return context.width
    }
    var height: Int {
        return context.height
    }
    
    init?(image: CGImage) {
        pixelData = [Rgba](repeating: Rgba.clear, count: image.width * image.height)
        guard let _context = CGContext(data: &pixelData,
                            width: image.width,
                            height: image.height,
                            bitsPerComponent: Rgba.bitsPerComponent,
                            bytesPerRow: Rgba.bytesPerRow(withWidth: image.width),
                            space: Rgba.preferredColorSpace,
                            bitmapInfo: Rgba.preferredBitmapInfo) else {
                           return nil
        }
        _context.draw(image, in: CGRect(origin: .zero, size: CGSize(width: image.width, height: image.height)))
        context = _context
    }
    
    private func pixelIndex(forX x: Int, y: Int) -> Int {
        assert(x >= 0 && x < width && y >= 0 && y < height, "(x, y) must be within image size")
        return y * width + x
    }
    
    mutating func fillPixel(x: Int, y: Int, color: Rgba) {
        pixelData.pointer.advanced(by: pixelIndex(forX: x, y: y)).initialize(to: color)
    }
    
    func makeImage() -> CGImage? {
        return context.makeImage()
    }
}
