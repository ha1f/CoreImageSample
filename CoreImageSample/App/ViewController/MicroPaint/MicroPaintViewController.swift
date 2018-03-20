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
    
    let hsb = CIFilter.colorControls(inputBrightness: 0.05)!
    let gaussianBlur = CIFilter.gaussianBlur(inputRadius: 1)!
    
    let compositeFilter = CIFilter(name: "CISourceOverCompositing")!
    lazy var imageAccumulator = CIImageAccumulator(extent: view.bounds, format: kCIFormatARGB8)!
    let brushFilter = CIFilter.radialGradient(inputColor0: CIColor.black, inputColor1: UIColor.black.ciColor)
    let color = UIColor.black.ciColor
    // let brushSize
    
    var previousTouchLocation: CGPoint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(imageView)
        
        let displayLink = CADisplayLink(target: self, selector: #selector(self.step))
        displayLink.add(to: RunLoop.main, forMode: RunLoopMode.defaultRunLoopMode)
    }
    
    @objc
    func step() {
        guard previousTouchLocation == nil else {
            return
        }
        
        // let filteredImage = gaussianBlur.apply(to: hsb.apply(to: imageAccumulator.image())!)!
        // imageAccumulator.setImage(filteredImage)
        imageView.image = imageAccumulator.image().asUIImage()
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
        
        if previousTouchLocation == nil {
            previousTouchLocation = touch.location(in: view)
            return
        }
        
        UIGraphicsBeginImageContext(view.frame.size)
        
        guard let cgContext = UIGraphicsGetCurrentContext() else {
            return
        }
        
        cgContext.setLineCap(.round)
        
        for coalescedTouch in coalescedTouches {
            let lineWidth = coalescedTouch.force != 0
                ? (coalescedTouch.force / coalescedTouch.maximumPossibleForce) * 20
                : 10
            
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
        
        compositeFilter.setValue(imageAccumulator.image(), forKey: kCIInputBackgroundImageKey)
        
        imageAccumulator.setImage(compositeFilter.apply(to: CIImage.extractOrGenerate(from: drawnImage)!)!)
        
        imageView.image = imageAccumulator.image().asUIImage()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        previousTouchLocation = nil
    }
    
    override func viewDidLayoutSubviews() {
        imageView.frame = view.frame
    }

}
