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
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 256),
            imageView.heightAnchor.constraint(equalToConstant: 256)
            ])
        
        imageView.image = QrCodeGenerator()
            .generate(fromString: "https://ha1f.net", imageWidth: 256, scale: UIScreen.main.scale)
            .map { UIImage(ciImage: $0, scale: UIScreen.main.scale, orientation: .up) }
    }
}

