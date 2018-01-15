//
//  CGImage+Extension.swift
//  CoreImageSample
//
//  Created by はるふ on 2017/12/11.
//  Copyright © 2017年 ha1f. All rights reserved.
//

import Foundation
import UIKit

struct BitmapImage {
    var pixelData: [Rgba]
    
    var context: CGContext
    
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
    
    func pixelData() -> [Rgba] {
        // UInt8なら1
        let bytesPerComponent = MemoryLayout<UInt8>.size
        
        let bytesPerRow = MemoryLayout<Rgba>.stride * width

        let dataSize = width * height// * bytesPerComponent * componentsPerPixel
        var pixelData = [Rgba](repeating: Rgba.clear, count: dataSize)
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let context = CGContext(data: &pixelData,
                                width: width,
                                height: height,
                                bitsPerComponent: bytesPerComponent * 8,
                                bytesPerRow: bytesPerRow,
                                space: colorSpace,
                                bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue)
        context?.draw(self, in: CGRect(x: 0, y: 0, width: width, height: height))
        return pixelData
    }
    
    func toRgba(pointer: UnsafePointer<[UInt8]>) {
        let p = UnsafePointer<UInt8>(pointer.pointee)
        
    }
    
    func pixelDataUint8() -> [UInt8] {
        // UInt8なら1
        let bytesPerComponent = 1
        
        // rgba
        let componentsPerPixel = 4
        
        let dataSize = width * height * bytesPerComponent * componentsPerPixel
        var pixelData = [UInt8](repeating: 0, count: dataSize)
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let context = CGContext(data: &pixelData,
                                width: width,
                                height: height,
                                bitsPerComponent: bytesPerComponent * 8,
                                bytesPerRow: bytesPerComponent * componentsPerPixel * width,
                                space: colorSpace,
                                bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue)
        context?.draw(self, in: CGRect(x: 0, y: 0, width: width, height: height))
        return pixelData
    }
}

