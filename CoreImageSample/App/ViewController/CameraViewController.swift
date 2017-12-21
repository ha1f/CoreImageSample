//
//  CameraViewController.swift
//  CoreImageSample
//
//  Created by ST20591 on 2017/12/13.
//  Copyright © 2017年 ha1f. All rights reserved.
//

import UIKit
import AVFoundation

extension AVCaptureVideoOrientation {
    init?(deviceOrientation: UIDeviceOrientation) {
        switch deviceOrientation {
        case .portrait: self = .portrait
        case .portraitUpsideDown: self = .portraitUpsideDown
        case .landscapeLeft: self = .landscapeRight
        case .landscapeRight: self = .landscapeLeft
        default: return nil
        }
    }
    
    init?(interfaceOrientation: UIInterfaceOrientation) {
        switch interfaceOrientation {
        case .portrait: self = .portrait
        case .portraitUpsideDown: self = .portraitUpsideDown
        case .landscapeLeft: self = .landscapeLeft
        case .landscapeRight: self = .landscapeRight
        default: return nil
        }
    }
}

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

// https://developer.apple.com/library/content/samplecode/AVCam/Listings/Swift_AVCam_CameraViewController_swift.html#//apple_ref/doc/uid/DTS40010112-Swift_AVCam_CameraViewController_swift-DontLinkElementID_15
class CameraViewController: UIViewController {
    
    private lazy var toggleCameraButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(self.onToggleCameraButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var shutterButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(self.onShutterButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var previewView = CaptureVideoPreviewView()
    
    private let sessionQueue = DispatchQueue(label: "session queue") // Communicate with the session and other session objects on this queue.
    
    let captureSession = AVCaptureSession()
    let photoOutput = AVCapturePhotoOutput()
    
    var currentVideoDeviceInput: AVCaptureDeviceInput?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
        view.addSubview(previewView)
        view.addSubview(toggleCameraButton)
        view.addSubview(shutterButton)
        
        NSLayoutConstraint.activate([
            previewView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuideCompatible.topAnchor, constant: 50),
            previewView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuideCompatible.leftAnchor, constant: 0),
            previewView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuideCompatible.rightAnchor, constant: 0),
            previewView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuideCompatible.bottomAnchor, constant: 100)
            ])
        
        // preview
        previewView.videoPreviewLayer.videoGravity = .resizeAspect
        previewView.session = captureSession
        
        sessionQueue.async { [weak self] in
           self?.configureSession()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        sessionQueue.async { [weak session = self.captureSession] in
            if let session = session, !session.isRunning {
                session.startRunning()
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        sessionQueue.async { [weak session = self.captureSession] in
            if let session = session, session.isRunning {
                session.stopRunning()
            }
        }
    }
    
    /// Call this on the session queue.
    private func configureSession() {
        guard let captureDevice = CaptureDevice.frontVideoDevice else {
            return
        }
        
        captureSession.beginConfiguration()
        defer {
            captureSession.commitConfiguration()
        }
        
        captureSession.sessionPreset = .photo
        
        // Add video input
        if let videoDeviceInput = try? captureDevice.asDeviceInput() {
            if captureSession.canAddInput(videoDeviceInput) {
                captureSession.addInput(videoDeviceInput)
                currentVideoDeviceInput = videoDeviceInput
                
                // subsequent orientation changes should be handled by viewWillTransition(to:with:)
                DispatchQueue.main.async {
                    let statusBarOrientation = UIApplication.shared.statusBarOrientation
                    var initialVideoOrientation: AVCaptureVideoOrientation = .portrait
                    if statusBarOrientation != .unknown {
                        if let videoOrientation = AVCaptureVideoOrientation(interfaceOrientation: statusBarOrientation) {
                            initialVideoOrientation = videoOrientation
                        }
                    }
                    
                    self.previewView.videoPreviewLayer.connection?.videoOrientation = initialVideoOrientation
                }
            }
        }
        
        // Add photo output.
        if captureSession.canAddOutput(photoOutput) {
            captureSession.addOutput(photoOutput)
            photoOutput.isHighResolutionCaptureEnabled = true
            photoOutput.isLivePhotoCaptureEnabled = photoOutput.isLivePhotoCaptureSupported
            if #available(iOS 11.0, *) {
                photoOutput.isDepthDataDeliveryEnabled = photoOutput.isDepthDataDeliverySupported
            }
        }
        
    }
    
    @objc
    private func onToggleCameraButtonTapped() {
        toggleCamera()
    }
    
    @objc
    private func onShutterButtonTapped() {
        takePhoto()
    }
    
    private func toggleCamera() {
        // ボタンをdisable
        sessionQueue.async { [weak self] in
            guard let `self` = self else {
                return
            }
            
            let currentPosition = self.currentVideoDeviceInput?.device.position ?? .unspecified
            
            let preferredPosition: AVCaptureDevice.Position
            switch currentPosition {
            case .front:
                preferredPosition = .back
            case .unspecified, .back:
                preferredPosition = .front
            }
            
            // 付け替え先
            guard let captureDeviceInput = (try? CaptureDevice.videoDevice(of: preferredPosition)?.asDeviceInput()).flatMap({ $0 }) else {
                // ボタンをenable
                return
            }
            
            self.captureSession.beginConfiguration()
            defer {
                self.captureSession.commitConfiguration()
                // ボタンをenable
            }
            
            if self.captureSession.canAddInput(captureDeviceInput) {
                // 既にあったらremove
                if let videoDeviceInput = self.currentVideoDeviceInput {
                    self.captureSession.removeInput(videoDeviceInput)
                }
                
                // sampleではここで AVCaptureDeviceSubjectAreaDidChange をつけてる
                self.captureSession.addInput(captureDeviceInput)
                
                self.currentVideoDeviceInput = captureDeviceInput
            }
        }
    }
    
    private func takePhoto() {
        //
        sessionQueue.async { [weak self] in
            guard let `self` = self else {
                return
            }
            
            var photoSettings: AVCapturePhotoSettings = AVCapturePhotoSettings()
            if #available(iOS 11.0, *) {
                if photoSettings.availableEmbeddedThumbnailPhotoCodecTypes.contains(AVVideoCodecType.jpeg) {
                    photoSettings = AVCapturePhotoSettings(format: [AVVideoCodecKey: AVVideoCodecType.jpeg])
                }
            } else {
                photoSettings = AVCapturePhotoSettings(format: [AVVideoCodecKey: AVVideoCodecJPEG])
            }
            self.photoOutput.capturePhoto(with: photoSettings, delegate: self)
        }
    }
}

extension CameraViewController: AVCapturePhotoCaptureDelegate {
}
