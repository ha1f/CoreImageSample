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
    
    var center: CGPoint {
        return CGPoint(x: self.origin.x + self.width / 2, y: self.origin.y + self.height / 2)
    }
    
    init(center: CGPoint, size: CGSize) {
        self.init(x: center.x - size.width / 2, y: center.y - size.height / 2, width: size.width, height: size.height)
    }
    
    init(minX: CGFloat, minY: CGFloat, maxX: CGFloat, maxY: CGFloat) {
        assert(maxX >= minX)
        assert(maxY >= minY)
        self.init(x: minX, y: minY, width: maxX - minX, height: maxY - minY)
    }
}
