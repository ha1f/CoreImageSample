//
//  CaptureVideoPreviewView.swift
//  CoreImageSample
//
//  Created by はるふ on 2017/12/30.
//  Copyright © 2017年 ha1f. All rights reserved.
//

import UIKit
import AVFoundation

/// https://developer.apple.com/library/content/samplecode/AVCam/Listings/Swift_AVCam_PreviewView_swift.html#//apple_ref/doc/uid/DTS40010112-Swift_AVCam_PreviewView_swift-DontLinkElementID_17
class CaptureVideoPreviewView: UIView {
    var videoPreviewLayer: AVCaptureVideoPreviewLayer {
        guard let layer = layer as? AVCaptureVideoPreviewLayer else {
            fatalError("Expected `AVCaptureVideoPreviewLayer` type for layer. Check PreviewView.layerClass implementation.")
        }
        
        return layer
    }
    
    var session: AVCaptureSession? {
        get {
            return videoPreviewLayer.session
        }
        set {
            videoPreviewLayer.session = newValue
        }
    }
    
    override class var layerClass: AnyClass {
        return AVCaptureVideoPreviewLayer.self
    }
}
