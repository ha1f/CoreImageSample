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

class ViewController: UIViewController {
    
    let imageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
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
        
        var image = Image<RGBA<UInt8>>(uiImage: #imageLiteral(resourceName: "sample.PNG"))
        
        
        
        // 塗りつぶし
        let fillColor = RGBA<UInt8>.blue
        var seedStack = [PixelPoint(x: 350, y: 220)]
        if let startPointPixel = image.pixelAt(x: 350, y: 220) {
            while true {
                if let seed = seedStack.popLast() {
                    // TODO: 許容範囲を修正する
                    let isRegardedAsInside: (RGBA<UInt8>) -> Bool = { pixel in
                        return pixel.red == startPointPixel.red
                            && pixel.green == startPointPixel.green
                            && pixel.blue == startPointPixel.blue
                            && pixel.alpha == startPointPixel.alpha
                    }
                    
                    // 右
                    let rightEdgeX: Int = {
                        for x in (seed.x+1)..<image.width {
                            if !isRegardedAsInside(image[x, seed.y]) {
                                return x-1
                            }
                            // 塗る
                            image[x, seed.y] = fillColor
                        }
                        return image.width - 1
                    }()
                    // 左
                    let leftEdgeX: Int = {
                        for x in (0...seed.x).reversed() {
                            if !isRegardedAsInside(image[x, seed.y]) {
                                return x+1
                            }
                            // 塗る
                            image[x, seed.y] = fillColor
                        }
                        return 0
                    }()
                    
                    // 一行上
                    let upperY = seed.y - 1
                    if upperY >= 0 {
                        var isInside = false
                        for x in leftEdgeX...rightEdgeX {
                            if !isRegardedAsInside(image[x, upperY]) {
                                if isInside {
                                    seedStack.append(PixelPoint(x: x-1, y: upperY))
                                }
                                isInside = false
                            } else {
                                isInside = true
                            }
                        }
                        if isInside {
                            seedStack.append(PixelPoint(x: rightEdgeX, y: upperY))
                        }
                    }
                    
                    // 一行下
                    let lowerY = seed.y + 1
                    if lowerY < image.width {
                        var isInside = false
                        for x in leftEdgeX...rightEdgeX {
                            if !isRegardedAsInside(image[x, lowerY]) {
                                if isInside {
                                    seedStack.append(PixelPoint(x: x-1, y: lowerY))
                                }
                                isInside = false
                            } else {
                                isInside = true
                            }
                        }
                        if isInside {
                            seedStack.append(PixelPoint(x: rightEdgeX, y: lowerY))
                        }
                    }
                } else {
                    break
                }
            }
        }
        
        imageView.image = image.uiImage
        
//        imageView.image = QrCodeGenerator().generateUiImage(fromString: "https://ha1f.net", imageWidth: 256)
        
    }
}

