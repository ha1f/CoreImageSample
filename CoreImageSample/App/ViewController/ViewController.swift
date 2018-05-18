//
//  ViewController.swift
//  CoreImageSample
//
//  Created by はるふ on 2017/12/11.
//  Copyright © 2017年 ha1f. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let imageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(imageView)
        imageView.constraintTo(centerOf: view, width: 256, height: 256)
        
        // imageView.backgroundColor = UIColor.green
        
//        let maskImage = CIImage(image: #imageLiteral(resourceName: "frame_01_mask.png"))!
//        let maskFilter = CIFilter.sourceInCompositing(inputBackgroundImage: maskImage)!
//        let maskedLenna = CIImage(image: #imageLiteral(resourceName: "Lenna.png"))!.aspectFit(to: maskImage.extent.size)!.applying(maskFilter)!
//        let overFilter = CIFilter.sourceOverCompositing(inputBackgroundImage: maskedLenna)!
//        let result = CIImage(image: #imageLiteral(resourceName: "frame_01.png"))!.applying(overFilter)!
//        imageView.image = result.asUIImage(useCgImage: true)
        // imageView.image = CIImage(image: #imageLiteral(resourceName: "Lenna.png"))!.applying(CIFilter.columnAverage()!)?.asUIImage(useCgImage: true)
        let path1 = UIBezierPath()
        path1.move(to: CGPoint(x: 0, y: 50))
        path1.addLine(to: CGPoint(x: 50, y: 0))
        path1.addLine(to: CGPoint(x: 100, y: 50))
        
        let path2 = UIBezierPath()
        path2.move(to: CGPoint(x: 0, y: 50))
        path2.addLine(to: CGPoint(x: 50, y: 10))
        path2.addLine(to: CGPoint(x: 100, y: 50))
        
        let path3 = UIBezierPath()
        path3.move(to: CGPoint(x: 0, y: 50))
        path3.addLine(to: CGPoint(x: 0, y: 100))
        path3.addLine(to: CGPoint(x: 100, y: 50))
        
        print(UIBezierPath.difference(path1, path1))
        print(UIBezierPath.difference(path1, path2))
        print(UIBezierPath.difference(path1, path3))
        
        
        // #imageLiteral(resourceName: "Lenna.png").masked(with: #imageLiteral(resourceName: "frame_01_mask.png"))
        
//        var bitmapImage = BitmapImage(image: CGImage.extractOrGenerate(from: #imageLiteral(resourceName: "sample.PNG"))!)!
//        bitmapImage.floodFill(fromX: 300, y: 200, withColor: Rgba.blue)
//        bitmapImage.floodFill(fromX: 300, y: 200, withColor: Rgba.blue)
//        imageView.image = bitmapImage.makeImage()?.asUIImage()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // print("present")
        // self.present(MicroPaintViewController(), animated: true, completion: nil)
    }
}
