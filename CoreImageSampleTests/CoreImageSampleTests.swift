//
//  CoreImageSampleTests.swift
//  CoreImageSampleTests
//
//  Created by ST20591 on 2017/12/11.
//  Copyright © 2017年 ha1f. All rights reserved.
//

import XCTest
@testable import CoreImageSample

class CoreImageSampleTests: XCTestCase {
    
    let uiImage = #imageLiteral(resourceName: "Lenna.png")
    let scaledSize = #imageLiteral(resourceName: "Lenna.png").size.uniformlyScaled(by: 5)
    
    // 0.003 sec
    func testPerformanceCI() {
        self.measure {
            let ciImage = CIImage(image: #imageLiteral(resourceName: "Lenna.png"))!
            for _ in 0..<1000 {
                XCTAssertEqual(UIImage(ciImage: ciImage.transformed(by: CGAffineTransform(scaleX: 5, y: 5))).size, scaledSize)
            }
        }
    }
    
    // 0.031 sec
    func testPerformanceCI2() {
        self.measure {
            for _ in 0..<1000 {
                XCTAssertEqual(UIImage(ciImage: CIImage(image: #imageLiteral(resourceName: "Lenna.png"))!.transformed(by: CGAffineTransform(scaleX: 5, y: 5))).size, scaledSize)
            }
        }
    }
    
    // 0.013 sec
    func testPerformanceCI3() {
        self.measure {
            let ciImage = CIImage(image: #imageLiteral(resourceName: "Lenna.png"))!
            for _ in 0..<1000 {
                XCTAssertEqual(UIImage(ciImage: CIFilter.lanczosScaleTransform(inputImage: ciImage, inputScale: 5, inputAspectRatio: 1)!.outputImage!).size, scaledSize)
            }
        }
    }
    
    // 0.014 sec
    func testPerformanceCI4() {
        self.measure {
            let ciImage = CIImage(image: #imageLiteral(resourceName: "Lenna.png"))!
            for _ in 0..<1000 {
                XCTAssertEqual(UIImage(ciImage: ciImage.applyingFilter("CILanczosScaleTransform", parameters: ["inputScale": 5])).size, scaledSize)
            }
        }
    }
    
    // 5.452 sec
    func testPerformanceRenderer() {
        let imageSize = uiImage.size.uniformlyScaled(by: 5)
        let imageRect = CGRect(origin: .zero, size: imageSize)
        self.measure {
            for _ in 0..<5 {
                let image = UIGraphicsImageRenderer(size: imageSize).image { context in uiImage.draw(in: imageRect) }
                XCTAssertEqual(image.size, scaledSize)
                XCTAssertEqual(image.scale, UIScreen.main.scale)
            }
        }
    }
    
    func testPerformanceRenderer2() {
        let imageSize = uiImage.size.uniformlyScaled(by: 5)
        let imageRect = CGRect(origin: .zero, size: imageSize)
        let rendererFormat = UIGraphicsImageRendererFormat.default()
        rendererFormat.prefersExtendedRange = false
        self.measure {
            for _ in 0..<5 {
                let renderer = UIGraphicsImageRenderer(size: imageSize, format: rendererFormat)
                let image = renderer.image { context in uiImage.draw(in: imageRect) }
                XCTAssertEqual(image.size, scaledSize)
                XCTAssertEqual(image.scale, UIScreen.main.scale)
            }
        }
    }
    
    // 0.660 sec
    func testPerformanceCG() {
        let imageSize = uiImage.size.uniformlyScaled(by: 5)
        let imageRect = CGRect(origin: .zero, size: imageSize)
        self.measure {
            for _ in 0..<5 {
                UIGraphicsBeginImageContextWithOptions(imageSize, true, 0.0)
                defer {
                    UIGraphicsEndImageContext()
                }
                uiImage.draw(in: imageRect)
                let image = UIGraphicsGetImageFromCurrentImageContext()!
                XCTAssertEqual(image.size, scaledSize)
                XCTAssertEqual(image.scale, UIScreen.main.scale)
            }
        }
    }
    
    func testPerformanceEmptyCI() {
        let imageSize = CGSize(width: 256, height: 256)
        self.measure {
            for _ in 0..<100 {
                let image = UIImage.empty(size: imageSize, color: .white)!
                XCTAssertEqual(image.size, imageSize)
                XCTAssertEqual(image.scale, UIScreen.main.scale)
            }
        }
    }
    
    func testPerformanceEmptyCG() {
        let imageSize = CGSize(width: 256, height: 256)
        self.measure {
            for _ in 0..<100 {
                let image = UIImage.emptyUsingCoreGraphics(size: imageSize, color: .white)!
                XCTAssertEqual(image.size, imageSize)
                XCTAssertEqual(image.scale, UIScreen.main.scale)
            }
        }
    }
    
}
