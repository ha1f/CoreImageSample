//
//  AVCaptureDevice+Extension.swift
//  CoreImageSample
//
//  Created by はるふ on 2017/12/30.
//  Copyright © 2017年 ha1f. All rights reserved.
//

import UIKit
import AVFoundation

extension AVCaptureDevice.DiscoverySession {
    var uniqueDevicePositionsCount: Int {
        var uniqueDevicePositions: [AVCaptureDevice.Position] = []
        
        for device in devices {
            if !uniqueDevicePositions.contains(device.position) {
                uniqueDevicePositions.append(device.position)
            }
        }
        
        return uniqueDevicePositions.count
    }
}

extension AVCaptureDevice {
    func configureFocusPointOfInterest(focusPointOfInterest: CGPoint, focusMode: FocusMode) {
        if isFocusPointOfInterestSupported {
            self.focusPointOfInterest = focusPointOfInterest
            self.focusMode = focusMode
        }
    }
    func configureExposurePointOfInterest(exposurePointOfInterest: CGPoint, exposureMode: ExposureMode) {
        if isExposurePointOfInterestSupported {
            self.exposurePointOfInterest = exposurePointOfInterest
            self.exposureMode = exposureMode
        }
    }
}
