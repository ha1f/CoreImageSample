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

class ViewController: UIViewController {
    
    let imageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    func fill(from startPoint: PixelPoint, color: RGBA<UInt8>) {
        var image = Image<RGBA<UInt8>>(uiImage: #imageLiteral(resourceName: "sample.PNG"))
        
        var seedStack = [HorizontalLineSegment.point(x: startPoint.x, y: startPoint.y)]
        
        guard let startPointPixel = image.pixelAt(x: startPoint.x, y: startPoint.y) else {
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
                for x in (seed.maxX+1)..<image.width {
                    if !isRegardedAsInside(image[x, seed.y]) {
                        return x-1
                    }
                    // 塗る
                    image[x, seed.y] = color
                }
                return image.width - 1
            }()
            // 左
            let leftEdgeX: Int = {
                for x in (0...seed.minX).reversed() {
                    if !isRegardedAsInside(image[x, seed.y]) {
                        return x+1
                    }
                    // 塗る
                    image[x, seed.y] = color
                }
                return 0
            }()
            
            // TODO: ここまでで(leftEdgeX...rightEdgeX, seed.y)をまとめて塗って処理を高速化したい
            
            let searchSeed: (Int) -> () = { y in
                // guard y >= 0 && y < image.width else {
                //     return
                // }
                var isInside = false
                var currentLeft = 0
                for x in leftEdgeX...rightEdgeX {
                    if !isRegardedAsInside(image[x, y]) {
                        if isInside {
                            seedStack.append(HorizontalLineSegment(minX: currentLeft, maxX: x-1, y: y))
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
                    seedStack.append(HorizontalLineSegment(minX: currentLeft, maxX: rightEdgeX, y: y))
                }
            }
            
            // 一行上
            let upperY = seed.y - 1
            if upperY >= 0 {
                searchSeed(upperY)
            }
            
            // 一行下
            let lowerY = seed.y + 1
            if lowerY < image.width {
                searchSeed(lowerY)
            }
        }
        
        imageView.image = image.uiImage
    }
    
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
        
        fill(from: PixelPoint(x: 350, y: 220), color: .green)
        
//        imageView.image = QrCodeGenerator().generateUiImage(fromString: "https://ha1f.net", imageWidth: 256)
        
    }
}

