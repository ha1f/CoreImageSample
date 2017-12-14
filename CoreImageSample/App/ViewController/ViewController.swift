//
//  ViewController.swift
//  CoreImageSample
//
//  Created by はるふ on 2017/12/11.
//  Copyright © 2017年 ha1f. All rights reserved.
//

import UIKit
import EasyImagy

struct PixelPoint {
    let x: Int
    let y: Int
}

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
    let parentY: Int?
}

extension Image where Pixel == RGBA<UInt8> {
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
                }
                isInside = false
            } else {
                if !isInside {
                    currentLeft = x
                }
                isInside = true
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
            // 親ラインかつ、x >= seed.minX  && x <= seed.maxXのとき、スルーする
            // つまり、親ラインならleftEdgeX..<seed.minX, (seed.maxX+1)..<rightEdgeXの範囲のみ探索する
            var result: [HorizontalLineSegment] = []
            if leftEdgeX < seed.lineSegment.minX {
                result.append(contentsOf: self.searchSeed(xRange: CountableClosedRange(leftEdgeX..<seed.lineSegment.minX), y: targetY, isRegardedAsInside: isRegardedAsInside))
            }
            if rightEdgeX >= (seed.lineSegment.maxX+1) {
                result.append(contentsOf: self.searchSeed(xRange: (seed.lineSegment.maxX+1)...rightEdgeX, y: targetY, isRegardedAsInside: isRegardedAsInside))
            }
            return result
                .map { ScanLineSeed(lineSegment: $0, parentY: seed.lineSegment.y) }
        } else {
            return self.searchSeed(xRange: leftEdgeX...rightEdgeX, y: targetY, isRegardedAsInside: isRegardedAsInside)
                .map { ScanLineSeed(lineSegment: $0, parentY: seed.lineSegment.y) }
        }
    }
    
    mutating func fill(from startPoint: PixelPoint, color: RGBA<UInt8>) {
        var seedStack = [ScanLineSeed(lineSegment: HorizontalLineSegment.point(x: startPoint.x, y: startPoint.y), parentY: nil)]
        
        guard let startPointPixel = self.pixelAt(x: startPoint.x, y: startPoint.y) else {
            return
        }
        
        while let seed = seedStack.popLast() {
            // TODO: 許容範囲を修正する
            let isRegardedAsInside: (RGBA<UInt8>) -> Bool = { pixel in
                return pixel.red == startPointPixel.red
                    && pixel.green == startPointPixel.green
                    && pixel.blue == startPointPixel.blue
                    && pixel.alpha == startPointPixel.alpha
            }
            
            // 塗りつぶし色がinside判定されると無限ループになるので
            if isRegardedAsInside(color) {
                break
            }
            
            // 右
            let rightEdgeX: Int = {
                for x in (seed.lineSegment.maxX+1)..<self.width {
                    if !isRegardedAsInside(self[x, seed.lineSegment.y]) {
                        return x-1
                    }
                    // 塗ってもいい
                }
                return self.width - 1
            }()
            // 左
            let leftEdgeX: Int = {
                for x in (0...seed.lineSegment.minX).reversed() {
                    if !isRegardedAsInside(self[x, seed.lineSegment.y]) {
                        return x+1
                    }
                    // 塗ってもいいが、上で塗らないように注意
                }
                return 0
            }()
            
            // TODO: ここで(leftEdgeX...rightEdgeX, seed.y)をまとめて塗って処理を高速化したい
            for x in leftEdgeX...rightEdgeX {
                self[x, seed.lineSegment.y] = color
            }
            
            // 一つ上
            seedStack.append(contentsOf: self.scanHorizontalLine(targetY: seed.lineSegment.y - 1, seed: seed, leftEdgeX: leftEdgeX, rightEdgeX: rightEdgeX, isRegardedAsInside: isRegardedAsInside))
            
            // ひとつ下
            seedStack.append(contentsOf: self.scanHorizontalLine(targetY: seed.lineSegment.y + 1, seed: seed, leftEdgeX: leftEdgeX, rightEdgeX: rightEdgeX, isRegardedAsInside: isRegardedAsInside))
        }
    }
}

class ViewController: UIViewController {
    
    let imageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    var image = Image<RGBA<UInt8>>(uiImage: #imageLiteral(resourceName: "sample.PNG"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 256),
            imageView.heightAnchor.constraint(equalToConstant: 256)
            ])
        
        imageView.image = image.uiImage
        
        self.fillImage(point: PixelPoint(x: 350, y: 220), color: .green) {
            self.fillImage(point: PixelPoint(x: 750, y: 320), color: .red) {
                self.fillImage(point: PixelPoint(x: 230, y: 720), color: .blue) {
                    self.fillImage(point: PixelPoint(x: 10, y: 10), color: .black) {
                        print("complete")
                    }
                }
            }
        }
    }
    
    private func fillImage(point: PixelPoint, color: RGBA<UInt8>, completion: (() -> Void)? = nil) {
        DispatchQueue.global(qos: .default).async { [weak self] in
            self?.image.fill(from: point, color: color)
            DispatchQueue.main.async {
                self?.imageView.image = self?.image.uiImage
                completion?()
            }
        }
    }
}
