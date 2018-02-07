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
    
    /// 不透明領域を計算する
    func opaqueRect() -> CGRect? {
        let bitsPerComponent = MemoryLayout<UInt8>.size * 8
        let bytesPerComponent = MemoryLayout<UInt8>.stride

        let colorSpace = CGColorSpaceCreateDeviceGray()
        let componentsPerPixel = 1
        let componentsPerRow = componentsPerPixel * width

        // draw alpha only
        var pixelData = [UInt8](repeating: 0, count: width * height * componentsPerPixel)
        guard let context = CGContext(
            data: &pixelData,
            width: width,
            height: height,
            bitsPerComponent: bitsPerComponent,
            bytesPerRow: componentsPerRow * bytesPerComponent,
            space: colorSpace,
            bitmapInfo: CGImageAlphaInfo.alphaOnly.rawValue) else {
                debugPrint("context error")
                return nil
        }
        context.draw(self, in: CGRect(x: 0, y: 0, width: width, height: height))

        var currentMinX: Int = width
        var currentMaxX: Int = 0
        var currentMinY: Int = height
        var currentMaxY: Int = 0
        var i: Int = componentsPerPixel - 1
        let pixelDataLength = pixelData.count
        var isBlank = true
        while i < pixelDataLength {
            let y: Int = i / componentsPerRow
            let x: Int = (i % componentsPerRow) / componentsPerPixel
            // 間を飛ばす
            if x >= currentMinX && x <= currentMaxX && y <= currentMaxY {
                i = y * componentsPerRow + (currentMaxX + 1) * componentsPerPixel + componentsPerPixel - 1
                continue
            }

            if pixelData[i] > 0 {
                isBlank = false
                // 不透明
                if y < currentMinY {
                    currentMinY = y
                }
                if y > currentMaxY {
                    currentMaxY = y
                }
                if x < currentMinX {
                    currentMinX = x
                }
                if x > currentMaxX {
                    currentMaxX = x
                }
            }
            i += componentsPerPixel
        }

        guard !isBlank else {
            return .zero
        }
        return CGRect(minX: currentMinX, minY: currentMinY, maxX: currentMaxX, maxY: currentMaxY)
      }
}
