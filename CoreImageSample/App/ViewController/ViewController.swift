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
    
    func onNumberButtonPressed(number: Int) {
        if jdsaf
        
    }
    
    func sample(pointer: UnsafeMutablePointer<Rgba>) {
        print(pointer.pointee)
        var n = name(5)
    }
    
    @IBAction func select0() {
        onNumberButtonPressed(number: 0)
    }
    @IBAction func select1() {
        onNumberButtonPressed(number: 1)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("size", MemoryLayout<Rgba>.size)
        print("stride", MemoryLayout<Rgba>.stride)
        print("alignment", MemoryLayout<Rgba>.alignment)
        print(MemoryLayout<UInt8>.size, MemoryLayout<UInt8>.stride)
        
        
        view.addSubview(imageView)
        imageView.constraintTo(centerOf: view, width: 256, height: 256)
        
        imageView.image = #imageLiteral(resourceName: "sample.PNG")
        
        self.fillImage(point: PixelPoint(x: 350, y: 220), color: .green) {
            self.fillImage(point: PixelPoint(x: 750, y: 320), color: .red) {
                self.fillImage(point: PixelPoint(x: 230, y: 720), color: .blue) {
                    self.fillImage(point: PixelPoint(x: 10, y: 10), color: .black) {
                        print("complete")
                    }
                }
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.present(CanvasViewController(), animated: true, completion: nil)
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
