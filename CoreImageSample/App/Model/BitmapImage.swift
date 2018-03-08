//
//  BitmapImage.swift
//  CoreImageSample
//
//  Created by ha1f on 2018/02/02.
//  Copyright © 2018年 ha1f. All rights reserved.
//

import Foundation
import CoreGraphics
import UIKit

struct BitmapImage {
    fileprivate var pixelData: [Rgba]
    let context: CGContext
    
    var width: Int {
        return context.width
    }
    var height: Int {
        return context.height
    }
    
    init?(pixelData: [Rgba], width: Int, height: Int) {
        self.pixelData = pixelData
        guard let _context = CGContext(data: &self.pixelData,
                                       width: width,
                                       height: height,
                                       bitsPerComponent: Rgba.bitsPerComponent,
                                       bytesPerRow: Rgba.bytesPerRow(withWidth: width),
                                       space: Rgba.preferredColorSpace,
                                       bitmapInfo: Rgba.preferredBitmapInfo) else {
                                        return nil
        }
        self.context = _context
    }
    
    init?(image: CGImage) {
        pixelData = [Rgba](repeating: Rgba.clear, count: image.width * image.height)
        guard let _context = CGContext(data: &pixelData,
                                       width: image.width,
                                       height: image.height,
                                       bitsPerComponent: Rgba.bitsPerComponent,
                                       bytesPerRow: Rgba.bytesPerRow(withWidth: image.width),
                                       space: Rgba.preferredColorSpace,
                                       bitmapInfo: Rgba.preferredBitmapInfo) else {
                           return nil
        }
        _context.draw(image, in: CGRect(origin: .zero, size: CGSize(width: image.width, height: image.height)))
        context = _context
    }
    
    func clone() -> BitmapImage {
        return BitmapImage(pixelData: pixelData, width: width, height: height)!
    }
    
    private func pixelIndex(forX x: Int, y: Int) -> Int? {
        guard x >= 0 && x < width && y >= 0 && y < height else {
            return nil
        }
        return y * width + x
    }
    
    func pixel(atX x: Int, y: Int) -> Rgba? {
        return pixelIndex(forX: x, y: y).map { pixelData[$0] }
    }
    
    mutating func fillPixel(x: Int, y: Int, color: Rgba) {
        guard let index = pixelIndex(forX: x, y: y) else {
            return
        }
        pixelData.pointer.advanced(by: index).initialize(to: color)
    }
    
    mutating func fillLine(leftX: Int, length: Int, y: Int, color: Rgba) {
        guard let index = pixelIndex(forX: leftX, y: y) else {
            return
        }
        let actualLength = min(length, width - leftX)
        pixelData.pointer.advanced(by: index).initialize(to: color, count: actualLength)
    }
    
    /// Generate CGImage from current context
    func makeImage() -> CGImage? {
        return context.makeImage()
    }
}

// MARK: faster scanline flood fill

struct HorizontalLineSegment {
    let minX: Int
    let maxX: Int
    let y: Int
    
    static func point(x: Int, y: Int) -> HorizontalLineSegment {
        return HorizontalLineSegment(minX: x, maxX: x, y: y)
    }
}

struct ScanLineSeed {
    let lineSegment: HorizontalLineSegment
    // parentYのlineSegmentのminX〜maxX間はスキャン済み
    let parentY: Int?
}

extension BitmapImage {
    
    // 両外が外側なのを前提に、内側判定される領域を探索する
    private func searchSeed(xRange: CountableClosedRange<Int>, y: Int, isRegardedAsInside: (Rgba) -> Bool) -> [HorizontalLineSegment] {
        var seeds: [HorizontalLineSegment] = []
        
        var isInside = false
        var currentLeft = xRange.lowerBound
        for x in xRange {
            if !isRegardedAsInside(pixel(atX: x, y: y)!) {
                if isInside {
                    seeds.append(HorizontalLineSegment(minX: currentLeft, maxX: x-1, y: y))
                    isInside = false
                }
            } else {
                if !isInside {
                    currentLeft = x
                    isInside = true
                }
            }
        }
        if isInside {
            seeds.append(HorizontalLineSegment(minX: currentLeft, maxX: xRange.upperBound, y: y))
        }
        return seeds
    }
    
