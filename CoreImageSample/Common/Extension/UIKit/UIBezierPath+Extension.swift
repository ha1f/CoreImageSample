//
//  UIBezierPath+Extension.swift
//  CropViewController
//
//  Created by ST20591 on 2017/10/31.
//  Copyright © 2017年 ha1f. All rights reserved.
//

import UIKit

extension UIBezierPath {
    func clone() -> UIBezierPath {
        let newCgPath = cgPath.copy() ?? cgPath.copy(strokingWithWidth: lineWidth, lineCap: lineCapStyle, lineJoin: lineJoinStyle, miterLimit: miterLimit, transform: .identity)
        let pathCopy = UIBezierPath(cgPath: newCgPath)
        pathCopy.lineJoinStyle = lineJoinStyle
        pathCopy.lineWidth = lineWidth
        pathCopy.lineCapStyle = lineCapStyle
        pathCopy.miterLimit = miterLimit
        pathCopy.usesEvenOddFillRule = usesEvenOddFillRule
        pathCopy.flatness = flatness
        return pathCopy
    }
    
    func transformed(with transform: CGAffineTransform) -> UIBezierPath {
        let pathCopy = clone()
        pathCopy.apply(transform)
        return pathCopy
    }
    
    func scaled(by scale: CGFloat) -> UIBezierPath {
        return transformed(with: CGAffineTransform(scaleX: scale, y: scale))
    }
    
    func offset(byDx dx: CGFloat, dy: CGFloat) -> UIBezierPath {
        return transformed(with: CGAffineTransform(translationX: dx, y: dy))
    }
    
    static func difference(_ lhs: UIBezierPath, _ rhs: UIBezierPath) -> Int? {
        let connectedPath = lhs.clone()
        connectedPath.append(rhs.reversing())
        connectedPath.close()
        connectedPath.usesEvenOddFillRule = true
        
        let bounds = connectedPath.bounds
        let offset = bounds.origin
        
        // Ideally, bounds.size but it can takes long time and have problem with normalization
        let canvasSize = CGSize(width: 100, height: 100)
        let drawScale = bounds.size.aspectFitScale(to: canvasSize)
        
        UIGraphicsBeginImageContextWithOptions(canvasSize, false, 1.0)
        defer {
            UIGraphicsEndImageContext()
        }
        guard let context = UIGraphicsGetCurrentContext() else {
            return nil
        }
        context.clear(CGRect.init(origin: .zero, size: canvasSize))
        context.scaleBy(x: drawScale, y: drawScale)
        context.translateBy(x: -offset.x, y: -offset.y)
        
        UIColor.black.setFill()
        connectedPath.fill()
        
        return UIGraphicsGetImageFromCurrentImageContext()?.cgImage?.countOpaquePixels()
    }
}
