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
    
    // MARK: Initializer
    
    init(hex: UInt32, alpha: UInt8) {
        self.red = UInt8((hex >> 16) & 0xff)
        self.green = UInt8((hex >> 8) & 0xff)
        self.blue = UInt8(hex & 0xff)
        self.alpha = alpha
    }
}
