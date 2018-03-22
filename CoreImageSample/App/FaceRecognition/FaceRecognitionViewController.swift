//
//  FaceRecognitionViewController.swift
//  CoreImageSample
//
//  Created by ST20591 on 2018/03/22.
//  Copyright © 2018年 ha1f. All rights reserved.
//

import UIKit

/// https://developer.apple.com/library/content/documentation/GraphicsImaging/Conceptual/CoreImaging/ci_filer_recipes/ci_filter_recipes.html#//apple_ref/doc/uid/TP30001185-CH4-SW22
class FaceRecognitionViewController: UIViewController {
    let imageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)
        imageView.constraintTo(frameOf: view)
        
        updateImage(image: CIImage.extractOrGenerate(from: #imageLiteral(resourceName: "Lenna.png"))!)
    }
    
    private func pixellated(_ image: CIImage, pixelSize: Double) -> CIImage? {
        return CIFilter.pixellate(inputScale: NSNumber(value: pixelSize))?.apply(to: image)
    }
    
    private func buildMaskImage(image: CIImage, rects: [CGRect]) -> CIImage? {
        var maskImage: CIImage? = nil
        rects.forEach { rect in
            // 要検討
            let radius = Double(min(rect.width, rect.height) / 1.5)
            let radialGradient = CIFilter.radialGradient(inputCenter: CIVector(cgPoint: rect.center), inputRadius0: NSNumber(value: radius), inputRadius1: NSNumber(value: radius + 1), inputColor0: CIColor(red: 0, green: 1, blue: 0, alpha: 1), inputColor1: CIColor.clear)
            guard let circleImage = radialGradient?.outputImage else {
                return
            }
            
            if let currentMaskImage = maskImage {
                maskImage = CIFilter.sourceOverCompositing(inputBackgroundImage: currentMaskImage)?.apply(to: circleImage) ?? currentMaskImage
            } else {
                maskImage = circleImage
            }
        }
        return maskImage
    }
    
    private func facesPixellated(_ image: CIImage) -> CIImage? {
        guard let detector = CIDetector(ofType: CIDetectorTypeFace, context: nil, options: nil) else {
            return nil
        }
        let rects = detector.features(in: image).map { $0.bounds }
        
        guard let maskImage = buildMaskImage(image: image, rects: rects) else {
            return nil
        }
        
        let pixelSize = Double(max(image.extent.width, image.extent.height)/50)
        guard let pixellated = pixellated(image, pixelSize: pixelSize) else {
            return nil
        }
        
        guard let result = CIFilter.blendWithMask(inputBackgroundImage: image, inputMaskImage: maskImage)?.apply(to: pixellated) else {
            return nil
        }
        
        return result
    }
    
    func updateImage(image: CIImage) {
        imageView.image = (facesPixellated(image) ?? image).asUIImage(useCgImage: true)
    }
}