    private func scanHorizontalLine(targetY: Int, seed: ScanLineSeed, leftEdgeX: Int, rightEdgeX: Int, isRegardedAsInside: (Rgba) -> Bool) -> [ScanLineSeed] {
        guard targetY >= 0 && targetY < self.height else {
            return []
        }
        if targetY == seed.parentY {
            // 親ラインかつ、x >= seed.minX  && x <= seed.maxXなら探索済（必ず内側）
            // つまり、親ラインならleftEdgeX..<seed.minX, (seed.maxX+1)..<rightEdgeXの範囲のみ探索する
            var result: [HorizontalLineSegment] = []
            if leftEdgeX < seed.lineSegment.minX {
                result.append(contentsOf: self.searchSeed(xRange: CountableClosedRange(leftEdgeX..<seed.lineSegment.minX), y: targetY, isRegardedAsInside: isRegardedAsInside))
            }
            let unknownRightLeftX = seed.lineSegment.maxX + 1
            if rightEdgeX >= (unknownRightLeftX) {
                result.append(contentsOf: self.searchSeed(xRange: unknownRightLeftX...rightEdgeX, y: targetY, isRegardedAsInside: isRegardedAsInside))
            }
            return result
                .map { ScanLineSeed(lineSegment: $0, parentY: seed.lineSegment.y) }
        } else {
            return self.searchSeed(xRange: leftEdgeX...rightEdgeX, y: targetY, isRegardedAsInside: isRegardedAsInside)
                .map { ScanLineSeed(lineSegment: $0, parentY: seed.lineSegment.y) }
        }
    }
    
    mutating func floodFill(fromX x: Int, y: Int, withColor color: Rgba) {
        guard let startPointPixel = pixel(atX: x, y: y) else {
            return
        }
        let isRegardedAsInside: (Rgba) -> Bool = { [startPointPixel = startPointPixel] pixel in
            return pixel.red == startPointPixel.red
                && pixel.green == startPointPixel.green
                && pixel.blue == startPointPixel.blue
                && pixel.alpha == startPointPixel.alpha
        }
        
        var seedStack = [ScanLineSeed(lineSegment: HorizontalLineSegment.point(x: x, y: y), parentY: nil)]
        while let seed = seedStack.popLast() {
            // seedのlineSegment間が内側なのは既知。これをleftEdgeX~leftEdgeXまで拡大する
            
            // 右
            let rightEdgeX: Int = {
                // TODO: array sliceで高速化する
                for x in (seed.lineSegment.maxX+1)..<width {
                    if !isRegardedAsInside(pixel(atX: x, y: seed.lineSegment.y)!) {
                        return x-1
                    }
                }
                return self.width - 1
            }()
            // 左
            let leftEdgeX: Int = {
                // TODO: array sliceで高速化する
                for x in (0...seed.lineSegment.minX).reversed() {
                    if !isRegardedAsInside(pixel(atX: x, y: seed.lineSegment.y)!) {
                        return x+1
                    }
                }
                return 0
            }()
            
            // (leftEdgeX...rightEdgeX, seed.y)を塗る
            fillLine(leftX: leftEdgeX, length: rightEdgeX - leftEdgeX + 1, y: seed.lineSegment.y, color: color)
            
            // 一つ上
            seedStack.append(contentsOf: scanHorizontalLine(targetY: seed.lineSegment.y - 1, seed: seed, leftEdgeX: leftEdgeX, rightEdgeX: rightEdgeX, isRegardedAsInside: isRegardedAsInside))
            
            // ひとつ下
            seedStack.append(contentsOf: scanHorizontalLine(targetY: seed.lineSegment.y + 1, seed: seed, leftEdgeX: leftEdgeX, rightEdgeX: rightEdgeX, isRegardedAsInside: isRegardedAsInside))
        }
        
    }
}
