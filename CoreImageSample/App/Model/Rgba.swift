//
//  Rgba.swift
//  ha1f-chat
//
//  Created by ha1f on 2017/07/19.
//  Copyright © 2017年 ha1f. All rights reserved.
//

import UIKit

struct Rgba {
    
    // MARK: Properties
    
    var red: UInt8
    var green: UInt8
    var blue: UInt8
    var alpha: UInt8
    
    // MARK: Static values
    
    static let clear = Rgba(hex: 0x000000, alpha: 0)
    static let black = Rgba(hex: 0x000000, alpha: 0xff)
    static let red = Rgba(hex: 0xff0000, alpha: 0xff)
    static let green = Rgba(hex: 0x00ff00, alpha: 0xff)
    static let blue = Rgba(hex: 0x0000ff, alpha: 0xff)
    static let cyan = Rgba(hex: 0x00ffff, alpha: 0xff)
    static let magenta = Rgba(hex: 0xff00ff, alpha: 0xff)
    static let yellow = Rgba(hex: 0xffff00, alpha: 0xff)
    
    // MARK: CGContext parameters
    
    internal static var preferredBitmapInfo: UInt32 {
        return CGImageAlphaInfo.premultipliedLast.rawValue
    }
    internal static var preferredColorSpace: CGColorSpace {
        return CGColorSpaceCreateDeviceRGB()
    }
    private static var bytesPerComponent: Int {
        return MemoryLayout<UInt8>.size
    }
    internal static var bitsPerComponent: Int {
        return bytesPerComponent * 8
    }
    private static var numberOfComponentsPerPixel: Int {
        // colorspace + alpha
        return preferredColorSpace.numberOfComponents + 1
    }
    internal static func bytesPerRow(withWidth width: Int) -> Int {
        return MemoryLayout<UInt8>.stride * numberOfComponentsPerPixel * width
    }
    
    // MARK: Initializers
    
    init(red: UInt8, green: UInt8, blue: UInt8, alpha: UInt8 = 0xff) {
        self.red = red
        self.green = green
        self.blue = blue
        self.alpha = alpha
    }
    
    init(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat = 1.0) {
        assert(red >= 0 && green >= 0 && blue >= 0, "color component must be positive value")
        self.red = UInt8(red.remainder(dividingBy: 1.0) * 255)
        self.green = UInt8(green.remainder(dividingBy: 1.0) * 255)
        self.blue = UInt8(blue.remainder(dividingBy: 1.0) * 255)
        self.alpha = UInt8(alpha.remainder(dividingBy: 1.0) * 255)
    }
    
    init(hex: UInt32, alpha: UInt8 = 0xff) {
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

extension Rgba: Equatable {
    static func ==(_ lhs: Rgba, _ rhs: Rgba) -> Bool {
        return lhs.red == rhs.red
            && lhs.green == rhs.green
            && lhs.blue == rhs.blue
            && lhs.alpha == rhs.alpha
    }
}
