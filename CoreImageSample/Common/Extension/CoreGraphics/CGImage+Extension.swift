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
    /// Get as CGImage from UIImage
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

    /// Get as CGImage from CIImage
    static func extractOrGenerate(from image: CIImage) -> CGImage? {
        if let cgImage = image.cgImage {
            return cgImage
        }
        let context = CIContext(options: nil)
        return context.createCGImage(image, from: image.extent)
    }
    
    /// Convert to UIImage
    func asUIImage(scale: CGFloat = UIScreen.main.scale, orientation: UIImageOrientation = .up) -> UIImage {
        return UIImage(cgImage: self, scale: scale, orientation: orientation)
    }
    
    /// Convert to grayscale
    func toGrayScale() -> CGImage? {
        let colorSpace = CGColorSpaceCreateDeviceGray()
        let bufferSize = width * height * colorSpace.numberOfComponents
        var pixelData = [UInt8](repeating: 0, count: bufferSize)
        guard let context = CGContext(data: &pixelData,
                                      width: width,
                                      height: height,
                                      bitsPerComponent: MemoryLayout<UInt8>.size * 8,
                                      bytesPerRow: MemoryLayout<UInt8>.stride * colorSpace.numberOfComponents * width,
                                      space: colorSpace,
                                      bitmapInfo: CGImageAlphaInfo.none.rawValue) else {
            return nil
        }
        context.draw(self, in: CGRect(x: 0, y: 0, width: width, height: height))
        return context.makeImage()
    }
    
    /// Convert into mask image
    func toMaskImage() -> CGImage? {
        guard let dataProvider = dataProvider else {
            return nil
        }
        return CGImage(maskWidth: width,
                       height: height,
                       bitsPerComponent: bitsPerComponent,
                       bitsPerPixel: bitsPerPixel,
                       bytesPerRow: bytesPerRow,
                       provider: dataProvider,
                       decode: nil,
                       shouldInterpolate: false)
    }
    
    /// Calculate the rect of opaque pixels
    func opaqueRect() -> CGRect? {
        let bitsPerComponent = MemoryLayout<UInt8>.size * 8
        let bytesPerComponent = MemoryLayout<UInt8>.stride

        let colorSpace = CGColorSpaceCreateDeviceGray()
        let componentsPerPixel = 1 // alpha only
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

        // initial value
        var currentMinX = width, currentMaxX = 0, currentMinY = height, currentMaxY = 0
        var isBlank = true
        var i = componentsPerPixel - 1
        let pixelDataLength = pixelData.count
        while i < pixelDataLength {
            let y: Int = i / componentsPerRow
            let x: Int = (i % componentsPerRow) / componentsPerPixel
            // Skip if we can
            if x >= currentMinX && x <= currentMaxX && y <= currentMaxY {
                i = y * componentsPerRow + (currentMaxX + 1) * componentsPerPixel + componentsPerPixel - 1
                continue
            }

            if pixelData[i] > 0 {
                // opaque
                isBlank = false
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
