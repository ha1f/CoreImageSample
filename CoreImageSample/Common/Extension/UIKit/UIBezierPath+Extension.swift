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
        let newCgPath = cgPath.copy(strokingWithWidth: lineWidth, lineCap: lineCapStyle, lineJoin: lineJoinStyle, miterLimit: miterLimit, transform: .identity)
        let pathCopy = UIBezierPath(cgPath: newCgPath)
        pathCopy.lineJoinStyle = lineJoinStyle
        pathCopy.lineWidth = lineWidth
        pathCopy.lineCapStyle = lineCapStyle
        pathCopy.miterLimit = miterLimit
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
}
