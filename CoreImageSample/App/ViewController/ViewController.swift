//
//  ViewController.swift
//  CoreImageSample
//
//  Created by はるふ on 2017/12/11.
//  Copyright © 2017年 ha1f. All rights reserved.
//

import UIKit
import EasyImagy

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
        
        imageView.backgroundColor = UIColor.cyan
        
        var bitmapImage = BitmapImage(image: CGImage.extractOrGenerate(from: #imageLiteral(resourceName: "sample.PNG"))!)!
        bitmapImage.floodFill(fromX: 300, y: 200, withColor: Rgba.blue)
        bitmapImage.floodFill(fromX: 300, y: 200, withColor: Rgba.blue)
        imageView.image = bitmapImage.makeImage()?.asUIImage()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // print("present")
        // self.present(MicroPaintViewController(), animated: true, completion: nil)
    }
}
