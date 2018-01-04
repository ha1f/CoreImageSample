//
//  CGRect+Extension.swift
//  CoreImageSample
//
//  Created by はるふ on 2018/01/05.
//  Copyright © 2018年 ha1f. All rights reserved.
//

import Foundation
import CoreGraphics

extension CGRect {
    static func containing(_ rects: [CGRect]) -> CGRect {
        if rects.isEmpty {
            assertionFailure("rects must not be empty")
        }
        var minX: CGFloat = CGFloat.infinity
        var minY: CGFloat = CGFloat.infinity
        var maxX: CGFloat = -CGFloat.infinity
        var maxY: CGFloat = -CGFloat.infinity
        rects.forEach { rect in
            if rect.minX < minX {
                minX = rect.minX
            }
            if rect.minY < minY {
                minY = rect.minY
            }
            if rect.maxX > maxX {
                maxX = rect.maxX
            }
            if rect.maxY > maxY {
                maxY = rect.maxY
            }
        }
        return CGRect(minX: minX, minY: minY, maxX: maxX, maxY: maxY)
    }
    
    init(minX: CGFloat, minY: CGFloat, maxX: CGFloat, maxY: CGFloat) {
        if maxX < minX || maxY < minY {
            assertionFailure("maxX >= minX and maxY >= minY is necessary")
        }
        self.init(x: minX, y: minY, width: maxX - minX, height: maxY - minY)
    }
}
