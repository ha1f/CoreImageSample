//
//  CGImageExtensionTests.swift
//  CoreImageSampleTests
//
//  Created by ST20591 on 2018/05/18.
//  Copyright © 2018年 ha1f. All rights reserved.
//

import XCTest
import UIKit
@testable import CoreImageSample

class CGImageExtensionTests: XCTestCase {
    let sampleUiImage = UIImage.emptyUsingCoreGraphics(size: CGSize(width: 100, height: 150), color: .black, scale: 1.0)!
    
    // MARK: - opaqueRect()
    
    func testOpaqueRectBlankImage() {
        let blankImage = UIImage.emptyUsingCoreGraphics(size: CGSize(width: 100, height: 150), color: .clear, scale: 1.0)!.cgImage!
        XCTAssertEqual(blankImage.width, 100)
        XCTAssertEqual(blankImage.height, 150)
        XCTAssertEqual(blankImage.opaqueRect(), CGRect.zero)
    }
    
    func testOpaqueRectPaddingImage() {
        let padding: CGFloat = 50
        let paddedImage = sampleUiImage.padded(with: padding)!.cgImage!
        XCTAssertEqual(paddedImage.width, Int(100 + padding * 2))
        XCTAssertEqual(paddedImage.height, Int(150 + padding * 2))
        XCTAssertEqual(paddedImage.opaqueRect(), CGRect(x: padding, y: padding, width: 100, height: 150))
    }
    
    func testOpaqueRectNoPaddingImage() {
        let sampleImage = sampleUiImage.cgImage!
        XCTAssertEqual(sampleImage.width, 100)
        XCTAssertEqual(sampleImage.height, 150)
        XCTAssertEqual(sampleImage.opaqueRect(), CGRect(origin: .zero, size: CGSize(width: 100, height: 150)))
    }
    
    // MARK: - countOpaquePixels
    
    func testCountOpaquePixelsBlankImage() {
        let blankImage = UIImage.emptyUsingCoreGraphics(size: CGSize(width: 100, height: 150), color: .clear, scale: 1.0)!.cgImage!
        XCTAssertEqual(blankImage.countOpaquePixels(), 0)
    }
    
    func testCountOpaquePixelsPaddingImage() {
        let padding: CGFloat = 50
        let paddedImage = sampleUiImage.padded(with: padding)!.cgImage!
        XCTAssertEqual(paddedImage.width, Int(100 + padding * 2))
        XCTAssertEqual(paddedImage.height, Int(150 + padding * 2))
        XCTAssertEqual(paddedImage.countOpaquePixels(), 100 * 150)
    }
    
    func testCountOpaquePixelsNoPaddingImage() {
        let sampleImage = sampleUiImage.cgImage!
        XCTAssertEqual(sampleImage.width, 100)
        XCTAssertEqual(sampleImage.height, 150)
        XCTAssertEqual(sampleImage.countOpaquePixels(), 100 * 150)
    }
    
}
