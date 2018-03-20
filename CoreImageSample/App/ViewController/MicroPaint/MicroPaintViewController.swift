//
//  MicroPaintViewController.swift
//  CoreImageSample
//
//  Created by ST20591 on 2018/03/19.
//  Copyright © 2018年 ha1f. All rights reserved.
//

import UIKit

/// https://developer.apple.com/library/content/documentation/GraphicsImaging/Conceptual/CoreImaging/ci_feedback_based/ci_feedback_based.html#//apple_ref/doc/uid/TP30001185-CH5-SW5
class MicroPaintViewController: UIViewController {
    let imageView = UIImageView()
    
    let hsb = CIFilter(name: "CIColorControls", withInputParameters: [kCIInputBrightnessKey: 0.05])!
    let gaussianBlur = CIFilter(name: "CIGaussianBlur", withInputParameters: [kCIInputRadiusKey: 1])!
    let compositeFilter = CIFilter(name: "CISourceOverCompositing")!
    var imageAccumulator: CIImageAccumulator!
    
    var previousTouchLocation: CGPoint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageAccumulator = CIImageAccumulator(extent: view.bounds, format: kCIFormatARGB8)
        
        view.addSubview(imageView)
        
        let displayLink = CADisplayLink(target: self, selector: #selector(self.step))
        displayLink.add(to: RunLoop.main, forMode: RunLoopMode.defaultRunLoopMode)
    }
    
    @objc
    func step() {
        if previousTouchLocation == nil {
            hsb.setValue(imageAccumulator.image(), forKey: kCIInputImageKey)
            gaussianBlur.setValue(hsb.outputImage!, forKey: kCIInputImageKey)
            
            imageAccumulator.setImage(gaussianBlur.outputImage!)
            
            imageView.image = imageAccumulator.image().asUIImage()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        previousTouchLocation = touches.first?.location(in: view)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first,
            let event = event,
            let coalescedTouches = event.coalescedTouches(for: touch) else {
            return
        }
        
        UIGraphicsBeginImageContext(view.frame.size)
        
        guard let cgContext = UIGraphicsGetCurrentContext() else {
            return
        }
        
        cgContext.setLineCap(.round)
        
        for coalescedTouch in coalescedTouches {
            let lineWidth = coalescedTouch.force != 0 ? (coalescedTouch.force / coalescedTouch.maximumPossibleForce) * 20 : 10
            
            let lineColor = coalescedTouch.force != 0
                ? UIColor(hue: coalescedTouch.force / coalescedTouch.maximumPossibleForce, saturation: 1, brightness: 1, alpha: 1).cgColor
                : UIColor.gray.cgColor
            
            cgContext.setLineWidth(lineWidth)
            cgContext.setStrokeColor(lineColor)
            cgContext.move(to: previousTouchLocation!)
            cgContext.addLine(to: coalescedTouch.location(in: view))
            cgContext.strokePath()
            previousTouchLocation = coalescedTouch.location(in: view)
        }
        
        let drawnImage = UIGraphicsGetImageFromCurrentImageContext()!
        
        UIGraphicsEndImageContext()
        
        compositeFilter.setValue(CIImage(image: drawnImage), forKey: kCIInputImageKey)
        compositeFilter.setValue(imageAccumulator.image(), forKey: kCIInputBackgroundImageKey)
        
        imageAccumulator.setImage(compositeFilter.outputImage!)
        
        imageView.image = imageAccumulator.image().asUIImage()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        previousTouchLocation = nil
    }
    
    override func viewDidLayoutSubviews() {
        imageView.frame = view.frame
    }

}
