//
//  EasyImagy+Extension.swift
//  CoreImageSample
//
//  Created by ha1f on 2017/12/21.
//  Copyright © 2017年 ha1f. All rights reserved.
//

import Foundation
import EasyImagy
import CoreGraphics

extension Image where Pixel == RGBA<UInt8> {
    func filled(rect: CGRect, with pixel: Pixel) -> Image<Pixel> {
        var pixels = [Pixel]()
        for x in 0..<width {
            for y in 0..<height {
                pixels.append(rect.contains(CGPoint(x: x, y: y)) ? pixel : self[x, y])
            }
        }
        return Image(width: width, height: height, pixels: pixels)
    }
    
    mutating func fill(rect: CGRect, with pixel: Pixel) {
        for y in Int(rect.minY)..<Int(rect.maxY) {
            for x in Int(rect.minX)..<Int(rect.maxX) {
                self[x, y] = pixel
            }
        }
    }
    
    // 両外が外側なのを前提に、内側判定される領域を探索する
    private func searchSeed(xRange: CountableClosedRange<Int>, y: Int, isRegardedAsInside: (RGBA<UInt8>) -> Bool) -> [HorizontalLineSegment] {
        var seeds: [HorizontalLineSegment] = []
        
        // パフォーマンスの観点から無視
        // guard y >= 0 && y < image.height else {
        //     return
        // }
        var isInside = false
        var currentLeft = xRange.lowerBound
        for x in xRange {
            if !isRegardedAsInside(self[x, y]) {
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
    
    private func scanHorizontalLine(targetY: Int, seed: ScanLineSeed, leftEdgeX: Int, rightEdgeX: Int, isRegardedAsInside: (RGBA<UInt8>) -> Bool) -> [ScanLineSeed] {
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
    
    func filled(fromX x: Int, y: Int, color: RGBA<UInt8>) -> Image? {
        var newImage = Image(width: width, height: height, pixels: pixels)
        
        guard let startPointPixel = self.pixelAt(x: x, y: y) else {
            return nil
        }
        
        // TODO: 許容範囲を修正する
        let isRegardedAsInside: (RGBA<UInt8>) -> Bool = { pixel in
            return pixel.red == startPointPixel.red
                && pixel.green == startPointPixel.green
                && pixel.blue == startPointPixel.blue
                && pixel.alpha == startPointPixel.alpha
        }
        
        // 塗りつぶし色がinside判定されると無限ループになるので
        if isRegardedAsInside(color) {
            return nil
        }
        
        var seedStack = [ScanLineSeed(lineSegment: HorizontalLineSegment.point(x: x, y: y), parentY: nil)]
        while let seed = seedStack.popLast() {
            // seedのlineSegment間が内側なのは既知。これをleftEdgeX~leftEdgeXまで拡大する
            
            // 右
            let rightEdgeX: Int = {
                for x in (seed.lineSegment.maxX+1)..<width {
                    if !isRegardedAsInside(newImage[x, seed.lineSegment.y]) {
                        return x-1
                    }
                    // 塗ってもいい
                }
                return self.width - 1
            }()
            // 左
            let leftEdgeX: Int = {
                for x in (0...seed.lineSegment.minX).reversed() {
                    if !isRegardedAsInside(newImage[x, seed.lineSegment.y]) {
                        return x+1
                    }
                    // 塗ってもいいが、上で塗らないように注意（1ドットだと普通に塗ってしまう）
                }
                return 0
            }()
            
            // TODO: ここで(leftEdgeX...rightEdgeX, seed.y)をまとめて塗って処理を高速化したい
            for x in leftEdgeX...rightEdgeX {
                newImage[x, seed.lineSegment.y] = color
            }
            
            // 一つ上
            seedStack.append(contentsOf: newImage.scanHorizontalLine(targetY: seed.lineSegment.y - 1, seed: seed, leftEdgeX: leftEdgeX, rightEdgeX: rightEdgeX, isRegardedAsInside: isRegardedAsInside))
            
            // ひとつ下
            seedStack.append(contentsOf: newImage.scanHorizontalLine(targetY: seed.lineSegment.y + 1, seed: seed, leftEdgeX: leftEdgeX, rightEdgeX: rightEdgeX, isRegardedAsInside: isRegardedAsInside))
        }
        
        return newImage
    }
}
