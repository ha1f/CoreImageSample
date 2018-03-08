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
        
        var bitmapImage = BitmapImage(image: CGImage.extractOrGenerate(from: #imageLiteral(resourceName: "Lenna.png"))!)!
        for x in 50..<80 {
            for y in 40..<50 {
                bitmapImage.fillPixel(x: x, y: y, color: Rgba.clear)
            }
        }
        
        for x in 0..<50 {
            for y in 0..<30 {
                bitmapImage.fillPixel(x: x, y: y, color: Rgba.clear)
            }
        }
        
        imageView.image = bitmapImage.makeImage()?.asUIImage()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        self.present(CanvasViewController(), animated: true, completion: nil)
    }
    
    private func fillImage(point: PixelPoint, color: RGBA<UInt8>, completion: (() -> Void)? = nil) {
        guard let image = self.imageView.image.map({ Image<RGBA<UInt8>>(uiImage: $0) }) else {
            return
        }
        DispatchQueue.global(qos: .default).async { [weak self] in
            let image = image.filled(from: point, color: color)
            DispatchQueue.main.async {
                self?.imageView.image = image?.uiImage
                completion?()
            }
        }
    }
}
