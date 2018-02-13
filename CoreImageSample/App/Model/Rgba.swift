//
//  Rgba.swift
//  ha1f-chat
//
//  Created by ST20591 on 2017/07/19.
//  Copyright © 2017年 ha1f. All rights reserved.
//

import UIKit

struct Rgba {
    
    // MARK: Properties
    
    let red: UInt8
    let green: UInt8
    let blue: UInt8
    let alpha: UInt8
    
    static let clear = Rgba(hex: 0x000000, alpha: 0)
    
    internal static var preferredBitmapInfo: UInt32 {
        return CGImageAlphaInfo.premultipliedLast.rawValue
    }
    internal static var preferredColorSpace: CGColorSpace {
        return CGColorSpaceCreateDeviceRGB()
    }
    internal static var bytesPerComponent: Int {
        return MemoryLayout<UInt8>.size
    }
    internal static func bytesPerRow(withWidth width: Int) -> Int {
        return MemoryLayout<UInt8>.stride * width
    }
    
    // MARK: Initializer
    
    init(hex: UInt32, alpha: UInt8) {
        self.red = UInt8((hex >> 16) & 0xff)
        self.green = UInt8((hex >> 8) & 0xff)
        self.blue = UInt8(hex & 0xff)
        self.alpha = alpha
    }
    
    init(uiColor: UIColor) {
        var r: CGFloat = 0, g: CGFloat = 0, b: CGFloat = 0, a: CGFloat = 0
        uiColor.getRed(&r, green: &g, blue: &b, alpha: &a)
        self.red = UInt8(0xff * r)
        self.green = UInt8(0xff * g)
        self.blue = UInt8(0xff * b)
        self.alpha = UInt8(0xff * a)
    }
}
