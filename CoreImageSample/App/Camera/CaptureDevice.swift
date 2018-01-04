//
//  CaptureDevice.swift
//  CoreImageSample
//
//  Created by はるふ on 2017/12/30.
//  Copyright © 2017年 ha1f. All rights reserved.
//

import UIKit
import AVFoundation

struct CaptureDevice {
    
    let avCaptureDevice: AVCaptureDevice
    init(_ device: AVCaptureDevice) {
        self.avCaptureDevice = device
    }
    
    func configureWithLock(_ closure: (AVCaptureDevice) -> Void) {
        if let _ = try? avCaptureDevice.lockForConfiguration() {
            closure(avCaptureDevice)
            avCaptureDevice.unlockForConfiguration()
        }
    }
    
    func configureForHighestFrameRate() {
        var _bestFormat: AVCaptureDevice.Format?
        var _bestFrameRateRange: AVFrameRateRange?
        for format in avCaptureDevice.formats {
            for range in format.videoSupportedFrameRateRanges {
                if range.maxFrameRate > (_bestFrameRateRange?.maxFrameRate ?? 0) {
                    _bestFormat = format
                    _bestFrameRateRange = range
                }
            }
        }
        guard let bestFormat = _bestFormat, let bestFrameRateRange = _bestFrameRateRange else {
            return
        }
        
        configureWithLock { device in
            device.activeFormat = bestFormat
            device.activeVideoMaxFrameDuration = bestFrameRateRange.minFrameDuration
            device.activeVideoMinFrameDuration = bestFrameRateRange.minFrameDuration
        }
    }
    
    func asDeviceInput() throws -> AVCaptureDeviceInput {
        return try AVCaptureDeviceInput(device: avCaptureDevice)
    }
    
    /// NSCameraUsageDescription is necessary
    private static func avVideoDevice(of position: AVCaptureDevice.Position) -> AVCaptureDevice? {
        if #available(iOS 10.2, *) {
            if let device = AVCaptureDevice.default(.builtInDualCamera, for: .video, position: .front) {
                return device
            }
        }
        if let device = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .front) {
            return device
        }
        return nil
    }
    
    /// NSMicrophoneUsageDescription is necessary
    private static func audioDevice() -> AVCaptureDevice? {
        return AVCaptureDevice.default(for: .audio)
    }
    
    static func videoDevice(of position: AVCaptureDevice.Position) -> CaptureDevice? {
        return avVideoDevice(of: position).map { CaptureDevice($0) }
    }
    
    static var frontVideoDevice: CaptureDevice? {
        return videoDevice(of: .front)
    }
    
    static var backVideoDevice: CaptureDevice? {
        return videoDevice(of: .back)
    }
}
