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
    
    let compositeFilter = CIFilter(name: "CISourceOverCompositing")!
    var imageAccumulator: CIImageAccumulator?
    let brushFilter = CIFilter.radialGradient(inputRadius0: 0, inputColor1: CIColor(red: 0, green: 0, blue: 0, alpha: 0))!
    let brushColor = CIColor.black
    let brushSize: CGFloat = 25.0
    
    var previousTouchLocation: CGPoint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(imageView)
        imageView.constraintTo(frameOf: view)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        _refreshImageAccumulator()
    }
    
    private func _refreshImageAccumulator() {
        if let oldAccumulator = imageAccumulator, view.bounds == oldAccumulator.extent {
            return
        }
        
        guard let newAccumulator = CIImageAccumulator(extent: view.bounds, format: kCIFormatRGBA16) else {
            return
        }
        let filter = CIFilter.constantColorGenerator(inputColor: CIColor(red: 1, green: 1, blue: 1, alpha: 1))!
        newAccumulator.setImage(filter.outputImage!)
        
        if let oldAccumulator = self.imageAccumulator {
            let filter = CIFilter.sourceOverCompositing(inputBackgroundImage: newAccumulator.image())!
            newAccumulator.setImage(oldAccumulator.image().applying(filter)!)
        }
        
        self.imageAccumulator = newAccumulator
        
        self.imageView.image = self.imageAccumulator?.image().asUIImage()
    }
    
//    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//        super.touchesMoved(touches, with: event)
//
//        guard let touch = touches.first else {
//            return
//        }
//
//        let location = touch.location(in: view)
//
//        brushFilter.setValue(brushSize, forKey: "inputRadius1")
//        brushFilter.setValue(brushColor, forKey: "inputColor0")
//        brushFilter.setValue(CIVector(cgPoint: location), forKey: kCIInputCenterKey)
//
//        compositeFilter.setValue(imageAccumulator!.image(), forKey: kCIInputBackgroundImageKey)
//
//        let rect = CGRect(x: location.x - brushSize, y: location.y - brushSize, width: brushSize * 2, height: brushSize * 2)
//
//        imageAccumulator?.setImage(compositeFilter.apply(to: brushFilter.outputImage!)!, dirtyRect: rect)
//        self.imageView.image = self.imageAccumulator?.image().asUIImage()
//    }
    
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

        compositeFilter.setValue(imageAccumulator!.image(), forKey: kCIInputBackgroundImageKey)

        imageAccumulator?.setImage(CIImage.extractOrGenerate(from: drawnImage)!.applying(compositeFilter)!)

        imageView.image = imageAccumulator!.image().asUIImage()
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        previousTouchLocation = nil
    }
}
