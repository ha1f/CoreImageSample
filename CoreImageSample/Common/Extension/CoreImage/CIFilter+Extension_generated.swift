//
//  CIFilter+Extension_generated.swift
//  CoreImageSample
//
//  Created by はるふ on 2017/12/11.
//  Copyright © 2017年 ha1f. All rights reserved.
//

import Foundation
import CoreImage
import AVFoundation

extension CIFilter {
    
    /// CIAccordionFoldTransition
    /// - SeeAlso: [Reference/CIAccordionFoldTransition](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIAccordionFoldTransition)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputTargetImage: The target image for a transition.
    /// - parameter inputBottomHeight:  defaultValue = 0.
    /// - parameter inputNumberOfFolds:  defaultValue = 3.
    /// - parameter inputFoldShadowAmount:  defaultValue = 0.1.
    /// - parameter inputTime: The duration of the effect. defaultValue = 0.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 8, *)
    static func accordionFoldTransition(inputImage: CIImage, inputTargetImage: CIImage, inputBottomHeight: NSNumber = 0, inputNumberOfFolds: NSNumber = 3, inputFoldShadowAmount: NSNumber = 0.1, inputTime: NSNumber = 0) -> CIFilter? {
        guard let filter = CIFilter(name: "CIAccordionFoldTransition") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputTargetImage, forKey: "inputTargetImage")
        filter.setValue(inputBottomHeight, forKey: "inputBottomHeight")
        filter.setValue(inputNumberOfFolds, forKey: "inputNumberOfFolds")
        filter.setValue(inputFoldShadowAmount, forKey: "inputFoldShadowAmount")
        filter.setValue(inputTime, forKey: "inputTime")
        return filter
    }
    
    /// CIAdditionCompositing
    /// - SeeAlso: [Reference/CIAdditionCompositing](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIAdditionCompositing)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputBackgroundImage: The image to use as a background image.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 5, *)
    static func additionCompositing(inputImage: CIImage, inputBackgroundImage: CIImage) -> CIFilter? {
        guard let filter = CIFilter(name: "CIAdditionCompositing") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputBackgroundImage, forKey: "inputBackgroundImage")
        return filter
    }
    
    /// CIAffineClamp
    /// - SeeAlso: [Reference/CIAffineClamp](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIAffineClamp)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputTransform: The transform to apply to the image. defaultValue = CGAffineTransform: {{1, 0, 0, 1}, {0, 0}}.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 6, *)
    static func affineClamp(inputImage: CIImage, inputTransform: NSValue) -> CIFilter? {
        guard let filter = CIFilter(name: "CIAffineClamp") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputTransform, forKey: "inputTransform")
        return filter
    }
    
    /// CIAffineTile
    /// - SeeAlso: [Reference/CIAffineTile](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIAffineTile)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputTransform: The transform to apply to the image. defaultValue = CGAffineTransform: {{1, 0, 0, 1}, {0, 0}}.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 6, *)
    static func affineTile(inputImage: CIImage, inputTransform: NSValue) -> CIFilter? {
        guard let filter = CIFilter(name: "CIAffineTile") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputTransform, forKey: "inputTransform")
        return filter
    }
    
    /// CIAffineTransform
    /// - SeeAlso: [Reference/CIAffineTransform](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIAffineTransform)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputTransform: A transform to apply to the image. defaultValue = CGAffineTransform: {{1, 0, 0, 1}, {0, 0}}.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 5, *)
    static func affineTransform(inputImage: CIImage, inputTransform: NSValue) -> CIFilter? {
        guard let filter = CIFilter(name: "CIAffineTransform") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputTransform, forKey: "inputTransform")
        return filter
    }
    
    /// CIAreaAverage
    /// - SeeAlso: [Reference/CIAreaAverage](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIAreaAverage)
    ///
    /// - parameter inputImage: The image to process.
    /// - parameter inputExtent: A rectangle that specifies the subregion of the image that you want to process. defaultValue = [0 0 640 80].
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 9, *)
    static func areaAverage(inputImage: CIImage, inputExtent: CIVector) -> CIFilter? {
        guard let filter = CIFilter(name: "CIAreaAverage") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputExtent, forKey: "inputExtent")
        return filter
    }
    
    /// CIAreaHistogram
    /// - SeeAlso: [Reference/CIAreaHistogram](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIAreaHistogram)
    ///
    /// - parameter inputImage: The image whose histogram you want to calculate.
    /// - parameter inputExtent: A rectangle that, after intersection with the image extent, specifies the subregion of the image that you want to process. defaultValue = [0 0 640 80].
    /// - parameter inputScale: The scale value to use for the histogram values. If the scale is 1.0, then the bins in the resulting image will add up to 1.0. defaultValue = 1.
    /// - parameter inputCount: The number of bins for the histogram. This value will determine the width of the output image. defaultValue = 64.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage", "outputData"])
    @available(iOS 8, *)
    static func areaHistogram(inputImage: CIImage, inputExtent: CIVector, inputScale: NSNumber = 1, inputCount: NSNumber = 64) -> CIFilter? {
        guard let filter = CIFilter(name: "CIAreaHistogram") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputExtent, forKey: "inputExtent")
        filter.setValue(inputScale, forKey: "inputScale")
        filter.setValue(inputCount, forKey: "inputCount")
        return filter
    }
    
    /// CIAreaMaximum
    /// - SeeAlso: [Reference/CIAreaMaximum](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIAreaMaximum)
    ///
    /// - parameter inputImage: The image to process.
    /// - parameter inputExtent: A rectangle that specifies the subregion of the image that you want to process. defaultValue = [0 0 640 80].
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 9, *)
    static func areaMaximum(inputImage: CIImage, inputExtent: CIVector) -> CIFilter? {
        guard let filter = CIFilter(name: "CIAreaMaximum") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputExtent, forKey: "inputExtent")
        return filter
    }
    
    /// CIAreaMaximumAlpha
    /// - SeeAlso: [Reference/CIAreaMaximumAlpha](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIAreaMaximumAlpha)
    ///
    /// - parameter inputImage: The image to process.
    /// - parameter inputExtent: A rectangle that specifies the subregion of the image that you want to process. defaultValue = [0 0 640 80].
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 9, *)
    static func areaMaximumAlpha(inputImage: CIImage, inputExtent: CIVector) -> CIFilter? {
        guard let filter = CIFilter(name: "CIAreaMaximumAlpha") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputExtent, forKey: "inputExtent")
        return filter
    }
    
    /// CIAreaMinimum
    /// - SeeAlso: [Reference/CIAreaMinimum](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIAreaMinimum)
    ///
    /// - parameter inputImage: The image to process.
    /// - parameter inputExtent: A rectangle that specifies the subregion of the image that you want to process. defaultValue = [0 0 640 80].
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 9, *)
    static func areaMinimum(inputImage: CIImage, inputExtent: CIVector) -> CIFilter? {
        guard let filter = CIFilter(name: "CIAreaMinimum") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputExtent, forKey: "inputExtent")
        return filter
    }
    
    /// CIAreaMinimumAlpha
    /// - SeeAlso: [Reference/CIAreaMinimumAlpha](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIAreaMinimumAlpha)
    ///
    /// - parameter inputImage: The image to process.
    /// - parameter inputExtent: A rectangle that specifies the subregion of the image that you want to process. defaultValue = [0 0 640 80].
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 9, *)
    static func areaMinimumAlpha(inputImage: CIImage, inputExtent: CIVector) -> CIFilter? {
        guard let filter = CIFilter(name: "CIAreaMinimumAlpha") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputExtent, forKey: "inputExtent")
        return filter
    }
    
    /// CIAreaMinMaxRed
    /// - SeeAlso: [Reference/CIAreaMinMaxRed](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIAreaMinMaxRed)
    ///
    /// - parameter inputImage: The image to process.
    /// - parameter inputExtent: A rectangle that specifies the subregion of the image that you want to process. defaultValue = [0 0 640 80].
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 11, *)
    static func areaMinMaxRed(inputImage: CIImage, inputExtent: CIVector) -> CIFilter? {
        guard let filter = CIFilter(name: "CIAreaMinMaxRed") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputExtent, forKey: "inputExtent")
        return filter
    }
    
    /// CIAttributedTextImageGenerator
    /// - SeeAlso: [Reference/CIAttributedTextImageGenerator](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIAttributedTextImageGenerator)
    ///
    /// - parameter inputText:
    /// - parameter inputScaleFactor:  defaultValue = 1.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 11, *)
    static func attributedTextImageGenerator(inputText: NSAttributedString, inputScaleFactor: NSNumber = 1) -> CIFilter? {
        guard let filter = CIFilter(name: "CIAttributedTextImageGenerator") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputText, forKey: "inputText")
        filter.setValue(inputScaleFactor, forKey: "inputScaleFactor")
        return filter
    }
    
    /// CIAztecCodeGenerator
    /// - SeeAlso: [Reference/CIAztecCodeGenerator](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIAztecCodeGenerator)
    ///
    /// - parameter inputMessage:
    /// - parameter inputCorrectionLevel: Aztec error correction value between 5 and 95 defaultValue = 23.
    /// - parameter inputLayers: Aztec layers value between 1 and 32. Set to nil for automatic.
    /// - parameter inputCompactStyle: Aztec force compact style @YES or @NO. Set to nil for automatic.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage", "outputCGImage"])
    @available(iOS 8, *)
    static func aztecCodeGenerator(inputMessage: NSData, inputCorrectionLevel: NSNumber = 23, inputLayers: NSNumber, inputCompactStyle: NSNumber) -> CIFilter? {
        guard let filter = CIFilter(name: "CIAztecCodeGenerator") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputMessage, forKey: "inputMessage")
        filter.setValue(inputCorrectionLevel, forKey: "inputCorrectionLevel")
        filter.setValue(inputLayers, forKey: "inputLayers")
        filter.setValue(inputCompactStyle, forKey: "inputCompactStyle")
        return filter
    }
    
    /// CIBarcodeGenerator
    /// - SeeAlso: [Reference/CIBarcodeGenerator](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIBarcodeGenerator)
    ///
    /// - parameter inputBarcodeDescriptor:
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage", "outputCGImageForQRCodeDescriptor", "outputCGImageForAztecCodeDescriptor", "outputCGImageForPDF417CodeDescriptor", "outputCGImageForDataMatrixCodeDescriptor", "outputCGImage"])
    @available(iOS 11, *)
    static func barcodeGenerator(inputBarcodeDescriptor: CIBarcodeDescriptor) -> CIFilter? {
        guard let filter = CIFilter(name: "CIBarcodeGenerator") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputBarcodeDescriptor, forKey: "inputBarcodeDescriptor")
        return filter
    }
    
    /// CIBarsSwipeTransition
    /// - SeeAlso: [Reference/CIBarsSwipeTransition](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIBarsSwipeTransition)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputTargetImage: The target image for a transition.
    /// - parameter inputAngle: The angle (in radians) of the bars. defaultValue = 3.141592653589793.
    /// - parameter inputWidth: The width of each bar. defaultValue = 30.
    /// - parameter inputBarOffset: The offset of one bar with respect to another defaultValue = 10.
    /// - parameter inputTime: The parametric time of the transition. This value drives the transition from start (at time 0) to end (at time 1). defaultValue = 0.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 6, *)
    static func barsSwipeTransition(inputImage: CIImage, inputTargetImage: CIImage, inputAngle: NSNumber = 3.141592653589793, inputWidth: NSNumber = 30, inputBarOffset: NSNumber = 10, inputTime: NSNumber = 0) -> CIFilter? {
        guard let filter = CIFilter(name: "CIBarsSwipeTransition") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputTargetImage, forKey: "inputTargetImage")
        filter.setValue(inputAngle, forKey: "inputAngle")
        filter.setValue(inputWidth, forKey: "inputWidth")
        filter.setValue(inputBarOffset, forKey: "inputBarOffset")
        filter.setValue(inputTime, forKey: "inputTime")
        return filter
    }
    
    /// CIBicubicScaleTransform
    /// - SeeAlso: [Reference/CIBicubicScaleTransform](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIBicubicScaleTransform)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputScale: The scaling factor to use on the image. Values less than 1.0 scale down the images. Values greater than 1.0 scale up the image. defaultValue = 1.
    /// - parameter inputAspectRatio: The additional horizontal scaling factor to use on the image. defaultValue = 1.
    /// - parameter inputB: Specifies the value of B to use for the cubic resampling function. defaultValue = 0.
    /// - parameter inputC: Specifies the value of C to use for the cubic resampling function. defaultValue = 0.75.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 11, *)
    static func bicubicScaleTransform(inputImage: CIImage, inputScale: NSNumber = 1, inputAspectRatio: NSNumber = 1, inputB: NSNumber = 0, inputC: NSNumber = 0.75) -> CIFilter? {
        guard let filter = CIFilter(name: "CIBicubicScaleTransform") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputScale, forKey: "inputScale")
        filter.setValue(inputAspectRatio, forKey: "inputAspectRatio")
        filter.setValue(inputB, forKey: "inputB")
        filter.setValue(inputC, forKey: "inputC")
        return filter
    }
    
    /// CIBlendWithAlphaMask
    /// - SeeAlso: [Reference/CIBlendWithAlphaMask](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIBlendWithAlphaMask)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputBackgroundImage: The image to use as a background image.
    /// - parameter inputMaskImage: A masking image.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 7, *)
    static func blendWithAlphaMask(inputImage: CIImage, inputBackgroundImage: CIImage, inputMaskImage: CIImage) -> CIFilter? {
        guard let filter = CIFilter(name: "CIBlendWithAlphaMask") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputBackgroundImage, forKey: "inputBackgroundImage")
        filter.setValue(inputMaskImage, forKey: "inputMaskImage")
        return filter
    }
    
    /// CIBlendWithBlueMask
    /// - SeeAlso: [Reference/CIBlendWithBlueMask](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIBlendWithBlueMask)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputBackgroundImage: The image to use as a background image.
    /// - parameter inputMaskImage: A masking image.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 11, *)
    static func blendWithBlueMask(inputImage: CIImage, inputBackgroundImage: CIImage, inputMaskImage: CIImage) -> CIFilter? {
        guard let filter = CIFilter(name: "CIBlendWithBlueMask") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputBackgroundImage, forKey: "inputBackgroundImage")
        filter.setValue(inputMaskImage, forKey: "inputMaskImage")
        return filter
    }
    
    /// CIBlendWithMask
    /// - SeeAlso: [Reference/CIBlendWithMask](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIBlendWithMask)
    ///
    /// - parameter inputImage: The image to use as a foreground image.
    /// - parameter inputBackgroundImage: The image to use as a background image.
    /// - parameter inputMaskImage: A grayscale mask. When a mask value is 0.0, the result is the background. When the mask value is 1.0, the result is the image.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 6, *)
    static func blendWithMask(inputImage: CIImage, inputBackgroundImage: CIImage, inputMaskImage: CIImage) -> CIFilter? {
        guard let filter = CIFilter(name: "CIBlendWithMask") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputBackgroundImage, forKey: "inputBackgroundImage")
        filter.setValue(inputMaskImage, forKey: "inputMaskImage")
        return filter
    }
    
    /// CIBlendWithRedMask
    /// - SeeAlso: [Reference/CIBlendWithRedMask](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIBlendWithRedMask)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputBackgroundImage: The image to use as a background image.
    /// - parameter inputMaskImage: A masking image.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 11, *)
    static func blendWithRedMask(inputImage: CIImage, inputBackgroundImage: CIImage, inputMaskImage: CIImage) -> CIFilter? {
        guard let filter = CIFilter(name: "CIBlendWithRedMask") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputBackgroundImage, forKey: "inputBackgroundImage")
        filter.setValue(inputMaskImage, forKey: "inputMaskImage")
        return filter
    }
    
    /// CIBloom
    /// - SeeAlso: [Reference/CIBloom](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIBloom)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputRadius: The radius determines how many pixels are used to create the effect. The larger the radius, the greater the effect. defaultValue = 10.
    /// - parameter inputIntensity: The intensity of the effect. A value of 0.0 is no effect. A value of 1.0 is the maximum effect. defaultValue = 0.5.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 6, *)
    static func bloom(inputImage: CIImage, inputRadius: NSNumber = 10, inputIntensity: NSNumber = 0.5) -> CIFilter? {
        guard let filter = CIFilter(name: "CIBloom") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputRadius, forKey: "inputRadius")
        filter.setValue(inputIntensity, forKey: "inputIntensity")
        return filter
    }
    
    /// CIBokehBlur
    /// - SeeAlso: [Reference/CIBokehBlur](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIBokehBlur)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputRadius: The radius determines how many pixels are used to create the blur. The larger the radius, the blurrier the result. defaultValue = 20.
    /// - parameter inputRingAmount: The amount of extra emphasis at the ring of the bokeh. defaultValue = 0.
    /// - parameter inputRingSize: The size of extra emphasis at the ring of the bokeh defaultValue = 0.1.
    /// - parameter inputSoftness:  defaultValue = 1.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 11, *)
    static func bokehBlur(inputImage: CIImage, inputRadius: NSNumber = 20, inputRingAmount: NSNumber = 0, inputRingSize: NSNumber = 0.1, inputSoftness: NSNumber = 1) -> CIFilter? {
        guard let filter = CIFilter(name: "CIBokehBlur") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputRadius, forKey: "inputRadius")
        filter.setValue(inputRingAmount, forKey: "inputRingAmount")
        filter.setValue(inputRingSize, forKey: "inputRingSize")
        filter.setValue(inputSoftness, forKey: "inputSoftness")
        return filter
    }
    
    /// CIBoxBlur
    /// - SeeAlso: [Reference/CIBoxBlur](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIBoxBlur)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputRadius: The radius determines how many pixels are used to create the blur. The larger the radius, the blurrier the result. defaultValue = 10.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 9, *)
    static func boxBlur(inputImage: CIImage, inputRadius: NSNumber = 10) -> CIFilter? {
        guard let filter = CIFilter(name: "CIBoxBlur") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputRadius, forKey: "inputRadius")
        return filter
    }
    
    /// CIBumpDistortion
    /// - SeeAlso: [Reference/CIBumpDistortion](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIBumpDistortion)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputCenter: The center of the effect as x and y coordinates. defaultValue = [150 150].
    /// - parameter inputRadius: The radius determines how many pixels are used to create the distortion. The larger the radius, the wider the extent of the distortion. defaultValue = 300.
    /// - parameter inputScale: The scale of the effect determines the curvature of the bump. A value of 0.0 has no effect. Positive values create an outward bump; negative values create an inward bump. defaultValue = 0.5.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 6, *)
    static func bumpDistortion(inputImage: CIImage, inputCenter: CIVector, inputRadius: NSNumber = 300, inputScale: NSNumber = 0.5) -> CIFilter? {
        guard let filter = CIFilter(name: "CIBumpDistortion") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputCenter, forKey: "inputCenter")
        filter.setValue(inputRadius, forKey: "inputRadius")
        filter.setValue(inputScale, forKey: "inputScale")
        return filter
    }
    
    /// CIBumpDistortionLinear
    /// - SeeAlso: [Reference/CIBumpDistortionLinear](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIBumpDistortionLinear)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputCenter: The center of the effect as x and y coordinates. defaultValue = [150 150].
    /// - parameter inputRadius: The radius determines how many pixels are used to create the distortion. The larger the radius, the wider the extent of the distortion. defaultValue = 300.
    /// - parameter inputAngle: The angle (in radians) of the line around which the distortion occurs. defaultValue = 0.
    /// - parameter inputScale: The scale of the effect. defaultValue = 0.5.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 6, *)
    static func bumpDistortionLinear(inputImage: CIImage, inputCenter: CIVector, inputRadius: NSNumber = 300, inputAngle: NSNumber = 0, inputScale: NSNumber = 0.5) -> CIFilter? {
        guard let filter = CIFilter(name: "CIBumpDistortionLinear") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputCenter, forKey: "inputCenter")
        filter.setValue(inputRadius, forKey: "inputRadius")
        filter.setValue(inputAngle, forKey: "inputAngle")
        filter.setValue(inputScale, forKey: "inputScale")
        return filter
    }
    
    /// CICheckerboardGenerator
    /// - SeeAlso: [Reference/CICheckerboardGenerator](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CICheckerboardGenerator)
    ///
    /// - parameter inputCenter: The center of the effect as x and y coordinates. defaultValue = [150 150].
    /// - parameter inputColor0: A color to use for the first set of squares. defaultValue = (1 1 1 1) <CGColorSpace 0x6040000ac8a0> (kCGColorSpaceDeviceRGB).
    /// - parameter inputColor1: A color to use for the second set of squares. defaultValue = (0 0 0 1) <CGColorSpace 0x6040000ac8a0> (kCGColorSpaceDeviceRGB).
    /// - parameter inputWidth: The width of the squares in the pattern. defaultValue = 80.
    /// - parameter inputSharpness: The sharpness of the edges in pattern. The smaller the value, the more blurry the pattern. Values range from 0.0 to 1.0. defaultValue = 1.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 5, *)
    static func checkerboardGenerator(inputCenter: CIVector, inputColor0: CIColor, inputColor1: CIColor, inputWidth: NSNumber = 80, inputSharpness: NSNumber = 1) -> CIFilter? {
        guard let filter = CIFilter(name: "CICheckerboardGenerator") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputCenter, forKey: "inputCenter")
        filter.setValue(inputColor0, forKey: "inputColor0")
        filter.setValue(inputColor1, forKey: "inputColor1")
        filter.setValue(inputWidth, forKey: "inputWidth")
        filter.setValue(inputSharpness, forKey: "inputSharpness")
        return filter
    }
    
    /// CICircleSplashDistortion
    /// - SeeAlso: [Reference/CICircleSplashDistortion](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CICircleSplashDistortion)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputCenter: The center of the effect as x and y coordinates. defaultValue = [150 150].
    /// - parameter inputRadius: The radius determines how many pixels are used to create the distortion. The larger the radius, the wider the extent of the distortion. defaultValue = 150.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 6, *)
    static func circleSplashDistortion(inputImage: CIImage, inputCenter: CIVector, inputRadius: NSNumber = 150) -> CIFilter? {
        guard let filter = CIFilter(name: "CICircleSplashDistortion") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputCenter, forKey: "inputCenter")
        filter.setValue(inputRadius, forKey: "inputRadius")
        return filter
    }
    
    /// CICircularScreen
    /// - SeeAlso: [Reference/CICircularScreen](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CICircularScreen)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputCenter: The x and y position to use as the center of the circular screen pattern defaultValue = [150 150].
    /// - parameter inputWidth: The distance between each circle in the pattern. defaultValue = 6.
    /// - parameter inputSharpness: The sharpness of the circles. The larger the value, the sharper the circles. defaultValue = 0.7.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 6, *)
    static func circularScreen(inputImage: CIImage, inputCenter: CIVector, inputWidth: NSNumber = 6, inputSharpness: NSNumber = 0.7) -> CIFilter? {
        guard let filter = CIFilter(name: "CICircularScreen") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputCenter, forKey: "inputCenter")
        filter.setValue(inputWidth, forKey: "inputWidth")
        filter.setValue(inputSharpness, forKey: "inputSharpness")
        return filter
    }
    
    /// CICircularWrap
    /// - SeeAlso: [Reference/CICircularWrap](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CICircularWrap)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputCenter: The center of the effect as x and y coordinates. defaultValue = [150 150].
    /// - parameter inputRadius: The radius determines how many pixels are used to create the distortion. The larger the radius, the wider the extent of the distortion. defaultValue = 150.
    /// - parameter inputAngle: The angle of the effect. defaultValue = 0.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 9, *)
    static func circularWrap(inputImage: CIImage, inputCenter: CIVector, inputRadius: NSNumber = 150, inputAngle: NSNumber = 0) -> CIFilter? {
        guard let filter = CIFilter(name: "CICircularWrap") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputCenter, forKey: "inputCenter")
        filter.setValue(inputRadius, forKey: "inputRadius")
        filter.setValue(inputAngle, forKey: "inputAngle")
        return filter
    }
    
    /// CIClamp
    /// - SeeAlso: [Reference/CIClamp](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIClamp)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputExtent: A rectangle that defines the extent of the effect. defaultValue = [0 0 640 80].
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 10, *)
    static func clamp(inputImage: CIImage, inputExtent: CIVector) -> CIFilter? {
        guard let filter = CIFilter(name: "CIClamp") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputExtent, forKey: "inputExtent")
        return filter
    }
    
    /// CICMYKHalftone
    /// - SeeAlso: [Reference/CICMYKHalftone](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CICMYKHalftone)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputCenter: The x and y position to use as the center of the halftone pattern defaultValue = [150 150].
    /// - parameter inputWidth: The distance between dots in the pattern. defaultValue = 6.
    /// - parameter inputAngle: The angle of the pattern. defaultValue = 0.
    /// - parameter inputSharpness: The sharpness of the pattern. The larger the value, the sharper the pattern. defaultValue = 0.7.
    /// - parameter inputGCR: The gray component replacement value. The value can vary from 0.0 (none) to 1.0. defaultValue = 1.
    /// - parameter inputUCR: The under color removal value. The value can vary from 0.0 to 1.0.  defaultValue = 0.5.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 9, *)
    static func cMYKHalftone(inputImage: CIImage, inputCenter: CIVector, inputWidth: NSNumber = 6, inputAngle: NSNumber = 0, inputSharpness: NSNumber = 0.7, inputGCR: NSNumber = 1, inputUCR: NSNumber = 0.5) -> CIFilter? {
        guard let filter = CIFilter(name: "CICMYKHalftone") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputCenter, forKey: "inputCenter")
        filter.setValue(inputWidth, forKey: "inputWidth")
        filter.setValue(inputAngle, forKey: "inputAngle")
        filter.setValue(inputSharpness, forKey: "inputSharpness")
        filter.setValue(inputGCR, forKey: "inputGCR")
        filter.setValue(inputUCR, forKey: "inputUCR")
        return filter
    }
    
    /// CICode128BarcodeGenerator
    /// - SeeAlso: [Reference/CICode128BarcodeGenerator](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CICode128BarcodeGenerator)
    ///
    /// - parameter inputMessage:
    /// - parameter inputQuietSpace:  defaultValue = 7.
    /// - parameter inputBarcodeHeight:  defaultValue = 32.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage", "outputCGImage"])
    @available(iOS 8, *)
    static func code128BarcodeGenerator(inputMessage: NSData, inputQuietSpace: NSNumber = 7, inputBarcodeHeight: NSNumber = 32) -> CIFilter? {
        guard let filter = CIFilter(name: "CICode128BarcodeGenerator") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputMessage, forKey: "inputMessage")
        filter.setValue(inputQuietSpace, forKey: "inputQuietSpace")
        filter.setValue(inputBarcodeHeight, forKey: "inputBarcodeHeight")
        return filter
    }
    
    /// CIColorBlendMode
    /// - SeeAlso: [Reference/CIColorBlendMode](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIColorBlendMode)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputBackgroundImage: The image to use as a background image.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 5, *)
    static func colorBlendMode(inputImage: CIImage, inputBackgroundImage: CIImage) -> CIFilter? {
        guard let filter = CIFilter(name: "CIColorBlendMode") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputBackgroundImage, forKey: "inputBackgroundImage")
        return filter
    }
    
    /// CIColorBurnBlendMode
    /// - SeeAlso: [Reference/CIColorBurnBlendMode](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIColorBurnBlendMode)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputBackgroundImage: The image to use as a background image.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 5, *)
    static func colorBurnBlendMode(inputImage: CIImage, inputBackgroundImage: CIImage) -> CIFilter? {
        guard let filter = CIFilter(name: "CIColorBurnBlendMode") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputBackgroundImage, forKey: "inputBackgroundImage")
        return filter
    }
    
    /// CIColorClamp
    /// - SeeAlso: [Reference/CIColorClamp](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIColorClamp)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputMinComponents: Lower clamping values defaultValue = [0 0 0 0].
    /// - parameter inputMaxComponents: Higher clamping values defaultValue = [1 1 1 1].
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 7, *)
    static func colorClamp(inputImage: CIImage, inputMinComponents: CIVector, inputMaxComponents: CIVector) -> CIFilter? {
        guard let filter = CIFilter(name: "CIColorClamp") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputMinComponents, forKey: "inputMinComponents")
        filter.setValue(inputMaxComponents, forKey: "inputMaxComponents")
        return filter
    }
    
    /// CIColorControls
    /// - SeeAlso: [Reference/CIColorControls](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIColorControls)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputSaturation: The amount of saturation to apply. The larger the value, the more saturated the result. defaultValue = 1.
    /// - parameter inputBrightness: The amount of brightness to apply. The larger the value, the brighter the result. defaultValue = 0.
    /// - parameter inputContrast: The amount of contrast to apply. The larger the value, the more contrast in the resulting image. defaultValue = 1.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 5, *)
    static func colorControls(inputImage: CIImage, inputSaturation: NSNumber = 1, inputBrightness: NSNumber = 0, inputContrast: NSNumber = 1) -> CIFilter? {
        guard let filter = CIFilter(name: "CIColorControls") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputSaturation, forKey: "inputSaturation")
        filter.setValue(inputBrightness, forKey: "inputBrightness")
        filter.setValue(inputContrast, forKey: "inputContrast")
        return filter
    }
    
    /// CIColorCrossPolynomial
    /// - SeeAlso: [Reference/CIColorCrossPolynomial](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIColorCrossPolynomial)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputRedCoefficients: Polynomial coefficients for red channel defaultValue = [1 0 0 0 0 0 0 0 0 0].
    /// - parameter inputGreenCoefficients: Polynomial coefficients for green channel defaultValue = [0 1 0 0 0 0 0 0 0 0].
    /// - parameter inputBlueCoefficients: Polynomial coefficients for blue channel defaultValue = [0 0 1 0 0 0 0 0 0 0].
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 7, *)
    static func colorCrossPolynomial(inputImage: CIImage, inputRedCoefficients: CIVector, inputGreenCoefficients: CIVector, inputBlueCoefficients: CIVector) -> CIFilter? {
        guard let filter = CIFilter(name: "CIColorCrossPolynomial") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputRedCoefficients, forKey: "inputRedCoefficients")
        filter.setValue(inputGreenCoefficients, forKey: "inputGreenCoefficients")
        filter.setValue(inputBlueCoefficients, forKey: "inputBlueCoefficients")
        return filter
    }
    
    /// CIColorCube
    /// - SeeAlso: [Reference/CIColorCube](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIColorCube)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputCubeDimension:  defaultValue = 2.
    /// - parameter inputCubeData: This is a color table of floating-point RGBA cells that use premultiplied alpha. The cells are organized in a standard ordering. The columns and rows of the data are indexed by red and green, respectively. Each data plane is followed by the next higher plane in the data, with planes indexed by blue. defaultValue = <00000000 00000000 00000000 0000803f 0000803f 00000000 00000000 0000803f 00000000 0000803f 00000000 0000803f 0000803f 0000803f 00000000 0000803f 00000000 00000000 0000803f 0000803f 0000803f 00000000 0000803f 0000803f 00000000 0000803f 0000803f 0000803f 0000803f 0000803f 0000803f 0000803f>.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 5, *)
    static func colorCube(inputImage: CIImage, inputCubeDimension: NSNumber = 2, inputCubeData: NSData) -> CIFilter? {
        guard let filter = CIFilter(name: "CIColorCube") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputCubeDimension, forKey: "inputCubeDimension")
        filter.setValue(inputCubeData, forKey: "inputCubeData")
        return filter
    }
    
    /// CIColorCubesMixedWithMask
    /// - SeeAlso: [Reference/CIColorCubesMixedWithMask](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIColorCubesMixedWithMask)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputMaskImage: A masking image.
    /// - parameter inputCubeDimension:  defaultValue = 2.
    /// - parameter inputCube0Data:  defaultValue = <00000000 00000000 00000000 0000803f 0000803f 00000000 00000000 0000803f 00000000 0000803f 00000000 0000803f 0000803f 0000803f 00000000 0000803f 00000000 00000000 0000803f 0000803f 0000803f 00000000 0000803f 0000803f 00000000 0000803f 0000803f 0000803f 0000803f 0000803f 0000803f 0000803f>.
    /// - parameter inputCube1Data:  defaultValue = <00000000 00000000 00000000 0000803f 0000803f 00000000 00000000 0000803f 00000000 0000803f 00000000 0000803f 0000803f 0000803f 00000000 0000803f 00000000 00000000 0000803f 0000803f 0000803f 00000000 0000803f 0000803f 00000000 0000803f 0000803f 0000803f 0000803f 0000803f 0000803f 0000803f>.
    /// - parameter inputColorSpace:
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 11, *)
    static func colorCubesMixedWithMask(inputImage: CIImage, inputMaskImage: CIImage, inputCubeDimension: NSNumber = 2, inputCube0Data: NSData, inputCube1Data: NSData, inputColorSpace: NSObject) -> CIFilter? {
        guard let filter = CIFilter(name: "CIColorCubesMixedWithMask") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputMaskImage, forKey: "inputMaskImage")
        filter.setValue(inputCubeDimension, forKey: "inputCubeDimension")
        filter.setValue(inputCube0Data, forKey: "inputCube0Data")
        filter.setValue(inputCube1Data, forKey: "inputCube1Data")
        filter.setValue(inputColorSpace, forKey: "inputColorSpace")
        return filter
    }
    
    /// CIColorCubeWithColorSpace
    /// - SeeAlso: [Reference/CIColorCubeWithColorSpace](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIColorCubeWithColorSpace)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputCubeDimension:  defaultValue = 2.
    /// - parameter inputCubeData:  defaultValue = <00000000 00000000 00000000 0000803f 0000803f 00000000 00000000 0000803f 00000000 0000803f 00000000 0000803f 0000803f 0000803f 00000000 0000803f 00000000 00000000 0000803f 0000803f 0000803f 00000000 0000803f 0000803f 00000000 0000803f 0000803f 0000803f 0000803f 0000803f 0000803f 0000803f>.
    /// - parameter inputColorSpace:
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 7, *)
    static func colorCubeWithColorSpace(inputImage: CIImage, inputCubeDimension: NSNumber = 2, inputCubeData: NSData, inputColorSpace: NSObject) -> CIFilter? {
        guard let filter = CIFilter(name: "CIColorCubeWithColorSpace") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputCubeDimension, forKey: "inputCubeDimension")
        filter.setValue(inputCubeData, forKey: "inputCubeData")
        filter.setValue(inputColorSpace, forKey: "inputColorSpace")
        return filter
    }
    
    /// CIColorCurves
    /// - SeeAlso: [Reference/CIColorCurves](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIColorCurves)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputCurvesData:  defaultValue = <00000000 00000000 00000000 0000003f 0000003f 0000003f 0000803f 0000803f 0000803f>.
    /// - parameter inputCurvesDomain:  defaultValue = [0 1].
    /// - parameter inputColorSpace:
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 11, *)
    static func colorCurves(inputImage: CIImage, inputCurvesData: NSData, inputCurvesDomain: CIVector, inputColorSpace: NSObject) -> CIFilter? {
        guard let filter = CIFilter(name: "CIColorCurves") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputCurvesData, forKey: "inputCurvesData")
        filter.setValue(inputCurvesDomain, forKey: "inputCurvesDomain")
        filter.setValue(inputColorSpace, forKey: "inputColorSpace")
        return filter
    }
    
    /// CIColorDodgeBlendMode
    /// - SeeAlso: [Reference/CIColorDodgeBlendMode](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIColorDodgeBlendMode)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputBackgroundImage: The image to use as a background image.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 5, *)
    static func colorDodgeBlendMode(inputImage: CIImage, inputBackgroundImage: CIImage) -> CIFilter? {
        guard let filter = CIFilter(name: "CIColorDodgeBlendMode") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputBackgroundImage, forKey: "inputBackgroundImage")
        return filter
    }
    
    /// CIColorInvert
    /// - SeeAlso: [Reference/CIColorInvert](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIColorInvert)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 5, *)
    static func colorInvert(inputImage: CIImage) -> CIFilter? {
        guard let filter = CIFilter(name: "CIColorInvert") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        return filter
    }
    
    /// CIColorMap
    /// - SeeAlso: [Reference/CIColorMap](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIColorMap)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputGradientImage: The image data from this image transforms the source image values.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 6, *)
    static func colorMap(inputImage: CIImage, inputGradientImage: CIImage) -> CIFilter? {
        guard let filter = CIFilter(name: "CIColorMap") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputGradientImage, forKey: "inputGradientImage")
        return filter
    }
    
    /// CIColorMatrix
    /// - SeeAlso: [Reference/CIColorMatrix](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIColorMatrix)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputRVector: The amount of red to multiply the source color values by. defaultValue = [1 0 0 0].
    /// - parameter inputGVector: The amount of green to multiply the source color values by. defaultValue = [0 1 0 0].
    /// - parameter inputBVector: The amount of blue to multiply the source color values by. defaultValue = [0 0 1 0].
    /// - parameter inputAVector: The amount of alpha to multiply the source color values by. defaultValue = [0 0 0 1].
    /// - parameter inputBiasVector: A vector that’s added to each color component. defaultValue = [0 0 0 0].
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 5, *)
    static func colorMatrix(inputImage: CIImage, inputRVector: CIVector, inputGVector: CIVector, inputBVector: CIVector, inputAVector: CIVector, inputBiasVector: CIVector) -> CIFilter? {
        guard let filter = CIFilter(name: "CIColorMatrix") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputRVector, forKey: "inputRVector")
        filter.setValue(inputGVector, forKey: "inputGVector")
        filter.setValue(inputBVector, forKey: "inputBVector")
        filter.setValue(inputAVector, forKey: "inputAVector")
        filter.setValue(inputBiasVector, forKey: "inputBiasVector")
        return filter
    }
    
    /// CIColorMonochrome
    /// - SeeAlso: [Reference/CIColorMonochrome](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIColorMonochrome)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputColor: The monochrome color to apply to the image. defaultValue = (0.6 0.45 0.3 1) <CGColorSpace 0x6040000ac8a0> (kCGColorSpaceDeviceRGB).
    /// - parameter inputIntensity: The intensity of the monochrome effect. A value of 1.0 creates a monochrome image using the supplied color. A value of 0.0 has no effect on the image. defaultValue = 1.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 5, *)
    static func colorMonochrome(inputImage: CIImage, inputColor: CIColor, inputIntensity: NSNumber = 1) -> CIFilter? {
        guard let filter = CIFilter(name: "CIColorMonochrome") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputColor, forKey: "inputColor")
        filter.setValue(inputIntensity, forKey: "inputIntensity")
        return filter
    }
    
    /// CIColorPolynomial
    /// - SeeAlso: [Reference/CIColorPolynomial](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIColorPolynomial)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputRedCoefficients: Polynomial coefficients for red channel defaultValue = [0 1 0 0].
    /// - parameter inputGreenCoefficients: Polynomial coefficients for green channel defaultValue = [0 1 0 0].
    /// - parameter inputBlueCoefficients: Polynomial coefficients for blue channel defaultValue = [0 1 0 0].
    /// - parameter inputAlphaCoefficients: Polynomial coefficients for alpha channel defaultValue = [0 1 0 0].
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 7, *)
    static func colorPolynomial(inputImage: CIImage, inputRedCoefficients: CIVector, inputGreenCoefficients: CIVector, inputBlueCoefficients: CIVector, inputAlphaCoefficients: CIVector) -> CIFilter? {
        guard let filter = CIFilter(name: "CIColorPolynomial") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputRedCoefficients, forKey: "inputRedCoefficients")
        filter.setValue(inputGreenCoefficients, forKey: "inputGreenCoefficients")
        filter.setValue(inputBlueCoefficients, forKey: "inputBlueCoefficients")
        filter.setValue(inputAlphaCoefficients, forKey: "inputAlphaCoefficients")
        return filter
    }
    
    /// CIColorPosterize
    /// - SeeAlso: [Reference/CIColorPosterize](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIColorPosterize)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputLevels: The number of brightness levels to use for each color component. Lower values result in a more extreme poster effect. defaultValue = 6.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 6, *)
    static func colorPosterize(inputImage: CIImage, inputLevels: NSNumber = 6) -> CIFilter? {
        guard let filter = CIFilter(name: "CIColorPosterize") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputLevels, forKey: "inputLevels")
        return filter
    }
    
    /// CIColumnAverage
    /// - SeeAlso: [Reference/CIColumnAverage](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIColumnAverage)
    ///
    /// - parameter inputImage: The image to process.
    /// - parameter inputExtent: A rectangle that specifies the subregion of the image that you want to process. defaultValue = [0 0 640 80].
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 9, *)
    static func columnAverage(inputImage: CIImage, inputExtent: CIVector) -> CIFilter? {
        guard let filter = CIFilter(name: "CIColumnAverage") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputExtent, forKey: "inputExtent")
        return filter
    }
    
    /// CIComicEffect
    /// - SeeAlso: [Reference/CIComicEffect](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIComicEffect)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 9, *)
    static func comicEffect(inputImage: CIImage) -> CIFilter? {
        guard let filter = CIFilter(name: "CIComicEffect") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        return filter
    }
    
    /// CIConstantColorGenerator
    /// - SeeAlso: [Reference/CIConstantColorGenerator](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIConstantColorGenerator)
    ///
    /// - parameter inputColor: The color to generate. defaultValue = (1 0 0 1) <CGColorSpace 0x6040000ac8a0> (kCGColorSpaceDeviceRGB).
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 5, *)
    static func constantColorGenerator(inputColor: CIColor) -> CIFilter? {
        guard let filter = CIFilter(name: "CIConstantColorGenerator") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputColor, forKey: "inputColor")
        return filter
    }
    
    /// CIConvolution3X3
    /// - SeeAlso: [Reference/CIConvolution3X3](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIConvolution3X3)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputWeights:  defaultValue = [0 0 0 0 1 0 0 0 0].
    /// - parameter inputBias:  defaultValue = 0.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 7, *)
    static func convolution3X3(inputImage: CIImage, inputWeights: CIVector, inputBias: NSNumber = 0) -> CIFilter? {
        guard let filter = CIFilter(name: "CIConvolution3X3") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputWeights, forKey: "inputWeights")
        filter.setValue(inputBias, forKey: "inputBias")
        return filter
    }
    
    /// CIConvolution5X5
    /// - SeeAlso: [Reference/CIConvolution5X5](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIConvolution5X5)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputWeights:  defaultValue = [0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0].
    /// - parameter inputBias:  defaultValue = 0.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 7, *)
    static func convolution5X5(inputImage: CIImage, inputWeights: CIVector, inputBias: NSNumber = 0) -> CIFilter? {
        guard let filter = CIFilter(name: "CIConvolution5X5") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputWeights, forKey: "inputWeights")
        filter.setValue(inputBias, forKey: "inputBias")
        return filter
    }
    
    /// CIConvolution7X7
    /// - SeeAlso: [Reference/CIConvolution7X7](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIConvolution7X7)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputWeights:  defaultValue = [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0].
    /// - parameter inputBias:  defaultValue = 0.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 9, *)
    static func convolution7X7(inputImage: CIImage, inputWeights: CIVector, inputBias: NSNumber = 0) -> CIFilter? {
        guard let filter = CIFilter(name: "CIConvolution7X7") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputWeights, forKey: "inputWeights")
        filter.setValue(inputBias, forKey: "inputBias")
        return filter
    }
    
    /// CIConvolution9Horizontal
    /// - SeeAlso: [Reference/CIConvolution9Horizontal](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIConvolution9Horizontal)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputWeights:  defaultValue = [0 0 0 0 1 0 0 0 0].
    /// - parameter inputBias:  defaultValue = 0.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 7, *)
    static func convolution9Horizontal(inputImage: CIImage, inputWeights: CIVector, inputBias: NSNumber = 0) -> CIFilter? {
        guard let filter = CIFilter(name: "CIConvolution9Horizontal") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputWeights, forKey: "inputWeights")
        filter.setValue(inputBias, forKey: "inputBias")
        return filter
    }
    
    /// CIConvolution9Vertical
    /// - SeeAlso: [Reference/CIConvolution9Vertical](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIConvolution9Vertical)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputWeights:  defaultValue = [0 0 0 0 1 0 0 0 0].
    /// - parameter inputBias:  defaultValue = 0.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 7, *)
    static func convolution9Vertical(inputImage: CIImage, inputWeights: CIVector, inputBias: NSNumber = 0) -> CIFilter? {
        guard let filter = CIFilter(name: "CIConvolution9Vertical") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputWeights, forKey: "inputWeights")
        filter.setValue(inputBias, forKey: "inputBias")
        return filter
    }
    
    /// CICopyMachineTransition
    /// - SeeAlso: [Reference/CICopyMachineTransition](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CICopyMachineTransition)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputTargetImage: The target image for a transition.
    /// - parameter inputExtent: A rectangle that defines the extent of the effect. defaultValue = [0 0 300 300].
    /// - parameter inputColor: The color of the copier light. defaultValue = (0.6 1 0.8 1) <CGColorSpace 0x6040000ac8a0> (kCGColorSpaceDeviceRGB).
    /// - parameter inputTime: The parametric time of the transition. This value drives the transition from start (at time 0) to end (at time 1). defaultValue = 0.
    /// - parameter inputAngle: The angle of the copier light. defaultValue = 0.
    /// - parameter inputWidth: The width of the copier light.  defaultValue = 200.
    /// - parameter inputOpacity: The opacity of the copier light. A value of 0.0 is transparent. A value of 1.0 is opaque. defaultValue = 1.3.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 6, *)
    static func copyMachineTransition(inputImage: CIImage, inputTargetImage: CIImage, inputExtent: CIVector, inputColor: CIColor, inputTime: NSNumber = 0, inputAngle: NSNumber = 0, inputWidth: NSNumber = 200, inputOpacity: NSNumber = 1.3) -> CIFilter? {
        guard let filter = CIFilter(name: "CICopyMachineTransition") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputTargetImage, forKey: "inputTargetImage")
        filter.setValue(inputExtent, forKey: "inputExtent")
        filter.setValue(inputColor, forKey: "inputColor")
        filter.setValue(inputTime, forKey: "inputTime")
        filter.setValue(inputAngle, forKey: "inputAngle")
        filter.setValue(inputWidth, forKey: "inputWidth")
        filter.setValue(inputOpacity, forKey: "inputOpacity")
        return filter
    }
    
    /// CICrop
    /// - SeeAlso: [Reference/CICrop](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CICrop)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputRectangle: The rectangle that specifies the crop to apply to the image. defaultValue = [-8.98847e+307 -8.98847e+307 1.79769e+308 1.79769e+308].
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 5, *)
    static func crop(inputImage: CIImage, inputRectangle: CIVector) -> CIFilter? {
        guard let filter = CIFilter(name: "CICrop") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputRectangle, forKey: "inputRectangle")
        return filter
    }
    
    /// CICrystallize
    /// - SeeAlso: [Reference/CICrystallize](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CICrystallize)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputRadius: The radius determines how many pixels are used to create the effect. The larger the radius, the larger the resulting crystals. defaultValue = 20.
    /// - parameter inputCenter: The center of the effect as x and y coordinates. defaultValue = [150 150].
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 9, *)
    static func crystallize(inputImage: CIImage, inputRadius: NSNumber = 20, inputCenter: CIVector) -> CIFilter? {
        guard let filter = CIFilter(name: "CICrystallize") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputRadius, forKey: "inputRadius")
        filter.setValue(inputCenter, forKey: "inputCenter")
        return filter
    }
    
    /// CIDarkenBlendMode
    /// - SeeAlso: [Reference/CIDarkenBlendMode](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIDarkenBlendMode)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputBackgroundImage: The image to use as a background image.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 5, *)
    static func darkenBlendMode(inputImage: CIImage, inputBackgroundImage: CIImage) -> CIFilter? {
        guard let filter = CIFilter(name: "CIDarkenBlendMode") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputBackgroundImage, forKey: "inputBackgroundImage")
        return filter
    }
    
    /// CIDepthBlurEffect
    /// - SeeAlso: [Reference/CIDepthBlurEffect](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIDepthBlurEffect)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputDisparityImage:
    /// - parameter inputAperture:  defaultValue = 0.
    /// - parameter inputLeftEyePositions:
    /// - parameter inputRightEyePositions:
    /// - parameter inputChinPositions:
    /// - parameter inputNosePositions:
    /// - parameter inputFocusRect:
    /// - parameter inputLumaNoiseScale:  defaultValue = 0.
    /// - parameter inputScaleFactor:  defaultValue = 1.
    /// - parameter inputCalibrationData:
    /// - parameter inputAuxDataMetadata:
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 11, *)
    static func depthBlurEffect(inputImage: CIImage, inputDisparityImage: CIImage, inputAperture: NSNumber = 0, inputLeftEyePositions: CIVector, inputRightEyePositions: CIVector, inputChinPositions: CIVector, inputNosePositions: CIVector, inputFocusRect: CIVector, inputLumaNoiseScale: NSNumber = 0, inputScaleFactor: NSNumber = 1, inputCalibrationData: AVCameraCalibrationData, inputAuxDataMetadata: NSDictionary) -> CIFilter? {
        guard let filter = CIFilter(name: "CIDepthBlurEffect") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputDisparityImage, forKey: "inputDisparityImage")
        filter.setValue(inputAperture, forKey: "inputAperture")
        filter.setValue(inputLeftEyePositions, forKey: "inputLeftEyePositions")
        filter.setValue(inputRightEyePositions, forKey: "inputRightEyePositions")
        filter.setValue(inputChinPositions, forKey: "inputChinPositions")
        filter.setValue(inputNosePositions, forKey: "inputNosePositions")
        filter.setValue(inputFocusRect, forKey: "inputFocusRect")
        filter.setValue(inputLumaNoiseScale, forKey: "inputLumaNoiseScale")
        filter.setValue(inputScaleFactor, forKey: "inputScaleFactor")
        filter.setValue(inputCalibrationData, forKey: "inputCalibrationData")
        filter.setValue(inputAuxDataMetadata, forKey: "inputAuxDataMetadata")
        return filter
    }
    
    /// CIDepthOfField
    /// - SeeAlso: [Reference/CIDepthOfField](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIDepthOfField)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputPoint0:  defaultValue = [0 300].
    /// - parameter inputPoint1:  defaultValue = [300 300].
    /// - parameter inputSaturation: The amount to adjust the saturation. defaultValue = 1.5.
    /// - parameter inputUnsharpMaskRadius:  defaultValue = 2.5.
    /// - parameter inputUnsharpMaskIntensity:  defaultValue = 0.5.
    /// - parameter inputRadius: The distance from the center of the effect. defaultValue = 6.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 9, *)
    static func depthOfField(inputImage: CIImage, inputPoint0: CIVector, inputPoint1: CIVector, inputSaturation: NSNumber = 1.5, inputUnsharpMaskRadius: NSNumber = 2.5, inputUnsharpMaskIntensity: NSNumber = 0.5, inputRadius: NSNumber = 6) -> CIFilter? {
        guard let filter = CIFilter(name: "CIDepthOfField") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputPoint0, forKey: "inputPoint0")
        filter.setValue(inputPoint1, forKey: "inputPoint1")
        filter.setValue(inputSaturation, forKey: "inputSaturation")
        filter.setValue(inputUnsharpMaskRadius, forKey: "inputUnsharpMaskRadius")
        filter.setValue(inputUnsharpMaskIntensity, forKey: "inputUnsharpMaskIntensity")
        filter.setValue(inputRadius, forKey: "inputRadius")
        return filter
    }
    
    /// CIDepthToDisparity
    /// - SeeAlso: [Reference/CIDepthToDisparity](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIDepthToDisparity)
    ///
    /// - parameter inputImage: The input depth data image to convert to disparity data.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 11, *)
    static func depthToDisparity(inputImage: CIImage) -> CIFilter? {
        guard let filter = CIFilter(name: "CIDepthToDisparity") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        return filter
    }
    
    /// CIDifferenceBlendMode
    /// - SeeAlso: [Reference/CIDifferenceBlendMode](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIDifferenceBlendMode)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputBackgroundImage: The image to use as a background image.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 5, *)
    static func differenceBlendMode(inputImage: CIImage, inputBackgroundImage: CIImage) -> CIFilter? {
        guard let filter = CIFilter(name: "CIDifferenceBlendMode") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputBackgroundImage, forKey: "inputBackgroundImage")
        return filter
    }
    
    /// CIDiscBlur
    /// - SeeAlso: [Reference/CIDiscBlur](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIDiscBlur)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputRadius: The radius determines how many pixels are used to create the blur. The larger the radius, the blurrier the result. defaultValue = 8.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 9, *)
    static func discBlur(inputImage: CIImage, inputRadius: NSNumber = 8) -> CIFilter? {
        guard let filter = CIFilter(name: "CIDiscBlur") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputRadius, forKey: "inputRadius")
        return filter
    }
    
    /// CIDisintegrateWithMaskTransition
    /// - SeeAlso: [Reference/CIDisintegrateWithMaskTransition](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIDisintegrateWithMaskTransition)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputTargetImage: The target image for a transition.
    /// - parameter inputMaskImage: An image that defines the shape to use when disintegrating from the source to the target image.
    /// - parameter inputTime: The parametric time of the transition. This value drives the transition from start (at time 0) to end (at time 1). defaultValue = 0.
    /// - parameter inputShadowRadius: The radius of the shadow created by the mask. defaultValue = 8.
    /// - parameter inputShadowDensity: The density of the shadow created by the mask. defaultValue = 0.65.
    /// - parameter inputShadowOffset: The offset of the shadow created by the mask. defaultValue = [0 -10].
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 6, *)
    static func disintegrateWithMaskTransition(inputImage: CIImage, inputTargetImage: CIImage, inputMaskImage: CIImage, inputTime: NSNumber = 0, inputShadowRadius: NSNumber = 8, inputShadowDensity: NSNumber = 0.65, inputShadowOffset: CIVector) -> CIFilter? {
        guard let filter = CIFilter(name: "CIDisintegrateWithMaskTransition") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputTargetImage, forKey: "inputTargetImage")
        filter.setValue(inputMaskImage, forKey: "inputMaskImage")
        filter.setValue(inputTime, forKey: "inputTime")
        filter.setValue(inputShadowRadius, forKey: "inputShadowRadius")
        filter.setValue(inputShadowDensity, forKey: "inputShadowDensity")
        filter.setValue(inputShadowOffset, forKey: "inputShadowOffset")
        return filter
    }
    
    /// CIDisparityToDepth
    /// - SeeAlso: [Reference/CIDisparityToDepth](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIDisparityToDepth)
    ///
    /// - parameter inputImage: The input disparity data image to convert to depth data.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 11, *)
    static func disparityToDepth(inputImage: CIImage) -> CIFilter? {
        guard let filter = CIFilter(name: "CIDisparityToDepth") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        return filter
    }
    
    /// CIDisplacementDistortion
    /// - SeeAlso: [Reference/CIDisplacementDistortion](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIDisplacementDistortion)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputDisplacementImage: An image whose grayscale values will be applied to the source image.
    /// - parameter inputScale: The amount of texturing of the resulting image. The larger the value, the greater the texturing. defaultValue = 50.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 9, *)
    static func displacementDistortion(inputImage: CIImage, inputDisplacementImage: CIImage, inputScale: NSNumber = 50) -> CIFilter? {
        guard let filter = CIFilter(name: "CIDisplacementDistortion") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputDisplacementImage, forKey: "inputDisplacementImage")
        filter.setValue(inputScale, forKey: "inputScale")
        return filter
    }
    
    /// CIDissolveTransition
    /// - SeeAlso: [Reference/CIDissolveTransition](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIDissolveTransition)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputTargetImage: The target image for a transition.
    /// - parameter inputTime: The parametric time of the transition. This value drives the transition from start (at time 0) to end (at time 1). defaultValue = 0.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 6, *)
    static func dissolveTransition(inputImage: CIImage, inputTargetImage: CIImage, inputTime: NSNumber = 0) -> CIFilter? {
        guard let filter = CIFilter(name: "CIDissolveTransition") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputTargetImage, forKey: "inputTargetImage")
        filter.setValue(inputTime, forKey: "inputTime")
        return filter
    }
    
    /// CIDivideBlendMode
    /// - SeeAlso: [Reference/CIDivideBlendMode](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIDivideBlendMode)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputBackgroundImage: The image to use as a background image.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 8, *)
    static func divideBlendMode(inputImage: CIImage, inputBackgroundImage: CIImage) -> CIFilter? {
        guard let filter = CIFilter(name: "CIDivideBlendMode") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputBackgroundImage, forKey: "inputBackgroundImage")
        return filter
    }
    
    /// CIDotScreen
    /// - SeeAlso: [Reference/CIDotScreen](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIDotScreen)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputCenter: The x and y position to use as the center of the dot screen pattern defaultValue = [150 150].
    /// - parameter inputAngle: The angle of the pattern. defaultValue = 0.
    /// - parameter inputWidth: The distance between dots in the pattern. defaultValue = 6.
    /// - parameter inputSharpness: The sharpness of the pattern. The larger the value, the sharper the pattern. defaultValue = 0.7.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 6, *)
    static func dotScreen(inputImage: CIImage, inputCenter: CIVector, inputAngle: NSNumber = 0, inputWidth: NSNumber = 6, inputSharpness: NSNumber = 0.7) -> CIFilter? {
        guard let filter = CIFilter(name: "CIDotScreen") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputCenter, forKey: "inputCenter")
        filter.setValue(inputAngle, forKey: "inputAngle")
        filter.setValue(inputWidth, forKey: "inputWidth")
        filter.setValue(inputSharpness, forKey: "inputSharpness")
        return filter
    }
    
    /// CIDroste
    /// - SeeAlso: [Reference/CIDroste](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIDroste)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputInsetPoint0:  defaultValue = [200 200].
    /// - parameter inputInsetPoint1:  defaultValue = [400 400].
    /// - parameter inputStrands:  defaultValue = 1.
    /// - parameter inputPeriodicity:  defaultValue = 1.
    /// - parameter inputRotation:  defaultValue = 0.
    /// - parameter inputZoom:  defaultValue = 1.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 9, *)
    static func droste(inputImage: CIImage, inputInsetPoint0: CIVector, inputInsetPoint1: CIVector, inputStrands: NSNumber = 1, inputPeriodicity: NSNumber = 1, inputRotation: NSNumber = 0, inputZoom: NSNumber = 1) -> CIFilter? {
        guard let filter = CIFilter(name: "CIDroste") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputInsetPoint0, forKey: "inputInsetPoint0")
        filter.setValue(inputInsetPoint1, forKey: "inputInsetPoint1")
        filter.setValue(inputStrands, forKey: "inputStrands")
        filter.setValue(inputPeriodicity, forKey: "inputPeriodicity")
        filter.setValue(inputRotation, forKey: "inputRotation")
        filter.setValue(inputZoom, forKey: "inputZoom")
        return filter
    }
    
    /// CIEdgePreserveUpsampleFilter
    /// - SeeAlso: [Reference/CIEdgePreserveUpsampleFilter](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIEdgePreserveUpsampleFilter)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputSmallImage:
    /// - parameter inputSpatialSigma:  defaultValue = 3.
    /// - parameter inputLumaSigma:  defaultValue = 0.15.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 10, *)
    static func edgePreserveUpsampleFilter(inputImage: CIImage, inputSmallImage: CIImage, inputSpatialSigma: NSNumber = 3, inputLumaSigma: NSNumber = 0.15) -> CIFilter? {
        guard let filter = CIFilter(name: "CIEdgePreserveUpsampleFilter") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputSmallImage, forKey: "inputSmallImage")
        filter.setValue(inputSpatialSigma, forKey: "inputSpatialSigma")
        filter.setValue(inputLumaSigma, forKey: "inputLumaSigma")
        return filter
    }
    
    /// CIEdges
    /// - SeeAlso: [Reference/CIEdges](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIEdges)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputIntensity: The intensity of the edges. The larger the value, the higher the intensity. defaultValue = 1.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 9, *)
    static func edges(inputImage: CIImage, inputIntensity: NSNumber = 1) -> CIFilter? {
        guard let filter = CIFilter(name: "CIEdges") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputIntensity, forKey: "inputIntensity")
        return filter
    }
    
    /// CIEdgeWork
    /// - SeeAlso: [Reference/CIEdgeWork](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIEdgeWork)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputRadius: The thickness of the edges. The larger the value, the thicker the edges. defaultValue = 3.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 9, *)
    static func edgeWork(inputImage: CIImage, inputRadius: NSNumber = 3) -> CIFilter? {
        guard let filter = CIFilter(name: "CIEdgeWork") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputRadius, forKey: "inputRadius")
        return filter
    }
    
    /// CIEightfoldReflectedTile
    /// - SeeAlso: [Reference/CIEightfoldReflectedTile](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIEightfoldReflectedTile)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputCenter: The x and y position to use as the center of the effect defaultValue = [150 150].
    /// - parameter inputAngle: The angle (in radians) of the tiled pattern. defaultValue = 0.
    /// - parameter inputWidth: The width of a tile. defaultValue = 100.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 6, *)
    static func eightfoldReflectedTile(inputImage: CIImage, inputCenter: CIVector, inputAngle: NSNumber = 0, inputWidth: NSNumber = 100) -> CIFilter? {
        guard let filter = CIFilter(name: "CIEightfoldReflectedTile") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputCenter, forKey: "inputCenter")
        filter.setValue(inputAngle, forKey: "inputAngle")
        filter.setValue(inputWidth, forKey: "inputWidth")
        return filter
    }
    
    /// CIExclusionBlendMode
    /// - SeeAlso: [Reference/CIExclusionBlendMode](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIExclusionBlendMode)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputBackgroundImage: The image to use as a background image.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 5, *)
    static func exclusionBlendMode(inputImage: CIImage, inputBackgroundImage: CIImage) -> CIFilter? {
        guard let filter = CIFilter(name: "CIExclusionBlendMode") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputBackgroundImage, forKey: "inputBackgroundImage")
        return filter
    }
    
    /// CIExposureAdjust
    /// - SeeAlso: [Reference/CIExposureAdjust](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIExposureAdjust)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputEV: The amount to adjust the exposure of the image by. The larger the value, the brighter the exposure. defaultValue = 0.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 5, *)
    static func exposureAdjust(inputImage: CIImage, inputEV: NSNumber = 0) -> CIFilter? {
        guard let filter = CIFilter(name: "CIExposureAdjust") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputEV, forKey: "inputEV")
        return filter
    }
    
    /// CIFalseColor
    /// - SeeAlso: [Reference/CIFalseColor](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIFalseColor)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputColor0: The first color to use for the color ramp. defaultValue = (0.3 0 0 1) <CGColorSpace 0x6040000ac8a0> (kCGColorSpaceDeviceRGB).
    /// - parameter inputColor1: The second color to use for the color ramp. defaultValue = (1 0.9 0.8 1) <CGColorSpace 0x6040000ac8a0> (kCGColorSpaceDeviceRGB).
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 5, *)
    static func falseColor(inputImage: CIImage, inputColor0: CIColor, inputColor1: CIColor) -> CIFilter? {
        guard let filter = CIFilter(name: "CIFalseColor") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputColor0, forKey: "inputColor0")
        filter.setValue(inputColor1, forKey: "inputColor1")
        return filter
    }
    
    /// CIFlashTransition
    /// - SeeAlso: [Reference/CIFlashTransition](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIFlashTransition)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputTargetImage: The target image for a transition.
    /// - parameter inputCenter: The x and y position to use as the center of the effect defaultValue = [150 150].
    /// - parameter inputExtent: The extent of the flash. defaultValue = [0 0 300 300].
    /// - parameter inputColor: The color of the light rays emanating from the flash. defaultValue = (1 0.8 0.6 1) <CGColorSpace 0x6040000ac8a0> (kCGColorSpaceDeviceRGB).
    /// - parameter inputTime: The parametric time of the transition. This value drives the transition from start (at time 0) to end (at time 1). defaultValue = 0.
    /// - parameter inputMaxStriationRadius: The radius of the light rays emanating from the flash. defaultValue = 2.58.
    /// - parameter inputStriationStrength: The strength of the light rays emanating from the flash. defaultValue = 0.5.
    /// - parameter inputStriationContrast: The contrast of the light rays emanating from the flash. defaultValue = 1.375.
    /// - parameter inputFadeThreshold: The amount of fade between the flash and the target image. The higher the value, the more flash time and the less fade time. defaultValue = 0.85.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 6, *)
    static func flashTransition(inputImage: CIImage, inputTargetImage: CIImage, inputCenter: CIVector, inputExtent: CIVector, inputColor: CIColor, inputTime: NSNumber = 0, inputMaxStriationRadius: NSNumber = 2.58, inputStriationStrength: NSNumber = 0.5, inputStriationContrast: NSNumber = 1.375, inputFadeThreshold: NSNumber = 0.85) -> CIFilter? {
        guard let filter = CIFilter(name: "CIFlashTransition") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputTargetImage, forKey: "inputTargetImage")
        filter.setValue(inputCenter, forKey: "inputCenter")
        filter.setValue(inputExtent, forKey: "inputExtent")
        filter.setValue(inputColor, forKey: "inputColor")
        filter.setValue(inputTime, forKey: "inputTime")
        filter.setValue(inputMaxStriationRadius, forKey: "inputMaxStriationRadius")
        filter.setValue(inputStriationStrength, forKey: "inputStriationStrength")
        filter.setValue(inputStriationContrast, forKey: "inputStriationContrast")
        filter.setValue(inputFadeThreshold, forKey: "inputFadeThreshold")
        return filter
    }
    
    /// CIFourfoldReflectedTile
    /// - SeeAlso: [Reference/CIFourfoldReflectedTile](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIFourfoldReflectedTile)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputCenter: The x and y position to use as the center of the effect defaultValue = [150 150].
    /// - parameter inputAngle: The angle (in radians) of the tiled pattern. defaultValue = 0.
    /// - parameter inputWidth: The width of a tile. defaultValue = 100.
    /// - parameter inputAcuteAngle: The primary angle for the repeating reflected tile. Small values create thin diamond tiles, and higher values create fatter reflected tiles. defaultValue = 1.570796326794897.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 6, *)
    static func fourfoldReflectedTile(inputImage: CIImage, inputCenter: CIVector, inputAngle: NSNumber = 0, inputWidth: NSNumber = 100, inputAcuteAngle: NSNumber = 1.570796326794897) -> CIFilter? {
        guard let filter = CIFilter(name: "CIFourfoldReflectedTile") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputCenter, forKey: "inputCenter")
        filter.setValue(inputAngle, forKey: "inputAngle")
        filter.setValue(inputWidth, forKey: "inputWidth")
        filter.setValue(inputAcuteAngle, forKey: "inputAcuteAngle")
        return filter
    }
    
    /// CIFourfoldRotatedTile
    /// - SeeAlso: [Reference/CIFourfoldRotatedTile](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIFourfoldRotatedTile)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputCenter: The x and y position to use as the center of the effect defaultValue = [150 150].
    /// - parameter inputAngle: The angle (in radians) of the tiled pattern. defaultValue = 0.
    /// - parameter inputWidth: The width of a tile. defaultValue = 100.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 6, *)
    static func fourfoldRotatedTile(inputImage: CIImage, inputCenter: CIVector, inputAngle: NSNumber = 0, inputWidth: NSNumber = 100) -> CIFilter? {
        guard let filter = CIFilter(name: "CIFourfoldRotatedTile") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputCenter, forKey: "inputCenter")
        filter.setValue(inputAngle, forKey: "inputAngle")
        filter.setValue(inputWidth, forKey: "inputWidth")
        return filter
    }
    
    /// CIFourfoldTranslatedTile
    /// - SeeAlso: [Reference/CIFourfoldTranslatedTile](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIFourfoldTranslatedTile)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputCenter: The x and y position to use as the center of the effect defaultValue = [150 150].
    /// - parameter inputAngle: The angle (in radians) of the tiled pattern. defaultValue = 0.
    /// - parameter inputWidth: The width of a tile. defaultValue = 100.
    /// - parameter inputAcuteAngle: The primary angle for the repeating translated tile. Small values create thin diamond tiles, and higher values create fatter translated tiles. defaultValue = 1.570796326794897.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 6, *)
    static func fourfoldTranslatedTile(inputImage: CIImage, inputCenter: CIVector, inputAngle: NSNumber = 0, inputWidth: NSNumber = 100, inputAcuteAngle: NSNumber = 1.570796326794897) -> CIFilter? {
        guard let filter = CIFilter(name: "CIFourfoldTranslatedTile") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputCenter, forKey: "inputCenter")
        filter.setValue(inputAngle, forKey: "inputAngle")
        filter.setValue(inputWidth, forKey: "inputWidth")
        filter.setValue(inputAcuteAngle, forKey: "inputAcuteAngle")
        return filter
    }
    
    /// CIGammaAdjust
    /// - SeeAlso: [Reference/CIGammaAdjust](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIGammaAdjust)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputPower: A gamma value to use to correct image brightness. The larger the value, the darker the result. defaultValue = 1.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 5, *)
    static func gammaAdjust(inputImage: CIImage, inputPower: NSNumber = 1) -> CIFilter? {
        guard let filter = CIFilter(name: "CIGammaAdjust") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputPower, forKey: "inputPower")
        return filter
    }
    
    /// CIGaussianBlur
    /// - SeeAlso: [Reference/CIGaussianBlur](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIGaussianBlur)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputRadius: The radius determines how many pixels are used to create the blur. The larger the radius, the blurrier the result. defaultValue = 10.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 6, *)
    static func gaussianBlur(inputImage: CIImage, inputRadius: NSNumber = 10) -> CIFilter? {
        guard let filter = CIFilter(name: "CIGaussianBlur") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputRadius, forKey: "inputRadius")
        return filter
    }
    
    /// CIGaussianGradient
    /// - SeeAlso: [Reference/CIGaussianGradient](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIGaussianGradient)
    ///
    /// - parameter inputCenter: The center of the effect as x and y coordinates. defaultValue = [150 150].
    /// - parameter inputColor0: The first color to use in the gradient. defaultValue = (1 1 1 1) <CGColorSpace 0x6040000ac8a0> (kCGColorSpaceDeviceRGB).
    /// - parameter inputColor1: The second color to use in the gradient. defaultValue = (0 0 0 0) <CGColorSpace 0x6040000ac8a0> (kCGColorSpaceDeviceRGB).
    /// - parameter inputRadius: The radius of the Gaussian distribution. defaultValue = 300.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 5, *)
    static func gaussianGradient(inputCenter: CIVector, inputColor0: CIColor, inputColor1: CIColor, inputRadius: NSNumber = 300) -> CIFilter? {
        guard let filter = CIFilter(name: "CIGaussianGradient") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputCenter, forKey: "inputCenter")
        filter.setValue(inputColor0, forKey: "inputColor0")
        filter.setValue(inputColor1, forKey: "inputColor1")
        filter.setValue(inputRadius, forKey: "inputRadius")
        return filter
    }
    
    /// CIGlassDistortion
    /// - SeeAlso: [Reference/CIGlassDistortion](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIGlassDistortion)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputTexture: A texture to apply to the source image.
    /// - parameter inputCenter: The center of the effect as x and y coordinates. defaultValue = [150 150].
    /// - parameter inputScale: The amount of texturing of the resulting image. The larger the value, the greater the texturing. defaultValue = 200.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 8, *)
    static func glassDistortion(inputImage: CIImage, inputTexture: CIImage, inputCenter: CIVector, inputScale: NSNumber = 200) -> CIFilter? {
        guard let filter = CIFilter(name: "CIGlassDistortion") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputTexture, forKey: "inputTexture")
        filter.setValue(inputCenter, forKey: "inputCenter")
        filter.setValue(inputScale, forKey: "inputScale")
        return filter
    }
    
    /// CIGlassLozenge
    /// - SeeAlso: [Reference/CIGlassLozenge](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIGlassLozenge)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputPoint0: The x and y position that defines the center of the circle at one end of the lozenge. defaultValue = [150 150].
    /// - parameter inputPoint1: The x and y position that defines the center of the circle at the other end of the lozenge. defaultValue = [350 150].
    /// - parameter inputRadius: The radius of the lozenge. The larger the radius, the wider the extent of the distortion. defaultValue = 100.
    /// - parameter inputRefraction: The refraction of the glass. defaultValue = 1.7.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 9, *)
    static func glassLozenge(inputImage: CIImage, inputPoint0: CIVector, inputPoint1: CIVector, inputRadius: NSNumber = 100, inputRefraction: NSNumber = 1.7) -> CIFilter? {
        guard let filter = CIFilter(name: "CIGlassLozenge") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputPoint0, forKey: "inputPoint0")
        filter.setValue(inputPoint1, forKey: "inputPoint1")
        filter.setValue(inputRadius, forKey: "inputRadius")
        filter.setValue(inputRefraction, forKey: "inputRefraction")
        return filter
    }
    
    /// CIGlideReflectedTile
    /// - SeeAlso: [Reference/CIGlideReflectedTile](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIGlideReflectedTile)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputCenter: The x and y position to use as the center of the effect defaultValue = [150 150].
    /// - parameter inputAngle: The angle (in radians) of the tiled pattern. defaultValue = 0.
    /// - parameter inputWidth: The width of a tile. defaultValue = 100.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 6, *)
    static func glideReflectedTile(inputImage: CIImage, inputCenter: CIVector, inputAngle: NSNumber = 0, inputWidth: NSNumber = 100) -> CIFilter? {
        guard let filter = CIFilter(name: "CIGlideReflectedTile") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputCenter, forKey: "inputCenter")
        filter.setValue(inputAngle, forKey: "inputAngle")
        filter.setValue(inputWidth, forKey: "inputWidth")
        return filter
    }
    
    /// CIGloom
    /// - SeeAlso: [Reference/CIGloom](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIGloom)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputRadius: The radius determines how many pixels are used to create the effect. The larger the radius, the greater the effect. defaultValue = 10.
    /// - parameter inputIntensity: The intensity of the effect. A value of 0.0 is no effect. A value of 1.0 is the maximum effect. defaultValue = 0.5.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 6, *)
    static func gloom(inputImage: CIImage, inputRadius: NSNumber = 10, inputIntensity: NSNumber = 0.5) -> CIFilter? {
        guard let filter = CIFilter(name: "CIGloom") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputRadius, forKey: "inputRadius")
        filter.setValue(inputIntensity, forKey: "inputIntensity")
        return filter
    }
    
    /// CIHardLightBlendMode
    /// - SeeAlso: [Reference/CIHardLightBlendMode](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIHardLightBlendMode)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputBackgroundImage: The image to use as a background image.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 5, *)
    static func hardLightBlendMode(inputImage: CIImage, inputBackgroundImage: CIImage) -> CIFilter? {
        guard let filter = CIFilter(name: "CIHardLightBlendMode") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputBackgroundImage, forKey: "inputBackgroundImage")
        return filter
    }
    
    /// CIHatchedScreen
    /// - SeeAlso: [Reference/CIHatchedScreen](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIHatchedScreen)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputCenter: The x and y position to use as the center of the hatched screen pattern defaultValue = [150 150].
    /// - parameter inputAngle: The angle of the pattern. defaultValue = 0.
    /// - parameter inputWidth: The distance between lines in the pattern. defaultValue = 6.
    /// - parameter inputSharpness: The amount of sharpening to apply. defaultValue = 0.7.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 6, *)
    static func hatchedScreen(inputImage: CIImage, inputCenter: CIVector, inputAngle: NSNumber = 0, inputWidth: NSNumber = 6, inputSharpness: NSNumber = 0.7) -> CIFilter? {
        guard let filter = CIFilter(name: "CIHatchedScreen") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputCenter, forKey: "inputCenter")
        filter.setValue(inputAngle, forKey: "inputAngle")
        filter.setValue(inputWidth, forKey: "inputWidth")
        filter.setValue(inputSharpness, forKey: "inputSharpness")
        return filter
    }
    
    /// CIHeightFieldFromMask
    /// - SeeAlso: [Reference/CIHeightFieldFromMask](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIHeightFieldFromMask)
    ///
    /// - parameter inputImage: The white values of the mask define those pixels that are inside the height field while the black values define those pixels that are outside. The field varies smoothly and continuously inside the mask, reaching the value 0 at the edge of the mask.
    /// - parameter inputRadius: The distance from the edge of the mask for the smooth transition is proportional to the input radius. Larger values make the transition smoother and more pronounced. Smaller values make the transition approximate a fillet radius. defaultValue = 10.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 9, *)
    static func heightFieldFromMask(inputImage: CIImage, inputRadius: NSNumber = 10) -> CIFilter? {
        guard let filter = CIFilter(name: "CIHeightFieldFromMask") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputRadius, forKey: "inputRadius")
        return filter
    }
    
    /// CIHexagonalPixellate
    /// - SeeAlso: [Reference/CIHexagonalPixellate](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIHexagonalPixellate)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputCenter: The x and y position to use as the center of the effect defaultValue = [150 150].
    /// - parameter inputScale: The scale determines the size of the hexagons. Larger values result in larger hexagons. defaultValue = 8.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 9, *)
    static func hexagonalPixellate(inputImage: CIImage, inputCenter: CIVector, inputScale: NSNumber = 8) -> CIFilter? {
        guard let filter = CIFilter(name: "CIHexagonalPixellate") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputCenter, forKey: "inputCenter")
        filter.setValue(inputScale, forKey: "inputScale")
        return filter
    }
    
    /// CIHighlightShadowAdjust
    /// - SeeAlso: [Reference/CIHighlightShadowAdjust](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIHighlightShadowAdjust)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputRadius: Shadow Highlight Radius defaultValue = 0.
    /// - parameter inputShadowAmount: The amount of adjustment to the shadows of the image. defaultValue = 0.
    /// - parameter inputHighlightAmount: The amount of adjustment to the highlights of the image. defaultValue = 1.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 5, *)
    static func highlightShadowAdjust(inputImage: CIImage, inputRadius: NSNumber = 0, inputShadowAmount: NSNumber = 0, inputHighlightAmount: NSNumber = 1) -> CIFilter? {
        guard let filter = CIFilter(name: "CIHighlightShadowAdjust") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputRadius, forKey: "inputRadius")
        filter.setValue(inputShadowAmount, forKey: "inputShadowAmount")
        filter.setValue(inputHighlightAmount, forKey: "inputHighlightAmount")
        return filter
    }
    
    /// CIHistogramDisplayFilter
    /// - SeeAlso: [Reference/CIHistogramDisplayFilter](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIHistogramDisplayFilter)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputHeight: The height of the displayable histogram image. defaultValue = 100.
    /// - parameter inputHighLimit: The fraction of the right portion of the histogram image to make lighter. defaultValue = 1.
    /// - parameter inputLowLimit: The fraction of the left portion of the histogram image to make darker defaultValue = 0.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 8, *)
    static func histogramDisplayFilter(inputImage: CIImage, inputHeight: NSNumber = 100, inputHighLimit: NSNumber = 1, inputLowLimit: NSNumber = 0) -> CIFilter? {
        guard let filter = CIFilter(name: "CIHistogramDisplayFilter") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputHeight, forKey: "inputHeight")
        filter.setValue(inputHighLimit, forKey: "inputHighLimit")
        filter.setValue(inputLowLimit, forKey: "inputLowLimit")
        return filter
    }
    
    /// CIHoleDistortion
    /// - SeeAlso: [Reference/CIHoleDistortion](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIHoleDistortion)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputCenter: The center of the effect as x and y coordinates. defaultValue = [150 150].
    /// - parameter inputRadius: The radius determines how many pixels are used to create the distortion. The larger the radius, the wider the extent of the distortion. defaultValue = 150.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 6, *)
    static func holeDistortion(inputImage: CIImage, inputCenter: CIVector, inputRadius: NSNumber = 150) -> CIFilter? {
        guard let filter = CIFilter(name: "CIHoleDistortion") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputCenter, forKey: "inputCenter")
        filter.setValue(inputRadius, forKey: "inputRadius")
        return filter
    }
    
    /// CIHueAdjust
    /// - SeeAlso: [Reference/CIHueAdjust](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIHueAdjust)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputAngle: An angle (in radians) to use to correct the hue of an image. defaultValue = 0.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 5, *)
    static func hueAdjust(inputImage: CIImage, inputAngle: NSNumber = 0) -> CIFilter? {
        guard let filter = CIFilter(name: "CIHueAdjust") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputAngle, forKey: "inputAngle")
        return filter
    }
    
    /// CIHueBlendMode
    /// - SeeAlso: [Reference/CIHueBlendMode](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIHueBlendMode)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputBackgroundImage: The image to use as a background image.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 5, *)
    static func hueBlendMode(inputImage: CIImage, inputBackgroundImage: CIImage) -> CIFilter? {
        guard let filter = CIFilter(name: "CIHueBlendMode") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputBackgroundImage, forKey: "inputBackgroundImage")
        return filter
    }
    
    /// CIHueSaturationValueGradient
    /// - SeeAlso: [Reference/CIHueSaturationValueGradient](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIHueSaturationValueGradient)
    ///
    /// - parameter inputValue:  defaultValue = 1.
    /// - parameter inputRadius: The distance from the center of the effect. defaultValue = 300.
    /// - parameter inputSoftness:  defaultValue = 1.
    /// - parameter inputDither:  defaultValue = 1.
    /// - parameter inputColorSpace: The CGColorSpaceRef that the color wheel should be generated in. defaultValue = <CGColorSpace 0x6040000ac960> (kCGColorSpaceICCBased; kCGColorSpaceModelRGB; sRGB IEC61966-2.1).
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 10, *)
    static func hueSaturationValueGradient(inputValue: NSNumber = 1, inputRadius: NSNumber = 300, inputSoftness: NSNumber = 1, inputDither: NSNumber = 1, inputColorSpace: NSObject) -> CIFilter? {
        guard let filter = CIFilter(name: "CIHueSaturationValueGradient") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputValue, forKey: "inputValue")
        filter.setValue(inputRadius, forKey: "inputRadius")
        filter.setValue(inputSoftness, forKey: "inputSoftness")
        filter.setValue(inputDither, forKey: "inputDither")
        filter.setValue(inputColorSpace, forKey: "inputColorSpace")
        return filter
    }
    
    /// CIKaleidoscope
    /// - SeeAlso: [Reference/CIKaleidoscope](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIKaleidoscope)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputCount: The number of reflections in the pattern. defaultValue = 6.
    /// - parameter inputCenter: The x and y position to use as the center of the effect defaultValue = [150 150].
    /// - parameter inputAngle: The angle of reflection. defaultValue = 0.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 9, *)
    static func kaleidoscope(inputImage: CIImage, inputCount: NSNumber = 6, inputCenter: CIVector, inputAngle: NSNumber = 0) -> CIFilter? {
        guard let filter = CIFilter(name: "CIKaleidoscope") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputCount, forKey: "inputCount")
        filter.setValue(inputCenter, forKey: "inputCenter")
        filter.setValue(inputAngle, forKey: "inputAngle")
        return filter
    }
    
    /// CILabDeltaE
    /// - SeeAlso: [Reference/CILabDeltaE](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CILabDeltaE)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputImage2:
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 11, *)
    static func labDeltaE(inputImage: CIImage, inputImage2: CIImage) -> CIFilter? {
        guard let filter = CIFilter(name: "CILabDeltaE") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputImage2, forKey: "inputImage2")
        return filter
    }
    
    /// CILanczosScaleTransform
    /// - SeeAlso: [Reference/CILanczosScaleTransform](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CILanczosScaleTransform)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputScale: The scaling factor to use on the image. Values less than 1.0 scale down the images. Values greater than 1.0 scale up the image. defaultValue = 1.
    /// - parameter inputAspectRatio: The additional horizontal scaling factor to use on the image. defaultValue = 1.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 6, *)
    static func lanczosScaleTransform(inputImage: CIImage, inputScale: NSNumber = 1, inputAspectRatio: NSNumber = 1) -> CIFilter? {
        guard let filter = CIFilter(name: "CILanczosScaleTransform") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputScale, forKey: "inputScale")
        filter.setValue(inputAspectRatio, forKey: "inputAspectRatio")
        return filter
    }
    
    /// CILenticularHaloGenerator
    /// - SeeAlso: [Reference/CILenticularHaloGenerator](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CILenticularHaloGenerator)
    ///
    /// - parameter inputCenter: The x and y position to use as the center of the halo. defaultValue = [150 150].
    /// - parameter inputColor: A color. defaultValue = (1 0.9 0.8 1) <CGColorSpace 0x6040000ac8a0> (kCGColorSpaceDeviceRGB).
    /// - parameter inputHaloRadius: The radius of the halo. defaultValue = 70.
    /// - parameter inputHaloWidth: The width of the halo, from its inner radius to its outer radius. defaultValue = 87.
    /// - parameter inputHaloOverlap:  defaultValue = 0.77.
    /// - parameter inputStriationStrength: The intensity of the halo colors. Larger values are more intense. defaultValue = 0.5.
    /// - parameter inputStriationContrast: The contrast of the halo colors. Larger values are higher contrast. defaultValue = 1.
    /// - parameter inputTime: The duration of the effect. defaultValue = 0.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 9, *)
    static func lenticularHaloGenerator(inputCenter: CIVector, inputColor: CIColor, inputHaloRadius: NSNumber = 70, inputHaloWidth: NSNumber = 87, inputHaloOverlap: NSNumber = 0.77, inputStriationStrength: NSNumber = 0.5, inputStriationContrast: NSNumber = 1, inputTime: NSNumber = 0) -> CIFilter? {
        guard let filter = CIFilter(name: "CILenticularHaloGenerator") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputCenter, forKey: "inputCenter")
        filter.setValue(inputColor, forKey: "inputColor")
        filter.setValue(inputHaloRadius, forKey: "inputHaloRadius")
        filter.setValue(inputHaloWidth, forKey: "inputHaloWidth")
        filter.setValue(inputHaloOverlap, forKey: "inputHaloOverlap")
        filter.setValue(inputStriationStrength, forKey: "inputStriationStrength")
        filter.setValue(inputStriationContrast, forKey: "inputStriationContrast")
        filter.setValue(inputTime, forKey: "inputTime")
        return filter
    }
    
    /// CILightenBlendMode
    /// - SeeAlso: [Reference/CILightenBlendMode](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CILightenBlendMode)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputBackgroundImage: The image to use as a background image.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 5, *)
    static func lightenBlendMode(inputImage: CIImage, inputBackgroundImage: CIImage) -> CIFilter? {
        guard let filter = CIFilter(name: "CILightenBlendMode") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputBackgroundImage, forKey: "inputBackgroundImage")
        return filter
    }
    
    /// CILightTunnel
    /// - SeeAlso: [Reference/CILightTunnel](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CILightTunnel)
    ///
    /// - parameter inputImage: The image to process.
    /// - parameter inputCenter: Center of the light tunnel. defaultValue = [150 150].
    /// - parameter inputRotation: Rotation angle of the light tunnel. defaultValue = 0.
    /// - parameter inputRadius: Center radius of the light tunnel. defaultValue = 100.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 6, *)
    static func lightTunnel(inputImage: CIImage, inputCenter: CIVector, inputRotation: NSNumber = 0, inputRadius: NSNumber = 100) -> CIFilter? {
        guard let filter = CIFilter(name: "CILightTunnel") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputCenter, forKey: "inputCenter")
        filter.setValue(inputRotation, forKey: "inputRotation")
        filter.setValue(inputRadius, forKey: "inputRadius")
        return filter
    }
    
    /// CILinearBurnBlendMode
    /// - SeeAlso: [Reference/CILinearBurnBlendMode](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CILinearBurnBlendMode)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputBackgroundImage: The image to use as a background image.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 8, *)
    static func linearBurnBlendMode(inputImage: CIImage, inputBackgroundImage: CIImage) -> CIFilter? {
        guard let filter = CIFilter(name: "CILinearBurnBlendMode") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputBackgroundImage, forKey: "inputBackgroundImage")
        return filter
    }
    
    /// CILinearDodgeBlendMode
    /// - SeeAlso: [Reference/CILinearDodgeBlendMode](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CILinearDodgeBlendMode)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputBackgroundImage: The image to use as a background image.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 8, *)
    static func linearDodgeBlendMode(inputImage: CIImage, inputBackgroundImage: CIImage) -> CIFilter? {
        guard let filter = CIFilter(name: "CILinearDodgeBlendMode") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputBackgroundImage, forKey: "inputBackgroundImage")
        return filter
    }
    
    /// CILinearGradient
    /// - SeeAlso: [Reference/CILinearGradient](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CILinearGradient)
    ///
    /// - parameter inputPoint0: The starting position of the gradient -- where the first color begins. defaultValue = [0 0].
    /// - parameter inputPoint1: The ending position of the gradient -- where the second color begins. defaultValue = [200 200].
    /// - parameter inputColor0: The first color to use in the gradient. defaultValue = (1 1 1 1) <CGColorSpace 0x6040000ac8a0> (kCGColorSpaceDeviceRGB).
    /// - parameter inputColor1: The second color to use in the gradient. defaultValue = (0 0 0 1) <CGColorSpace 0x6040000ac8a0> (kCGColorSpaceDeviceRGB).
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 5, *)
    static func linearGradient(inputPoint0: CIVector, inputPoint1: CIVector, inputColor0: CIColor, inputColor1: CIColor) -> CIFilter? {
        guard let filter = CIFilter(name: "CILinearGradient") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputPoint0, forKey: "inputPoint0")
        filter.setValue(inputPoint1, forKey: "inputPoint1")
        filter.setValue(inputColor0, forKey: "inputColor0")
        filter.setValue(inputColor1, forKey: "inputColor1")
        return filter
    }
    
    /// CILinearToSRGBToneCurve
    /// - SeeAlso: [Reference/CILinearToSRGBToneCurve](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CILinearToSRGBToneCurve)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 7, *)
    static func linearToSRGBToneCurve(inputImage: CIImage) -> CIFilter? {
        guard let filter = CIFilter(name: "CILinearToSRGBToneCurve") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        return filter
    }
    
    /// CILineOverlay
    /// - SeeAlso: [Reference/CILineOverlay](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CILineOverlay)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputNRNoiseLevel: The noise level of the image (used with camera data) that gets removed before tracing the edges of the image. Increasing the noise level helps to clean up the traced edges of the image. defaultValue = 0.07000000000000001.
    /// - parameter inputNRSharpness: The amount of sharpening done when removing noise in the image before tracing the edges of the image. This improves the edge acquisition. defaultValue = 0.71.
    /// - parameter inputEdgeIntensity: The accentuation factor of the Sobel gradient information when tracing the edges of the image. Higher values find more edges, although typically a low value (such as 1.0) is used. defaultValue = 1.
    /// - parameter inputThreshold: This value determines edge visibility. Larger values thin out the edges. defaultValue = 0.1.
    /// - parameter inputContrast: The amount of anti-aliasing to use on the edges produced by this filter. Higher values produce higher contrast edges (they are less anti-aliased). defaultValue = 50.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 9, *)
    static func lineOverlay(inputImage: CIImage, inputNRNoiseLevel: NSNumber = 0.07000000000000001, inputNRSharpness: NSNumber = 0.71, inputEdgeIntensity: NSNumber = 1, inputThreshold: NSNumber = 0.1, inputContrast: NSNumber = 50) -> CIFilter? {
        guard let filter = CIFilter(name: "CILineOverlay") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputNRNoiseLevel, forKey: "inputNRNoiseLevel")
        filter.setValue(inputNRSharpness, forKey: "inputNRSharpness")
        filter.setValue(inputEdgeIntensity, forKey: "inputEdgeIntensity")
        filter.setValue(inputThreshold, forKey: "inputThreshold")
        filter.setValue(inputContrast, forKey: "inputContrast")
        return filter
    }
    
    /// CILineScreen
    /// - SeeAlso: [Reference/CILineScreen](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CILineScreen)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputCenter: The x and y position to use as the center of the line screen pattern defaultValue = [150 150].
    /// - parameter inputAngle: The angle of the pattern. defaultValue = 0.
    /// - parameter inputWidth: The distance between lines in the pattern. defaultValue = 6.
    /// - parameter inputSharpness: The sharpness of the pattern. The larger the value, the sharper the pattern. defaultValue = 0.7.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 6, *)
    static func lineScreen(inputImage: CIImage, inputCenter: CIVector, inputAngle: NSNumber = 0, inputWidth: NSNumber = 6, inputSharpness: NSNumber = 0.7) -> CIFilter? {
        guard let filter = CIFilter(name: "CILineScreen") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputCenter, forKey: "inputCenter")
        filter.setValue(inputAngle, forKey: "inputAngle")
        filter.setValue(inputWidth, forKey: "inputWidth")
        filter.setValue(inputSharpness, forKey: "inputSharpness")
        return filter
    }
    
    /// CILuminosityBlendMode
    /// - SeeAlso: [Reference/CILuminosityBlendMode](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CILuminosityBlendMode)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputBackgroundImage: The image to use as a background image.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 5, *)
    static func luminosityBlendMode(inputImage: CIImage, inputBackgroundImage: CIImage) -> CIFilter? {
        guard let filter = CIFilter(name: "CILuminosityBlendMode") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputBackgroundImage, forKey: "inputBackgroundImage")
        return filter
    }
    
    /// CIMaskedVariableBlur
    /// - SeeAlso: [Reference/CIMaskedVariableBlur](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIMaskedVariableBlur)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputMask:
    /// - parameter inputRadius: The distance from the center of the effect. defaultValue = 5.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 8, *)
    static func maskedVariableBlur(inputImage: CIImage, inputMask: CIImage, inputRadius: NSNumber = 5) -> CIFilter? {
        guard let filter = CIFilter(name: "CIMaskedVariableBlur") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputMask, forKey: "inputMask")
        filter.setValue(inputRadius, forKey: "inputRadius")
        return filter
    }
    
    /// CIMaskToAlpha
    /// - SeeAlso: [Reference/CIMaskToAlpha](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIMaskToAlpha)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 6, *)
    static func maskToAlpha(inputImage: CIImage) -> CIFilter? {
        guard let filter = CIFilter(name: "CIMaskToAlpha") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        return filter
    }
    
    /// CIMaximumComponent
    /// - SeeAlso: [Reference/CIMaximumComponent](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIMaximumComponent)
    ///
    /// - parameter inputImage: The image to process.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 6, *)
    static func maximumComponent(inputImage: CIImage) -> CIFilter? {
        guard let filter = CIFilter(name: "CIMaximumComponent") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        return filter
    }
    
    /// CIMaximumCompositing
    /// - SeeAlso: [Reference/CIMaximumCompositing](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIMaximumCompositing)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputBackgroundImage: The image to use as a background image.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 5, *)
    static func maximumCompositing(inputImage: CIImage, inputBackgroundImage: CIImage) -> CIFilter? {
        guard let filter = CIFilter(name: "CIMaximumCompositing") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputBackgroundImage, forKey: "inputBackgroundImage")
        return filter
    }
    
    /// CIMedianFilter
    /// - SeeAlso: [Reference/CIMedianFilter](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIMedianFilter)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 9, *)
    static func medianFilter(inputImage: CIImage) -> CIFilter? {
        guard let filter = CIFilter(name: "CIMedianFilter") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        return filter
    }
    
    /// CIMinimumComponent
    /// - SeeAlso: [Reference/CIMinimumComponent](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIMinimumComponent)
    ///
    /// - parameter inputImage: The image to process.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 6, *)
    static func minimumComponent(inputImage: CIImage) -> CIFilter? {
        guard let filter = CIFilter(name: "CIMinimumComponent") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        return filter
    }
    
    /// CIMinimumCompositing
    /// - SeeAlso: [Reference/CIMinimumCompositing](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIMinimumCompositing)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputBackgroundImage: The image to use as a background image.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 5, *)
    static func minimumCompositing(inputImage: CIImage, inputBackgroundImage: CIImage) -> CIFilter? {
        guard let filter = CIFilter(name: "CIMinimumCompositing") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputBackgroundImage, forKey: "inputBackgroundImage")
        return filter
    }
    
    /// CIModTransition
    /// - SeeAlso: [Reference/CIModTransition](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIModTransition)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputTargetImage: The target image for a transition.
    /// - parameter inputCenter: The x and y position to use as the center of the effect defaultValue = [150 150].
    /// - parameter inputTime: The parametric time of the transition. This value drives the transition from start (at time 0) to end (at time 1). defaultValue = 0.
    /// - parameter inputAngle: The angle of the mod hole pattern. defaultValue = 2.
    /// - parameter inputRadius: The radius of the undistorted holes in the pattern. defaultValue = 150.
    /// - parameter inputCompression: The amount of stretching applied to the mod hole pattern. Holes in the center are not distorted as much as those at the edge of the image. defaultValue = 300.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 6, *)
    static func modTransition(inputImage: CIImage, inputTargetImage: CIImage, inputCenter: CIVector, inputTime: NSNumber = 0, inputAngle: NSNumber = 2, inputRadius: NSNumber = 150, inputCompression: NSNumber = 300) -> CIFilter? {
        guard let filter = CIFilter(name: "CIModTransition") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputTargetImage, forKey: "inputTargetImage")
        filter.setValue(inputCenter, forKey: "inputCenter")
        filter.setValue(inputTime, forKey: "inputTime")
        filter.setValue(inputAngle, forKey: "inputAngle")
        filter.setValue(inputRadius, forKey: "inputRadius")
        filter.setValue(inputCompression, forKey: "inputCompression")
        return filter
    }
    
    /// CIMorphologyGradient
    /// - SeeAlso: [Reference/CIMorphologyGradient](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIMorphologyGradient)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputRadius: The desired radius of the circular morphological operation to the image. defaultValue = 5.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 11, *)
    static func morphologyGradient(inputImage: CIImage, inputRadius: NSNumber = 5) -> CIFilter? {
        guard let filter = CIFilter(name: "CIMorphologyGradient") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputRadius, forKey: "inputRadius")
        return filter
    }
    
    /// CIMorphologyMaximum
    /// - SeeAlso: [Reference/CIMorphologyMaximum](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIMorphologyMaximum)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputRadius: The desired radius of the circular morphological operation to the image. defaultValue = 0.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 11, *)
    static func morphologyMaximum(inputImage: CIImage, inputRadius: NSNumber = 0) -> CIFilter? {
        guard let filter = CIFilter(name: "CIMorphologyMaximum") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputRadius, forKey: "inputRadius")
        return filter
    }
    
    /// CIMorphologyMinimum
    /// - SeeAlso: [Reference/CIMorphologyMinimum](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIMorphologyMinimum)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputRadius: The desired radius of the circular morphological operation to the image. defaultValue = 0.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 11, *)
    static func morphologyMinimum(inputImage: CIImage, inputRadius: NSNumber = 0) -> CIFilter? {
        guard let filter = CIFilter(name: "CIMorphologyMinimum") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputRadius, forKey: "inputRadius")
        return filter
    }
    
    /// CIMotionBlur
    /// - SeeAlso: [Reference/CIMotionBlur](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIMotionBlur)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputRadius: The radius determines how many pixels are used to create the blur. The larger the radius, the blurrier the result. defaultValue = 20.
    /// - parameter inputAngle: The angle of the motion determines which direction the blur smears. defaultValue = 0.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 8.3, *)
    static func motionBlur(inputImage: CIImage, inputRadius: NSNumber = 20, inputAngle: NSNumber = 0) -> CIFilter? {
        guard let filter = CIFilter(name: "CIMotionBlur") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputRadius, forKey: "inputRadius")
        filter.setValue(inputAngle, forKey: "inputAngle")
        return filter
    }
    
    /// CIMultiplyBlendMode
    /// - SeeAlso: [Reference/CIMultiplyBlendMode](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIMultiplyBlendMode)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputBackgroundImage: The image to use as a background image.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 5, *)
    static func multiplyBlendMode(inputImage: CIImage, inputBackgroundImage: CIImage) -> CIFilter? {
        guard let filter = CIFilter(name: "CIMultiplyBlendMode") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputBackgroundImage, forKey: "inputBackgroundImage")
        return filter
    }
    
    /// CIMultiplyCompositing
    /// - SeeAlso: [Reference/CIMultiplyCompositing](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIMultiplyCompositing)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputBackgroundImage: The image to use as a background image.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 5, *)
    static func multiplyCompositing(inputImage: CIImage, inputBackgroundImage: CIImage) -> CIFilter? {
        guard let filter = CIFilter(name: "CIMultiplyCompositing") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputBackgroundImage, forKey: "inputBackgroundImage")
        return filter
    }
    
    /// CINinePartStretched
    /// - SeeAlso: [Reference/CINinePartStretched](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CINinePartStretched)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputBreakpoint0: Lower left corner of image to retain before stretching begins. defaultValue = [50 50].
    /// - parameter inputBreakpoint1: Upper right corner of image to retain after stretching ends. defaultValue = [150 150].
    /// - parameter inputGrowAmount:  defaultValue = [100 100].
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 10, *)
    static func ninePartStretched(inputImage: CIImage, inputBreakpoint0: CIVector, inputBreakpoint1: CIVector, inputGrowAmount: CIVector) -> CIFilter? {
        guard let filter = CIFilter(name: "CINinePartStretched") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputBreakpoint0, forKey: "inputBreakpoint0")
        filter.setValue(inputBreakpoint1, forKey: "inputBreakpoint1")
        filter.setValue(inputGrowAmount, forKey: "inputGrowAmount")
        return filter
    }
    
    /// CINinePartTiled
    /// - SeeAlso: [Reference/CINinePartTiled](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CINinePartTiled)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputBreakpoint0: Lower left corner of image to retain before tiling begins. defaultValue = [50 50].
    /// - parameter inputBreakpoint1: Upper right corner of image to retain after tiling ends. defaultValue = [150 150].
    /// - parameter inputGrowAmount:  defaultValue = [100 100].
    /// - parameter inputFlipYTiles: Indicates that Y-Axis flip should occur. defaultValue = 1.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 10, *)
    static func ninePartTiled(inputImage: CIImage, inputBreakpoint0: CIVector, inputBreakpoint1: CIVector, inputGrowAmount: CIVector, inputFlipYTiles: NSNumber = 1) -> CIFilter? {
        guard let filter = CIFilter(name: "CINinePartTiled") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputBreakpoint0, forKey: "inputBreakpoint0")
        filter.setValue(inputBreakpoint1, forKey: "inputBreakpoint1")
        filter.setValue(inputGrowAmount, forKey: "inputGrowAmount")
        filter.setValue(inputFlipYTiles, forKey: "inputFlipYTiles")
        return filter
    }
    
    /// CINoiseReduction
    /// - SeeAlso: [Reference/CINoiseReduction](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CINoiseReduction)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputNoiseLevel: The amount of noise reduction. The larger the value, the more noise reduction. defaultValue = 0.02.
    /// - parameter inputSharpness: The sharpness of the final image. The larger the value, the sharper the result. defaultValue = 0.4.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 9, *)
    static func noiseReduction(inputImage: CIImage, inputNoiseLevel: NSNumber = 0.02, inputSharpness: NSNumber = 0.4) -> CIFilter? {
        guard let filter = CIFilter(name: "CINoiseReduction") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputNoiseLevel, forKey: "inputNoiseLevel")
        filter.setValue(inputSharpness, forKey: "inputSharpness")
        return filter
    }
    
    /// CIOpTile
    /// - SeeAlso: [Reference/CIOpTile](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIOpTile)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputCenter: The x and y position to use as the center of the effect defaultValue = [150 150].
    /// - parameter inputScale: The scale determines the number of tiles in the effect. defaultValue = 2.8.
    /// - parameter inputAngle: The angle of a tile. defaultValue = 0.
    /// - parameter inputWidth: The width of a tile. defaultValue = 65.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 9, *)
    static func opTile(inputImage: CIImage, inputCenter: CIVector, inputScale: NSNumber = 2.8, inputAngle: NSNumber = 0, inputWidth: NSNumber = 65) -> CIFilter? {
        guard let filter = CIFilter(name: "CIOpTile") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputCenter, forKey: "inputCenter")
        filter.setValue(inputScale, forKey: "inputScale")
        filter.setValue(inputAngle, forKey: "inputAngle")
        filter.setValue(inputWidth, forKey: "inputWidth")
        return filter
    }
    
    /// CIOverlayBlendMode
    /// - SeeAlso: [Reference/CIOverlayBlendMode](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIOverlayBlendMode)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputBackgroundImage: The image to use as a background image.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 5, *)
    static func overlayBlendMode(inputImage: CIImage, inputBackgroundImage: CIImage) -> CIFilter? {
        guard let filter = CIFilter(name: "CIOverlayBlendMode") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputBackgroundImage, forKey: "inputBackgroundImage")
        return filter
    }
    
    /// CIPageCurlTransition
    /// - SeeAlso: [Reference/CIPageCurlTransition](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIPageCurlTransition)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputTargetImage: The target image for a transition.
    /// - parameter inputBacksideImage: The image that appears on the back of the source image, as the page curls to reveal the target image.
    /// - parameter inputShadingImage: An image that looks like a shaded sphere enclosed in a square image.
    /// - parameter inputExtent: The extent of the effect. defaultValue = [0 0 300 300].
    /// - parameter inputTime: The parametric time of the transition. This value drives the transition from start (at time 0) to end (at time 1). defaultValue = 0.
    /// - parameter inputAngle: The angle of the curling page. defaultValue = 0.
    /// - parameter inputRadius: The radius of the curl. defaultValue = 100.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 9, *)
    static func pageCurlTransition(inputImage: CIImage, inputTargetImage: CIImage, inputBacksideImage: CIImage, inputShadingImage: CIImage, inputExtent: CIVector, inputTime: NSNumber = 0, inputAngle: NSNumber = 0, inputRadius: NSNumber = 100) -> CIFilter? {
        guard let filter = CIFilter(name: "CIPageCurlTransition") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputTargetImage, forKey: "inputTargetImage")
        filter.setValue(inputBacksideImage, forKey: "inputBacksideImage")
        filter.setValue(inputShadingImage, forKey: "inputShadingImage")
        filter.setValue(inputExtent, forKey: "inputExtent")
        filter.setValue(inputTime, forKey: "inputTime")
        filter.setValue(inputAngle, forKey: "inputAngle")
        filter.setValue(inputRadius, forKey: "inputRadius")
        return filter
    }
    
    /// CIPageCurlWithShadowTransition
    /// - SeeAlso: [Reference/CIPageCurlWithShadowTransition](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIPageCurlWithShadowTransition)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputTargetImage: The target image for a transition.
    /// - parameter inputBacksideImage: The image that appears on the back of the source image, as the page curls to reveal the target image.
    /// - parameter inputExtent: The extent of the effect. defaultValue = [0 0 0 0].
    /// - parameter inputTime: The parametric time of the transition. This value drives the transition from start (at time 0) to end (at time 1). defaultValue = 0.
    /// - parameter inputAngle: The angle of the curling page. defaultValue = 0.
    /// - parameter inputRadius: The radius of the curl. defaultValue = 100.
    /// - parameter inputShadowSize:  defaultValue = 0.5.
    /// - parameter inputShadowAmount:  defaultValue = 0.7.
    /// - parameter inputShadowExtent:  defaultValue = [0 0 0 0].
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 9, *)
    static func pageCurlWithShadowTransition(inputImage: CIImage, inputTargetImage: CIImage, inputBacksideImage: CIImage, inputExtent: CIVector, inputTime: NSNumber = 0, inputAngle: NSNumber = 0, inputRadius: NSNumber = 100, inputShadowSize: NSNumber = 0.5, inputShadowAmount: NSNumber = 0.7, inputShadowExtent: CIVector) -> CIFilter? {
        guard let filter = CIFilter(name: "CIPageCurlWithShadowTransition") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputTargetImage, forKey: "inputTargetImage")
        filter.setValue(inputBacksideImage, forKey: "inputBacksideImage")
        filter.setValue(inputExtent, forKey: "inputExtent")
        filter.setValue(inputTime, forKey: "inputTime")
        filter.setValue(inputAngle, forKey: "inputAngle")
        filter.setValue(inputRadius, forKey: "inputRadius")
        filter.setValue(inputShadowSize, forKey: "inputShadowSize")
        filter.setValue(inputShadowAmount, forKey: "inputShadowAmount")
        filter.setValue(inputShadowExtent, forKey: "inputShadowExtent")
        return filter
    }
    
    /// CIParallelogramTile
    /// - SeeAlso: [Reference/CIParallelogramTile](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIParallelogramTile)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputCenter: The x and y position to use as the center of the effect defaultValue = [150 150].
    /// - parameter inputAngle: The angle (in radians) of the tiled pattern. defaultValue = 0.
    /// - parameter inputAcuteAngle: The primary angle for the repeating parallelogram tile. Small values create thin diamond tiles, and higher values create fatter parallelogram tiles. defaultValue = 1.570796326794897.
    /// - parameter inputWidth: The width of a tile. defaultValue = 100.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 9, *)
    static func parallelogramTile(inputImage: CIImage, inputCenter: CIVector, inputAngle: NSNumber = 0, inputAcuteAngle: NSNumber = 1.570796326794897, inputWidth: NSNumber = 100) -> CIFilter? {
        guard let filter = CIFilter(name: "CIParallelogramTile") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputCenter, forKey: "inputCenter")
        filter.setValue(inputAngle, forKey: "inputAngle")
        filter.setValue(inputAcuteAngle, forKey: "inputAcuteAngle")
        filter.setValue(inputWidth, forKey: "inputWidth")
        return filter
    }
    
    /// CIPDF417BarcodeGenerator
    /// - SeeAlso: [Reference/CIPDF417BarcodeGenerator](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIPDF417BarcodeGenerator)
    ///
    /// - parameter inputMessage:
    /// - parameter inputMinWidth:
    /// - parameter inputMaxWidth:
    /// - parameter inputMinHeight:
    /// - parameter inputMaxHeight:
    /// - parameter inputDataColumns:
    /// - parameter inputRows:
    /// - parameter inputPreferredAspectRatio:
    /// - parameter inputCompactionMode:
    /// - parameter inputCompactStyle:
    /// - parameter inputCorrectionLevel:
    /// - parameter inputAlwaysSpecifyCompaction:
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage", "outputCGImage"])
    @available(iOS 9, *)
    static func pDF417BarcodeGenerator(inputMessage: NSData, inputMinWidth: NSNumber, inputMaxWidth: NSNumber, inputMinHeight: NSNumber, inputMaxHeight: NSNumber, inputDataColumns: NSNumber, inputRows: NSNumber, inputPreferredAspectRatio: NSNumber, inputCompactionMode: NSNumber, inputCompactStyle: NSNumber, inputCorrectionLevel: NSNumber, inputAlwaysSpecifyCompaction: NSNumber) -> CIFilter? {
        guard let filter = CIFilter(name: "CIPDF417BarcodeGenerator") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputMessage, forKey: "inputMessage")
        filter.setValue(inputMinWidth, forKey: "inputMinWidth")
        filter.setValue(inputMaxWidth, forKey: "inputMaxWidth")
        filter.setValue(inputMinHeight, forKey: "inputMinHeight")
        filter.setValue(inputMaxHeight, forKey: "inputMaxHeight")
        filter.setValue(inputDataColumns, forKey: "inputDataColumns")
        filter.setValue(inputRows, forKey: "inputRows")
        filter.setValue(inputPreferredAspectRatio, forKey: "inputPreferredAspectRatio")
        filter.setValue(inputCompactionMode, forKey: "inputCompactionMode")
        filter.setValue(inputCompactStyle, forKey: "inputCompactStyle")
        filter.setValue(inputCorrectionLevel, forKey: "inputCorrectionLevel")
        filter.setValue(inputAlwaysSpecifyCompaction, forKey: "inputAlwaysSpecifyCompaction")
        return filter
    }
    
    /// CIPerspectiveCorrection
    /// - SeeAlso: [Reference/CIPerspectiveCorrection](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIPerspectiveCorrection)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputTopLeft: The top left coordinate to be perspective corrected. defaultValue = [118 484].
    /// - parameter inputTopRight: The top right coordinate to be perspective corrected. defaultValue = [646 507].
    /// - parameter inputBottomRight: The bottom right coordinate to be perspective corrected. defaultValue = [548 140].
    /// - parameter inputBottomLeft: The bottom left coordinate to be perspective corrected. defaultValue = [155 153].
    /// - parameter inputCrop:  defaultValue = 1.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 8, *)
    static func perspectiveCorrection(inputImage: CIImage, inputTopLeft: CIVector, inputTopRight: CIVector, inputBottomRight: CIVector, inputBottomLeft: CIVector, inputCrop: NSNumber = 1) -> CIFilter? {
        guard let filter = CIFilter(name: "CIPerspectiveCorrection") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputTopLeft, forKey: "inputTopLeft")
        filter.setValue(inputTopRight, forKey: "inputTopRight")
        filter.setValue(inputBottomRight, forKey: "inputBottomRight")
        filter.setValue(inputBottomLeft, forKey: "inputBottomLeft")
        filter.setValue(inputCrop, forKey: "inputCrop")
        return filter
    }
    
    /// CIPerspectiveTile
    /// - SeeAlso: [Reference/CIPerspectiveTile](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIPerspectiveTile)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputTopLeft: The top left coordinate of a tile. defaultValue = [118 484].
    /// - parameter inputTopRight: The top right coordinate of a tile. defaultValue = [646 507].
    /// - parameter inputBottomRight: The bottom right coordinate of a tile. defaultValue = [548 140].
    /// - parameter inputBottomLeft: The bottom left coordinate of a tile. defaultValue = [155 153].
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 6, *)
    static func perspectiveTile(inputImage: CIImage, inputTopLeft: CIVector, inputTopRight: CIVector, inputBottomRight: CIVector, inputBottomLeft: CIVector) -> CIFilter? {
        guard let filter = CIFilter(name: "CIPerspectiveTile") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputTopLeft, forKey: "inputTopLeft")
        filter.setValue(inputTopRight, forKey: "inputTopRight")
        filter.setValue(inputBottomRight, forKey: "inputBottomRight")
        filter.setValue(inputBottomLeft, forKey: "inputBottomLeft")
        return filter
    }
    
    /// CIPerspectiveTransform
    /// - SeeAlso: [Reference/CIPerspectiveTransform](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIPerspectiveTransform)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputTopLeft: The top left coordinate to map the image to. defaultValue = [118 484].
    /// - parameter inputTopRight: The top right coordinate to map the image to. defaultValue = [646 507].
    /// - parameter inputBottomRight: The bottom right coordinate to map the image to. defaultValue = [548 140].
    /// - parameter inputBottomLeft: The bottom left coordinate to map the image to. defaultValue = [155 153].
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 6, *)
    static func perspectiveTransform(inputImage: CIImage, inputTopLeft: CIVector, inputTopRight: CIVector, inputBottomRight: CIVector, inputBottomLeft: CIVector) -> CIFilter? {
        guard let filter = CIFilter(name: "CIPerspectiveTransform") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputTopLeft, forKey: "inputTopLeft")
        filter.setValue(inputTopRight, forKey: "inputTopRight")
        filter.setValue(inputBottomRight, forKey: "inputBottomRight")
        filter.setValue(inputBottomLeft, forKey: "inputBottomLeft")
        return filter
    }
    
    /// CIPerspectiveTransformWithExtent
    /// - SeeAlso: [Reference/CIPerspectiveTransformWithExtent](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIPerspectiveTransformWithExtent)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputExtent: A rectangle that defines the extent of the effect. defaultValue = [0 0 300 300].
    /// - parameter inputTopLeft:  defaultValue = [118 484].
    /// - parameter inputTopRight:  defaultValue = [646 507].
    /// - parameter inputBottomRight:  defaultValue = [548 140].
    /// - parameter inputBottomLeft:  defaultValue = [155 153].
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 6, *)
    static func perspectiveTransformWithExtent(inputImage: CIImage, inputExtent: CIVector, inputTopLeft: CIVector, inputTopRight: CIVector, inputBottomRight: CIVector, inputBottomLeft: CIVector) -> CIFilter? {
        guard let filter = CIFilter(name: "CIPerspectiveTransformWithExtent") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputExtent, forKey: "inputExtent")
        filter.setValue(inputTopLeft, forKey: "inputTopLeft")
        filter.setValue(inputTopRight, forKey: "inputTopRight")
        filter.setValue(inputBottomRight, forKey: "inputBottomRight")
        filter.setValue(inputBottomLeft, forKey: "inputBottomLeft")
        return filter
    }
    
    /// CIPhotoEffectChrome
    /// - SeeAlso: [Reference/CIPhotoEffectChrome](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIPhotoEffectChrome)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 7, *)
    static func photoEffectChrome(inputImage: CIImage) -> CIFilter? {
        guard let filter = CIFilter(name: "CIPhotoEffectChrome") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        return filter
    }
    
    /// CIPhotoEffectFade
    /// - SeeAlso: [Reference/CIPhotoEffectFade](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIPhotoEffectFade)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 7, *)
    static func photoEffectFade(inputImage: CIImage) -> CIFilter? {
        guard let filter = CIFilter(name: "CIPhotoEffectFade") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        return filter
    }
    
    /// CIPhotoEffectInstant
    /// - SeeAlso: [Reference/CIPhotoEffectInstant](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIPhotoEffectInstant)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 7, *)
    static func photoEffectInstant(inputImage: CIImage) -> CIFilter? {
        guard let filter = CIFilter(name: "CIPhotoEffectInstant") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        return filter
    }
    
    /// CIPhotoEffectMono
    /// - SeeAlso: [Reference/CIPhotoEffectMono](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIPhotoEffectMono)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 7, *)
    static func photoEffectMono(inputImage: CIImage) -> CIFilter? {
        guard let filter = CIFilter(name: "CIPhotoEffectMono") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        return filter
    }
    
    /// CIPhotoEffectNoir
    /// - SeeAlso: [Reference/CIPhotoEffectNoir](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIPhotoEffectNoir)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 7, *)
    static func photoEffectNoir(inputImage: CIImage) -> CIFilter? {
        guard let filter = CIFilter(name: "CIPhotoEffectNoir") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        return filter
    }
    
    /// CIPhotoEffectProcess
    /// - SeeAlso: [Reference/CIPhotoEffectProcess](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIPhotoEffectProcess)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 7, *)
    static func photoEffectProcess(inputImage: CIImage) -> CIFilter? {
        guard let filter = CIFilter(name: "CIPhotoEffectProcess") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        return filter
    }
    
    /// CIPhotoEffectTonal
    /// - SeeAlso: [Reference/CIPhotoEffectTonal](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIPhotoEffectTonal)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 7, *)
    static func photoEffectTonal(inputImage: CIImage) -> CIFilter? {
        guard let filter = CIFilter(name: "CIPhotoEffectTonal") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        return filter
    }
    
    /// CIPhotoEffectTransfer
    /// - SeeAlso: [Reference/CIPhotoEffectTransfer](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIPhotoEffectTransfer)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 7, *)
    static func photoEffectTransfer(inputImage: CIImage) -> CIFilter? {
        guard let filter = CIFilter(name: "CIPhotoEffectTransfer") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        return filter
    }
    
    /// CIPinchDistortion
    /// - SeeAlso: [Reference/CIPinchDistortion](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIPinchDistortion)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputCenter: The center of the effect as x and y coordinates. defaultValue = [150 150].
    /// - parameter inputRadius: The radius determines how many pixels are used to create the distortion. The larger the radius, the wider the extent of the distortion. defaultValue = 300.
    /// - parameter inputScale: The amount of pinching. A value of 0.0 has no effect. A value of 1.0 is the maximum pinch. defaultValue = 0.5.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 6, *)
    static func pinchDistortion(inputImage: CIImage, inputCenter: CIVector, inputRadius: NSNumber = 300, inputScale: NSNumber = 0.5) -> CIFilter? {
        guard let filter = CIFilter(name: "CIPinchDistortion") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputCenter, forKey: "inputCenter")
        filter.setValue(inputRadius, forKey: "inputRadius")
        filter.setValue(inputScale, forKey: "inputScale")
        return filter
    }
    
    /// CIPinLightBlendMode
    /// - SeeAlso: [Reference/CIPinLightBlendMode](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIPinLightBlendMode)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputBackgroundImage: The image to use as a background image.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 8, *)
    static func pinLightBlendMode(inputImage: CIImage, inputBackgroundImage: CIImage) -> CIFilter? {
        guard let filter = CIFilter(name: "CIPinLightBlendMode") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputBackgroundImage, forKey: "inputBackgroundImage")
        return filter
    }
    
    /// CIPixellate
    /// - SeeAlso: [Reference/CIPixellate](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIPixellate)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputCenter: The x and y position to use as the center of the effect defaultValue = [150 150].
    /// - parameter inputScale: The scale determines the size of the squares. Larger values result in larger squares. defaultValue = 8.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 6, *)
    static func pixellate(inputImage: CIImage, inputCenter: CIVector, inputScale: NSNumber = 8) -> CIFilter? {
        guard let filter = CIFilter(name: "CIPixellate") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputCenter, forKey: "inputCenter")
        filter.setValue(inputScale, forKey: "inputScale")
        return filter
    }
    
    /// CIPointillize
    /// - SeeAlso: [Reference/CIPointillize](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIPointillize)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputRadius: The radius of the circles in the resulting pattern. defaultValue = 20.
    /// - parameter inputCenter: The x and y position to use as the center of the effect defaultValue = [150 150].
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 9, *)
    static func pointillize(inputImage: CIImage, inputRadius: NSNumber = 20, inputCenter: CIVector) -> CIFilter? {
        guard let filter = CIFilter(name: "CIPointillize") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputRadius, forKey: "inputRadius")
        filter.setValue(inputCenter, forKey: "inputCenter")
        return filter
    }
    
    /// CIQRCodeGenerator
    /// - SeeAlso: [Reference/CIQRCodeGenerator](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIQRCodeGenerator)
    ///
    /// - parameter inputMessage:
    /// - parameter inputCorrectionLevel: QRCode correction level L, M, Q, or H. defaultValue = M.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage", "outputCGImage"])
    @available(iOS 7, *)
    static func qRCodeGenerator(inputMessage: NSData, inputCorrectionLevel: NSString = "M") -> CIFilter? {
        guard let filter = CIFilter(name: "CIQRCodeGenerator") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputMessage, forKey: "inputMessage")
        filter.setValue(inputCorrectionLevel, forKey: "inputCorrectionLevel")
        return filter
    }
    
    /// CIRadialGradient
    /// - SeeAlso: [Reference/CIRadialGradient](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIRadialGradient)
    ///
    /// - parameter inputCenter: The center of the effect as x and y coordinates. defaultValue = [150 150].
    /// - parameter inputRadius0: The radius of the starting circle to use in the gradient. defaultValue = 5.
    /// - parameter inputRadius1: The radius of the ending circle to use in the gradient. defaultValue = 100.
    /// - parameter inputColor0: The first color to use in the gradient. defaultValue = (1 1 1 1) <CGColorSpace 0x6040000ac8a0> (kCGColorSpaceDeviceRGB).
    /// - parameter inputColor1: The second color to use in the gradient. defaultValue = (0 0 0 1) <CGColorSpace 0x6040000ac8a0> (kCGColorSpaceDeviceRGB).
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 5, *)
    static func radialGradient(inputCenter: CIVector, inputRadius0: NSNumber = 5, inputRadius1: NSNumber = 100, inputColor0: CIColor, inputColor1: CIColor) -> CIFilter? {
        guard let filter = CIFilter(name: "CIRadialGradient") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputCenter, forKey: "inputCenter")
        filter.setValue(inputRadius0, forKey: "inputRadius0")
        filter.setValue(inputRadius1, forKey: "inputRadius1")
        filter.setValue(inputColor0, forKey: "inputColor0")
        filter.setValue(inputColor1, forKey: "inputColor1")
        return filter
    }
    
    /// CIRandomGenerator
    /// - SeeAlso: [Reference/CIRandomGenerator](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIRandomGenerator)
    ///
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 6, *)
    static func randomGenerator() -> CIFilter? {
        guard let filter = CIFilter(name: "CIRandomGenerator") else {
            return nil
        }
        filter.setDefaults()
        return filter
    }
    
    /// CIRippleTransition
    /// - SeeAlso: [Reference/CIRippleTransition](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIRippleTransition)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputTargetImage: The target image for a transition.
    /// - parameter inputShadingImage: An image that looks like a shaded sphere enclosed in a square image.
    /// - parameter inputCenter: The x and y position to use as the center of the effect defaultValue = [150 150].
    /// - parameter inputExtent: A rectangle that defines the extent of the effect. defaultValue = [0 0 300 300].
    /// - parameter inputTime: The parametric time of the transition. This value drives the transition from start (at time 0) to end (at time 1). defaultValue = 0.
    /// - parameter inputWidth: The width of the ripple. defaultValue = 100.
    /// - parameter inputScale: A value that determines whether the ripple starts as a bulge (higher value) or a dimple (lower value). defaultValue = 50.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 9, *)
    static func rippleTransition(inputImage: CIImage, inputTargetImage: CIImage, inputShadingImage: CIImage, inputCenter: CIVector, inputExtent: CIVector, inputTime: NSNumber = 0, inputWidth: NSNumber = 100, inputScale: NSNumber = 50) -> CIFilter? {
        guard let filter = CIFilter(name: "CIRippleTransition") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputTargetImage, forKey: "inputTargetImage")
        filter.setValue(inputShadingImage, forKey: "inputShadingImage")
        filter.setValue(inputCenter, forKey: "inputCenter")
        filter.setValue(inputExtent, forKey: "inputExtent")
        filter.setValue(inputTime, forKey: "inputTime")
        filter.setValue(inputWidth, forKey: "inputWidth")
        filter.setValue(inputScale, forKey: "inputScale")
        return filter
    }
    
    /// CIRowAverage
    /// - SeeAlso: [Reference/CIRowAverage](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIRowAverage)
    ///
    /// - parameter inputImage: The image to process.
    /// - parameter inputExtent: A rectangle that specifies the subregion of the image that you want to process. defaultValue = [0 0 640 80].
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 9, *)
    static func rowAverage(inputImage: CIImage, inputExtent: CIVector) -> CIFilter? {
        guard let filter = CIFilter(name: "CIRowAverage") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputExtent, forKey: "inputExtent")
        return filter
    }
    
    /// CISaturationBlendMode
    /// - SeeAlso: [Reference/CISaturationBlendMode](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CISaturationBlendMode)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputBackgroundImage: The image to use as a background image.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 5, *)
    static func saturationBlendMode(inputImage: CIImage, inputBackgroundImage: CIImage) -> CIFilter? {
        guard let filter = CIFilter(name: "CISaturationBlendMode") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputBackgroundImage, forKey: "inputBackgroundImage")
        return filter
    }
    
    /// CIScreenBlendMode
    /// - SeeAlso: [Reference/CIScreenBlendMode](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIScreenBlendMode)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputBackgroundImage: The image to use as a background image.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 5, *)
    static func screenBlendMode(inputImage: CIImage, inputBackgroundImage: CIImage) -> CIFilter? {
        guard let filter = CIFilter(name: "CIScreenBlendMode") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputBackgroundImage, forKey: "inputBackgroundImage")
        return filter
    }
    
    /// CISepiaTone
    /// - SeeAlso: [Reference/CISepiaTone](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CISepiaTone)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputIntensity: The intensity of the sepia effect. A value of 1.0 creates a monochrome sepia image. A value of 0.0 has no effect on the image. defaultValue = 1.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 5, *)
    static func sepiaTone(inputImage: CIImage, inputIntensity: NSNumber = 1) -> CIFilter? {
        guard let filter = CIFilter(name: "CISepiaTone") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputIntensity, forKey: "inputIntensity")
        return filter
    }
    
    /// CIShadedMaterial
    /// - SeeAlso: [Reference/CIShadedMaterial](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIShadedMaterial)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputShadingImage: The image to use as the height field. The resulting image has greater heights with lighter shades, and lesser heights (lower areas) with darker shades.
    /// - parameter inputScale: The scale of the effect. The higher the value, the more dramatic the effect. defaultValue = 10.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 9, *)
    static func shadedMaterial(inputImage: CIImage, inputShadingImage: CIImage, inputScale: NSNumber = 10) -> CIFilter? {
        guard let filter = CIFilter(name: "CIShadedMaterial") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputShadingImage, forKey: "inputShadingImage")
        filter.setValue(inputScale, forKey: "inputScale")
        return filter
    }
    
    /// CISharpenLuminance
    /// - SeeAlso: [Reference/CISharpenLuminance](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CISharpenLuminance)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputSharpness: The amount of sharpening to apply. Larger values are sharper. defaultValue = 0.4.
    /// - parameter inputRadius: The distance from the center of the effect. defaultValue = 1.69.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 6, *)
    static func sharpenLuminance(inputImage: CIImage, inputSharpness: NSNumber = 0.4, inputRadius: NSNumber = 1.69) -> CIFilter? {
        guard let filter = CIFilter(name: "CISharpenLuminance") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputSharpness, forKey: "inputSharpness")
        filter.setValue(inputRadius, forKey: "inputRadius")
        return filter
    }
    
    /// CISixfoldReflectedTile
    /// - SeeAlso: [Reference/CISixfoldReflectedTile](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CISixfoldReflectedTile)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputCenter: The x and y position to use as the center of the effect defaultValue = [150 150].
    /// - parameter inputAngle: The angle (in radians) of the tiled pattern. defaultValue = 0.
    /// - parameter inputWidth: The width of a tile. defaultValue = 100.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 6, *)
    static func sixfoldReflectedTile(inputImage: CIImage, inputCenter: CIVector, inputAngle: NSNumber = 0, inputWidth: NSNumber = 100) -> CIFilter? {
        guard let filter = CIFilter(name: "CISixfoldReflectedTile") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputCenter, forKey: "inputCenter")
        filter.setValue(inputAngle, forKey: "inputAngle")
        filter.setValue(inputWidth, forKey: "inputWidth")
        return filter
    }
    
    /// CISixfoldRotatedTile
    /// - SeeAlso: [Reference/CISixfoldRotatedTile](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CISixfoldRotatedTile)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputCenter: The x and y position to use as the center of the effect defaultValue = [150 150].
    /// - parameter inputAngle: The angle (in radians) of the tiled pattern. defaultValue = 0.
    /// - parameter inputWidth: The width of a tile. defaultValue = 100.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 6, *)
    static func sixfoldRotatedTile(inputImage: CIImage, inputCenter: CIVector, inputAngle: NSNumber = 0, inputWidth: NSNumber = 100) -> CIFilter? {
        guard let filter = CIFilter(name: "CISixfoldRotatedTile") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputCenter, forKey: "inputCenter")
        filter.setValue(inputAngle, forKey: "inputAngle")
        filter.setValue(inputWidth, forKey: "inputWidth")
        return filter
    }
    
    /// CISmoothLinearGradient
    /// - SeeAlso: [Reference/CISmoothLinearGradient](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CISmoothLinearGradient)
    ///
    /// - parameter inputPoint0: The starting position of the gradient -- where the first color begins. defaultValue = [0 0].
    /// - parameter inputPoint1: The ending position of the gradient -- where the second color begins. defaultValue = [200 200].
    /// - parameter inputColor0: The first color to use in the gradient. defaultValue = (1 1 1 1) <CGColorSpace 0x6040000ac8a0> (kCGColorSpaceDeviceRGB).
    /// - parameter inputColor1: The second color to use in the gradient. defaultValue = (0 0 0 1) <CGColorSpace 0x6040000ac8a0> (kCGColorSpaceDeviceRGB).
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 6, *)
    static func smoothLinearGradient(inputPoint0: CIVector, inputPoint1: CIVector, inputColor0: CIColor, inputColor1: CIColor) -> CIFilter? {
        guard let filter = CIFilter(name: "CISmoothLinearGradient") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputPoint0, forKey: "inputPoint0")
        filter.setValue(inputPoint1, forKey: "inputPoint1")
        filter.setValue(inputColor0, forKey: "inputColor0")
        filter.setValue(inputColor1, forKey: "inputColor1")
        return filter
    }
    
    /// CISoftLightBlendMode
    /// - SeeAlso: [Reference/CISoftLightBlendMode](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CISoftLightBlendMode)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputBackgroundImage: The image to use as a background image.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 5, *)
    static func softLightBlendMode(inputImage: CIImage, inputBackgroundImage: CIImage) -> CIFilter? {
        guard let filter = CIFilter(name: "CISoftLightBlendMode") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputBackgroundImage, forKey: "inputBackgroundImage")
        return filter
    }
    
    /// CISourceAtopCompositing
    /// - SeeAlso: [Reference/CISourceAtopCompositing](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CISourceAtopCompositing)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputBackgroundImage: The image to use as a background image.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 5, *)
    static func sourceAtopCompositing(inputImage: CIImage, inputBackgroundImage: CIImage) -> CIFilter? {
        guard let filter = CIFilter(name: "CISourceAtopCompositing") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputBackgroundImage, forKey: "inputBackgroundImage")
        return filter
    }
    
    /// CISourceInCompositing
    /// - SeeAlso: [Reference/CISourceInCompositing](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CISourceInCompositing)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputBackgroundImage: The image to use as a background image.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 5, *)
    static func sourceInCompositing(inputImage: CIImage, inputBackgroundImage: CIImage) -> CIFilter? {
        guard let filter = CIFilter(name: "CISourceInCompositing") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputBackgroundImage, forKey: "inputBackgroundImage")
        return filter
    }
    
    /// CISourceOutCompositing
    /// - SeeAlso: [Reference/CISourceOutCompositing](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CISourceOutCompositing)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputBackgroundImage: The image to use as a background image.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 5, *)
    static func sourceOutCompositing(inputImage: CIImage, inputBackgroundImage: CIImage) -> CIFilter? {
        guard let filter = CIFilter(name: "CISourceOutCompositing") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputBackgroundImage, forKey: "inputBackgroundImage")
        return filter
    }
    
    /// CISourceOverCompositing
    /// - SeeAlso: [Reference/CISourceOverCompositing](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CISourceOverCompositing)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputBackgroundImage: The image to use as a background image.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 5, *)
    static func sourceOverCompositing(inputImage: CIImage, inputBackgroundImage: CIImage) -> CIFilter? {
        guard let filter = CIFilter(name: "CISourceOverCompositing") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputBackgroundImage, forKey: "inputBackgroundImage")
        return filter
    }
    
    /// CISpotColor
    /// - SeeAlso: [Reference/CISpotColor](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CISpotColor)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputCenterColor1: The center value of the first color range to replace. defaultValue = (0.0784 0.0627 0.0706 1) <CGColorSpace 0x6040000ac8a0> (kCGColorSpaceDeviceRGB).
    /// - parameter inputReplacementColor1: A replacement color for the first color range. defaultValue = (0.4392 0.1922 0.1961 1) <CGColorSpace 0x6040000ac8a0> (kCGColorSpaceDeviceRGB).
    /// - parameter inputCloseness1: A value that indicates how close the first color must match before it is replaced. defaultValue = 0.22.
    /// - parameter inputContrast1: The contrast of the first replacement color. defaultValue = 0.98.
    /// - parameter inputCenterColor2: The center value of the second color range to replace. defaultValue = (0.5255 0.3059 0.3451 1) <CGColorSpace 0x6040000ac8a0> (kCGColorSpaceDeviceRGB).
    /// - parameter inputReplacementColor2: A replacement color for the second color range. defaultValue = (0.9137 0.5608 0.5059 1) <CGColorSpace 0x6040000ac8a0> (kCGColorSpaceDeviceRGB).
    /// - parameter inputCloseness2: A value that indicates how close the second color must match before it is replaced. defaultValue = 0.15.
    /// - parameter inputContrast2: The contrast of the second replacement color. defaultValue = 0.98.
    /// - parameter inputCenterColor3: The center value of the third color range to replace. defaultValue = (0.9216 0.4549 0.3333 1) <CGColorSpace 0x6040000ac8a0> (kCGColorSpaceDeviceRGB).
    /// - parameter inputReplacementColor3: A replacement color for the third color range. defaultValue = (0.9098 0.7529 0.6078 1) <CGColorSpace 0x6040000ac8a0> (kCGColorSpaceDeviceRGB).
    /// - parameter inputCloseness3: A value that indicates how close the third color must match before it is replaced. defaultValue = 0.5.
    /// - parameter inputContrast3: The contrast of the third replacement color. defaultValue = 0.99.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 9, *)
    static func spotColor(inputImage: CIImage, inputCenterColor1: CIColor, inputReplacementColor1: CIColor, inputCloseness1: NSNumber = 0.22, inputContrast1: NSNumber = 0.98, inputCenterColor2: CIColor, inputReplacementColor2: CIColor, inputCloseness2: NSNumber = 0.15, inputContrast2: NSNumber = 0.98, inputCenterColor3: CIColor, inputReplacementColor3: CIColor, inputCloseness3: NSNumber = 0.5, inputContrast3: NSNumber = 0.99) -> CIFilter? {
        guard let filter = CIFilter(name: "CISpotColor") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputCenterColor1, forKey: "inputCenterColor1")
        filter.setValue(inputReplacementColor1, forKey: "inputReplacementColor1")
        filter.setValue(inputCloseness1, forKey: "inputCloseness1")
        filter.setValue(inputContrast1, forKey: "inputContrast1")
        filter.setValue(inputCenterColor2, forKey: "inputCenterColor2")
        filter.setValue(inputReplacementColor2, forKey: "inputReplacementColor2")
        filter.setValue(inputCloseness2, forKey: "inputCloseness2")
        filter.setValue(inputContrast2, forKey: "inputContrast2")
        filter.setValue(inputCenterColor3, forKey: "inputCenterColor3")
        filter.setValue(inputReplacementColor3, forKey: "inputReplacementColor3")
        filter.setValue(inputCloseness3, forKey: "inputCloseness3")
        filter.setValue(inputContrast3, forKey: "inputContrast3")
        return filter
    }
    
    /// CISpotLight
    /// - SeeAlso: [Reference/CISpotLight](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CISpotLight)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputLightPosition: The x and y position of the spotlight. defaultValue = [400 600 150].
    /// - parameter inputLightPointsAt: The x and y position that the spotlight points at. defaultValue = [200 200 0].
    /// - parameter inputBrightness: The brightness of the spotlight. defaultValue = 3.
    /// - parameter inputConcentration: The spotlight size. The smaller the value, the more tightly focused the light beam. defaultValue = 0.1.
    /// - parameter inputColor: The color of the spotlight. defaultValue = (1 1 1 1) <CGColorSpace 0x6040000ac8a0> (kCGColorSpaceDeviceRGB).
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 9, *)
    static func spotLight(inputImage: CIImage, inputLightPosition: CIVector, inputLightPointsAt: CIVector, inputBrightness: NSNumber = 3, inputConcentration: NSNumber = 0.1, inputColor: CIColor) -> CIFilter? {
        guard let filter = CIFilter(name: "CISpotLight") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputLightPosition, forKey: "inputLightPosition")
        filter.setValue(inputLightPointsAt, forKey: "inputLightPointsAt")
        filter.setValue(inputBrightness, forKey: "inputBrightness")
        filter.setValue(inputConcentration, forKey: "inputConcentration")
        filter.setValue(inputColor, forKey: "inputColor")
        return filter
    }
    
    /// CISRGBToneCurveToLinear
    /// - SeeAlso: [Reference/CISRGBToneCurveToLinear](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CISRGBToneCurveToLinear)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 7, *)
    static func sRGBToneCurveToLinear(inputImage: CIImage) -> CIFilter? {
        guard let filter = CIFilter(name: "CISRGBToneCurveToLinear") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        return filter
    }
    
    /// CIStarShineGenerator
    /// - SeeAlso: [Reference/CIStarShineGenerator](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIStarShineGenerator)
    ///
    /// - parameter inputCenter: The x and y position to use as the center of the star. defaultValue = [150 150].
    /// - parameter inputColor: The color to use for the outer shell of the circular star. defaultValue = (1 0.8 0.6 1) <CGColorSpace 0x6040000ac8a0> (kCGColorSpaceDeviceRGB).
    /// - parameter inputRadius: The radius of the star. defaultValue = 50.
    /// - parameter inputCrossScale: The size of the cross pattern. defaultValue = 15.
    /// - parameter inputCrossAngle: The angle of the cross pattern. defaultValue = 0.6.
    /// - parameter inputCrossOpacity: The opacity of the cross pattern. defaultValue = -2.
    /// - parameter inputCrossWidth: The width of the cross pattern. defaultValue = 2.5.
    /// - parameter inputEpsilon: The length of the cross spikes. defaultValue = -2.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 6, *)
    static func starShineGenerator(inputCenter: CIVector, inputColor: CIColor, inputRadius: NSNumber = 50, inputCrossScale: NSNumber = 15, inputCrossAngle: NSNumber = 0.6, inputCrossOpacity: NSNumber = -2, inputCrossWidth: NSNumber = 2.5, inputEpsilon: NSNumber = -2) -> CIFilter? {
        guard let filter = CIFilter(name: "CIStarShineGenerator") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputCenter, forKey: "inputCenter")
        filter.setValue(inputColor, forKey: "inputColor")
        filter.setValue(inputRadius, forKey: "inputRadius")
        filter.setValue(inputCrossScale, forKey: "inputCrossScale")
        filter.setValue(inputCrossAngle, forKey: "inputCrossAngle")
        filter.setValue(inputCrossOpacity, forKey: "inputCrossOpacity")
        filter.setValue(inputCrossWidth, forKey: "inputCrossWidth")
        filter.setValue(inputEpsilon, forKey: "inputEpsilon")
        return filter
    }
    
    /// CIStraightenFilter
    /// - SeeAlso: [Reference/CIStraightenFilter](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIStraightenFilter)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputAngle: An angle in radians. defaultValue = 0.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 5, *)
    static func straightenFilter(inputImage: CIImage, inputAngle: NSNumber = 0) -> CIFilter? {
        guard let filter = CIFilter(name: "CIStraightenFilter") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputAngle, forKey: "inputAngle")
        return filter
    }
    
    /// CIStretchCrop
    /// - SeeAlso: [Reference/CIStretchCrop](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIStretchCrop)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputSize: The size in pixels of the output image. defaultValue = [1280 720].
    /// - parameter inputCropAmount: Determines if and how much cropping should be used to achieve the target size. If value is 0 then only stretching is used. If 1 then only cropping is used. defaultValue = 0.25.
    /// - parameter inputCenterStretchAmount: Determine how much the center of the image is stretched if stretching is used. If value is 0 then the center of the image maintains the original aspect ratio. If 1 then the image is stretched uniformly. defaultValue = 0.25.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 9, *)
    static func stretchCrop(inputImage: CIImage, inputSize: CIVector, inputCropAmount: NSNumber = 0.25, inputCenterStretchAmount: NSNumber = 0.25) -> CIFilter? {
        guard let filter = CIFilter(name: "CIStretchCrop") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputSize, forKey: "inputSize")
        filter.setValue(inputCropAmount, forKey: "inputCropAmount")
        filter.setValue(inputCenterStretchAmount, forKey: "inputCenterStretchAmount")
        return filter
    }
    
    /// CIStripesGenerator
    /// - SeeAlso: [Reference/CIStripesGenerator](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIStripesGenerator)
    ///
    /// - parameter inputCenter: The x and y position to use as the center of the stripe pattern. defaultValue = [150 150].
    /// - parameter inputColor0: A color to use for the odd stripes. defaultValue = (1 1 1 1) <CGColorSpace 0x6040000ac8a0> (kCGColorSpaceDeviceRGB).
    /// - parameter inputColor1: A color to use for the even stripes. defaultValue = (0 0 0 1) <CGColorSpace 0x6040000ac8a0> (kCGColorSpaceDeviceRGB).
    /// - parameter inputWidth: The width of a stripe. defaultValue = 80.
    /// - parameter inputSharpness: The sharpness of the stripe pattern. The smaller the value, the more blurry the pattern. Values range from 0.0 to 1.0. defaultValue = 1.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 5, *)
    static func stripesGenerator(inputCenter: CIVector, inputColor0: CIColor, inputColor1: CIColor, inputWidth: NSNumber = 80, inputSharpness: NSNumber = 1) -> CIFilter? {
        guard let filter = CIFilter(name: "CIStripesGenerator") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputCenter, forKey: "inputCenter")
        filter.setValue(inputColor0, forKey: "inputColor0")
        filter.setValue(inputColor1, forKey: "inputColor1")
        filter.setValue(inputWidth, forKey: "inputWidth")
        filter.setValue(inputSharpness, forKey: "inputSharpness")
        return filter
    }
    
    /// CISubtractBlendMode
    /// - SeeAlso: [Reference/CISubtractBlendMode](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CISubtractBlendMode)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputBackgroundImage: The image to use as a background image.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 8, *)
    static func subtractBlendMode(inputImage: CIImage, inputBackgroundImage: CIImage) -> CIFilter? {
        guard let filter = CIFilter(name: "CISubtractBlendMode") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputBackgroundImage, forKey: "inputBackgroundImage")
        return filter
    }
    
    /// CISunbeamsGenerator
    /// - SeeAlso: [Reference/CISunbeamsGenerator](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CISunbeamsGenerator)
    ///
    /// - parameter inputCenter: The x and y position to use as the center of the sunbeam pattern defaultValue = [150 150].
    /// - parameter inputColor: The color of the sun. defaultValue = (1 0.5 0 1) <CGColorSpace 0x6040000ac8a0> (kCGColorSpaceDeviceRGB).
    /// - parameter inputSunRadius: The radius of the sun. defaultValue = 40.
    /// - parameter inputMaxStriationRadius: The radius of the sunbeams. defaultValue = 2.58.
    /// - parameter inputStriationStrength: The intensity of the sunbeams. Higher values result in more intensity. defaultValue = 0.5.
    /// - parameter inputStriationContrast: The contrast of the sunbeams. Higher values result in more contrast. defaultValue = 1.375.
    /// - parameter inputTime: The duration of the effect. defaultValue = 0.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 9, *)
    static func sunbeamsGenerator(inputCenter: CIVector, inputColor: CIColor, inputSunRadius: NSNumber = 40, inputMaxStriationRadius: NSNumber = 2.58, inputStriationStrength: NSNumber = 0.5, inputStriationContrast: NSNumber = 1.375, inputTime: NSNumber = 0) -> CIFilter? {
        guard let filter = CIFilter(name: "CISunbeamsGenerator") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputCenter, forKey: "inputCenter")
        filter.setValue(inputColor, forKey: "inputColor")
        filter.setValue(inputSunRadius, forKey: "inputSunRadius")
        filter.setValue(inputMaxStriationRadius, forKey: "inputMaxStriationRadius")
        filter.setValue(inputStriationStrength, forKey: "inputStriationStrength")
        filter.setValue(inputStriationContrast, forKey: "inputStriationContrast")
        filter.setValue(inputTime, forKey: "inputTime")
        return filter
    }
    
    /// CISwipeTransition
    /// - SeeAlso: [Reference/CISwipeTransition](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CISwipeTransition)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputTargetImage: The target image for a transition.
    /// - parameter inputExtent: The extent of the effect. defaultValue = [0 0 300 300].
    /// - parameter inputColor: The color of the swipe. defaultValue = (1 1 1 1) <CGColorSpace 0x6040000ac8a0> (kCGColorSpaceDeviceRGB).
    /// - parameter inputTime: The parametric time of the transition. This value drives the transition from start (at time 0) to end (at time 1). defaultValue = 0.
    /// - parameter inputAngle: The angle of the swipe. defaultValue = 0.
    /// - parameter inputWidth: The width of the swipe defaultValue = 300.
    /// - parameter inputOpacity: The opacity of the swipe. defaultValue = 0.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 6, *)
    static func swipeTransition(inputImage: CIImage, inputTargetImage: CIImage, inputExtent: CIVector, inputColor: CIColor, inputTime: NSNumber = 0, inputAngle: NSNumber = 0, inputWidth: NSNumber = 300, inputOpacity: NSNumber = 0) -> CIFilter? {
        guard let filter = CIFilter(name: "CISwipeTransition") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputTargetImage, forKey: "inputTargetImage")
        filter.setValue(inputExtent, forKey: "inputExtent")
        filter.setValue(inputColor, forKey: "inputColor")
        filter.setValue(inputTime, forKey: "inputTime")
        filter.setValue(inputAngle, forKey: "inputAngle")
        filter.setValue(inputWidth, forKey: "inputWidth")
        filter.setValue(inputOpacity, forKey: "inputOpacity")
        return filter
    }
    
    /// CITemperatureAndTint
    /// - SeeAlso: [Reference/CITemperatureAndTint](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CITemperatureAndTint)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputNeutral:  defaultValue = [6500 0].
    /// - parameter inputTargetNeutral:  defaultValue = [6500 0].
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 5, *)
    static func temperatureAndTint(inputImage: CIImage, inputNeutral: CIVector, inputTargetNeutral: CIVector) -> CIFilter? {
        guard let filter = CIFilter(name: "CITemperatureAndTint") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputNeutral, forKey: "inputNeutral")
        filter.setValue(inputTargetNeutral, forKey: "inputTargetNeutral")
        return filter
    }
    
    /// CITextImageGenerator
    /// - SeeAlso: [Reference/CITextImageGenerator](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CITextImageGenerator)
    ///
    /// - parameter inputText:
    /// - parameter inputFontName:  defaultValue = HelveticaNeue.
    /// - parameter inputFontSize:  defaultValue = 12.
    /// - parameter inputScaleFactor:  defaultValue = 1.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 11, *)
    static func textImageGenerator(inputText: NSString, inputFontName: NSString = "HelveticaNeue", inputFontSize: NSNumber = 12, inputScaleFactor: NSNumber = 1) -> CIFilter? {
        guard let filter = CIFilter(name: "CITextImageGenerator") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputText, forKey: "inputText")
        filter.setValue(inputFontName, forKey: "inputFontName")
        filter.setValue(inputFontSize, forKey: "inputFontSize")
        filter.setValue(inputScaleFactor, forKey: "inputScaleFactor")
        return filter
    }
    
    /// CIThermal
    /// - SeeAlso: [Reference/CIThermal](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIThermal)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 10, *)
    static func thermal(inputImage: CIImage) -> CIFilter? {
        guard let filter = CIFilter(name: "CIThermal") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        return filter
    }
    
    /// CIToneCurve
    /// - SeeAlso: [Reference/CIToneCurve](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIToneCurve)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputPoint0:  defaultValue = [0 0].
    /// - parameter inputPoint1:  defaultValue = [0.25 0.25].
    /// - parameter inputPoint2:  defaultValue = [0.5 0.5].
    /// - parameter inputPoint3:  defaultValue = [0.75 0.75].
    /// - parameter inputPoint4:  defaultValue = [1 1].
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 5, *)
    static func toneCurve(inputImage: CIImage, inputPoint0: CIVector, inputPoint1: CIVector, inputPoint2: CIVector, inputPoint3: CIVector, inputPoint4: CIVector) -> CIFilter? {
        guard let filter = CIFilter(name: "CIToneCurve") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputPoint0, forKey: "inputPoint0")
        filter.setValue(inputPoint1, forKey: "inputPoint1")
        filter.setValue(inputPoint2, forKey: "inputPoint2")
        filter.setValue(inputPoint3, forKey: "inputPoint3")
        filter.setValue(inputPoint4, forKey: "inputPoint4")
        return filter
    }
    
    /// CITorusLensDistortion
    /// - SeeAlso: [Reference/CITorusLensDistortion](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CITorusLensDistortion)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputCenter: The x and y position to use as the center of the torus. defaultValue = [150 150].
    /// - parameter inputRadius: The outer radius of the torus. defaultValue = 160.
    /// - parameter inputWidth: The width of the ring. defaultValue = 80.
    /// - parameter inputRefraction: The refraction of the glass. defaultValue = 1.7.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 9, *)
    static func torusLensDistortion(inputImage: CIImage, inputCenter: CIVector, inputRadius: NSNumber = 160, inputWidth: NSNumber = 80, inputRefraction: NSNumber = 1.7) -> CIFilter? {
        guard let filter = CIFilter(name: "CITorusLensDistortion") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputCenter, forKey: "inputCenter")
        filter.setValue(inputRadius, forKey: "inputRadius")
        filter.setValue(inputWidth, forKey: "inputWidth")
        filter.setValue(inputRefraction, forKey: "inputRefraction")
        return filter
    }
    
    /// CITriangleKaleidoscope
    /// - SeeAlso: [Reference/CITriangleKaleidoscope](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CITriangleKaleidoscope)
    ///
    /// - parameter inputImage: Input image to generate kaleidoscope effect from.
    /// - parameter inputPoint: The x and y position to use as the center of the triangular area in the input image. defaultValue = [150 150].
    /// - parameter inputSize: The size in pixels of the triangle. defaultValue = 700.
    /// - parameter inputRotation: Rotation angle of the triangle. defaultValue = 5.924285296593801.
    /// - parameter inputDecay: The decay determines how fast the color fades from the center triangle. defaultValue = 0.85.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 6, *)
    static func triangleKaleidoscope(inputImage: CIImage, inputPoint: CIVector, inputSize: NSNumber = 700, inputRotation: NSNumber = 5.924285296593801, inputDecay: NSNumber = 0.85) -> CIFilter? {
        guard let filter = CIFilter(name: "CITriangleKaleidoscope") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputPoint, forKey: "inputPoint")
        filter.setValue(inputSize, forKey: "inputSize")
        filter.setValue(inputRotation, forKey: "inputRotation")
        filter.setValue(inputDecay, forKey: "inputDecay")
        return filter
    }
    
    /// CITriangleTile
    /// - SeeAlso: [Reference/CITriangleTile](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CITriangleTile)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputCenter: The x and y position to use as the center of the effect defaultValue = [150 150].
    /// - parameter inputAngle: The angle (in radians) of the tiled pattern. defaultValue = 0.
    /// - parameter inputWidth: The width of a tile. defaultValue = 100.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 9, *)
    static func triangleTile(inputImage: CIImage, inputCenter: CIVector, inputAngle: NSNumber = 0, inputWidth: NSNumber = 100) -> CIFilter? {
        guard let filter = CIFilter(name: "CITriangleTile") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputCenter, forKey: "inputCenter")
        filter.setValue(inputAngle, forKey: "inputAngle")
        filter.setValue(inputWidth, forKey: "inputWidth")
        return filter
    }
    
    /// CITwelvefoldReflectedTile
    /// - SeeAlso: [Reference/CITwelvefoldReflectedTile](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CITwelvefoldReflectedTile)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputCenter: The x and y position to use as the center of the effect defaultValue = [150 150].
    /// - parameter inputAngle: The angle (in radians) of the tiled pattern. defaultValue = 0.
    /// - parameter inputWidth: The width of a tile. defaultValue = 100.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 6, *)
    static func twelvefoldReflectedTile(inputImage: CIImage, inputCenter: CIVector, inputAngle: NSNumber = 0, inputWidth: NSNumber = 100) -> CIFilter? {
        guard let filter = CIFilter(name: "CITwelvefoldReflectedTile") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputCenter, forKey: "inputCenter")
        filter.setValue(inputAngle, forKey: "inputAngle")
        filter.setValue(inputWidth, forKey: "inputWidth")
        return filter
    }
    
    /// CITwirlDistortion
    /// - SeeAlso: [Reference/CITwirlDistortion](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CITwirlDistortion)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputCenter: The center of the effect as x and y coordinates. defaultValue = [150 150].
    /// - parameter inputRadius: The radius determines how many pixels are used to create the distortion. The larger the radius, the wider the extent of the distortion. defaultValue = 300.
    /// - parameter inputAngle: The angle (in radians) of the twirl. Values can be positive or negative. defaultValue = 3.141592653589793.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 5, *)
    static func twirlDistortion(inputImage: CIImage, inputCenter: CIVector, inputRadius: NSNumber = 300, inputAngle: NSNumber = 3.141592653589793) -> CIFilter? {
        guard let filter = CIFilter(name: "CITwirlDistortion") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputCenter, forKey: "inputCenter")
        filter.setValue(inputRadius, forKey: "inputRadius")
        filter.setValue(inputAngle, forKey: "inputAngle")
        return filter
    }
    
    /// CIUnsharpMask
    /// - SeeAlso: [Reference/CIUnsharpMask](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIUnsharpMask)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputRadius: The radius around a given pixel to apply the unsharp mask. The larger the radius, the more of the image is affected. defaultValue = 2.5.
    /// - parameter inputIntensity: The intensity of the effect. The larger the value, the more contrast in the affected area. defaultValue = 0.5.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 6, *)
    static func unsharpMask(inputImage: CIImage, inputRadius: NSNumber = 2.5, inputIntensity: NSNumber = 0.5) -> CIFilter? {
        guard let filter = CIFilter(name: "CIUnsharpMask") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputRadius, forKey: "inputRadius")
        filter.setValue(inputIntensity, forKey: "inputIntensity")
        return filter
    }
    
    /// CIVibrance
    /// - SeeAlso: [Reference/CIVibrance](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIVibrance)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputAmount: The amount to adjust the saturation. defaultValue = 0.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 5, *)
    static func vibrance(inputImage: CIImage, inputAmount: NSNumber = 0) -> CIFilter? {
        guard let filter = CIFilter(name: "CIVibrance") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputAmount, forKey: "inputAmount")
        return filter
    }
    
    /// CIVignette
    /// - SeeAlso: [Reference/CIVignette](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIVignette)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputIntensity: The intensity of the effect. defaultValue = 0.
    /// - parameter inputRadius: The distance from the center of the effect. defaultValue = 1.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 5, *)
    static func vignette(inputImage: CIImage, inputIntensity: NSNumber = 0, inputRadius: NSNumber = 1) -> CIFilter? {
        guard let filter = CIFilter(name: "CIVignette") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputIntensity, forKey: "inputIntensity")
        filter.setValue(inputRadius, forKey: "inputRadius")
        return filter
    }
    
    /// CIVignetteEffect
    /// - SeeAlso: [Reference/CIVignetteEffect](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIVignetteEffect)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputCenter: The center of the effect as x and y coordinates. defaultValue = [150 150].
    /// - parameter inputRadius: The distance from the center of the effect. defaultValue = 150.
    /// - parameter inputIntensity: The intensity of the effect. defaultValue = 1.
    /// - parameter inputFalloff:  defaultValue = 0.5.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 7, *)
    static func vignetteEffect(inputImage: CIImage, inputCenter: CIVector, inputRadius: NSNumber = 150, inputIntensity: NSNumber = 1, inputFalloff: NSNumber = 0.5) -> CIFilter? {
        guard let filter = CIFilter(name: "CIVignetteEffect") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputCenter, forKey: "inputCenter")
        filter.setValue(inputRadius, forKey: "inputRadius")
        filter.setValue(inputIntensity, forKey: "inputIntensity")
        filter.setValue(inputFalloff, forKey: "inputFalloff")
        return filter
    }
    
    /// CIVortexDistortion
    /// - SeeAlso: [Reference/CIVortexDistortion](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIVortexDistortion)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputCenter: The center of the effect as x and y coordinates. defaultValue = [150 150].
    /// - parameter inputRadius: The radius determines how many pixels are used to create the distortion. The larger the radius, the wider the extent of the distortion. defaultValue = 300.
    /// - parameter inputAngle: The angle (in radians) of the vortex. defaultValue = 56.54866776461628.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 6, *)
    static func vortexDistortion(inputImage: CIImage, inputCenter: CIVector, inputRadius: NSNumber = 300, inputAngle: NSNumber = 56.54866776461628) -> CIFilter? {
        guard let filter = CIFilter(name: "CIVortexDistortion") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputCenter, forKey: "inputCenter")
        filter.setValue(inputRadius, forKey: "inputRadius")
        filter.setValue(inputAngle, forKey: "inputAngle")
        return filter
    }
    
    /// CIWhitePointAdjust
    /// - SeeAlso: [Reference/CIWhitePointAdjust](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIWhitePointAdjust)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputColor: A color to use as the white point. defaultValue = (1 1 1 1) <CGColorSpace 0x6040000ac8a0> (kCGColorSpaceDeviceRGB).
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 5, *)
    static func whitePointAdjust(inputImage: CIImage, inputColor: CIColor) -> CIFilter? {
        guard let filter = CIFilter(name: "CIWhitePointAdjust") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputColor, forKey: "inputColor")
        return filter
    }
    
    /// CIXRay
    /// - SeeAlso: [Reference/CIXRay](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIXRay)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 10, *)
    static func xRay(inputImage: CIImage) -> CIFilter? {
        guard let filter = CIFilter(name: "CIXRay") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        return filter
    }
    
    /// CIZoomBlur
    /// - SeeAlso: [Reference/CIZoomBlur](http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIZoomBlur)
    ///
    /// - parameter inputImage: The image to use as an input image. For filters that also use a background image, this is the foreground image.
    /// - parameter inputCenter: The center of the effect as x and y coordinates. defaultValue = [150 150].
    /// - parameter inputAmount: The zoom-in amount. Larger values result in more zooming in. defaultValue = 20.
    ///
    /// - returns: Generated CIFilter (you can get result with ["outputImage"])
    @available(iOS 8.3, *)
    static func zoomBlur(inputImage: CIImage, inputCenter: CIVector, inputAmount: NSNumber = 20) -> CIFilter? {
        guard let filter = CIFilter(name: "CIZoomBlur") else {
            return nil
        }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(inputCenter, forKey: "inputCenter")
        filter.setValue(inputAmount, forKey: "inputAmount")
        return filter
    }
}


