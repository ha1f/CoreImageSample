//
//  FaceRecognitionViewController.swift
//  CoreImageSample
//
//  Created by ST20591 on 2018/03/22.
//  Copyright © 2018年 ha1f. All rights reserved.
//

import UIKit

class FaceRecognitionViewController: UIViewController {
    let imageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(imageView)
        imageView.constraintTo(centerOf: view, width: 256, height: 256)
        
        updateImage(image: CIImage.extractOrGenerate(from: #imageLiteral(resourceName: "Lenna.png"))!)
    }
    
    private func buildMaskImage(image: CIImage) -> CIImage? {
        guard let detector = CIDetector(ofType: CIDetectorTypeFace, context: nil, options: nil) else {
            return nil
        }
        
        var maskImage: CIImage? = nil
        detector.features(in: image).forEach { feature in
            // 要検討
            let radius = Double(min(feature.bounds.width, feature.bounds.height) / 1.5)
            guard let radialGradient = CIFilter.radialGradient(inputCenter: CIVector(cgPoint: feature.bounds.center), inputRadius0: NSNumber(value: radius), inputRadius1: NSNumber(value: radius + 1), inputColor0: CIColor(red: 0, green: 1, blue: 0, alpha: 1), inputColor1: CIColor(red: 0, green: 0, blue: 0, alpha: 0)) else {
                return
            }
            let circleImage = radialGradient.outputImage!
            if let currentMaskImage = maskImage {
                maskImage = CIFilter.sourceOverCompositing(inputBackgroundImage: currentMaskImage)?.apply(to: circleImage) ?? currentMaskImage
            } else {
                maskImage = circleImage
            }
        }
        return maskImage
    }
    
    func updateImage(image: CIImage) {
        if let maskImage = buildMaskImage(image: image) {
            if let pixellated = CIFilter.pixellate(inputScale: NSNumber(value: Double(max(image.extent.width, image.extent.height)/60)))?.apply(to: image) {
                if let result = CIFilter.blendWithMask(inputBackgroundImage: image, inputMaskImage: maskImage)?.apply(to: pixellated) {
                    DispatchQueue.main.async { [weak self] in
                        self?.imageView.image = UIImage(ciImage: result)
                    }
                }
            }
            
        }
    }
}
