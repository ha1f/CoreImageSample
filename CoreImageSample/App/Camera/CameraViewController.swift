//
//  CameraViewController.swift
//  CoreImageSample
//
//  Created by ST20591 on 2017/12/13.
//  Copyright © 2017年 ha1f. All rights reserved.
//

import UIKit
import AVFoundation

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
    
    /// Communicate with the session and other session objects on this queue.
    private let sessionQueue = DispatchQueue(label: "session queue")
    
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
        
        configureSession()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        _startSessionIfNeeded()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        _stopSessionIfNeeded()
    }
    
    private func _startSessionIfNeeded() {
        sessionQueue.async { [weak session = self.captureSession] in
            if let session = session, !session.isRunning {
                session.startRunning()
            }
        }
    }
    
    private func _stopSessionIfNeeded() {
        sessionQueue.async { [weak session = self.captureSession] in
            if let session = session, session.isRunning {
                session.stopRunning()
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
    
    /// Call this on the session queue.
    private func _configureSession() {
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
                
                // TODO: subsequent orientation changes should be handled by viewWillTransition(to:with:)
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
    
    func configureSession() {
        sessionQueue.async { [weak self] in
            self?.configureSession()
        }
    }
    
    /// Call this on the session queue.
    private func _toggleCamera() {
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
    
    func toggleCamera() {
        // TODO: ここでボタンをdisableする
        sessionQueue.async { [weak self] in
            self?._toggleCamera()
        }
    }
    
    private func _takePhoto() {
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
    
    func takePhoto() {
        sessionQueue.async { [weak self] in
            self?._takePhoto()
        }
    }
}

extension CameraViewController: AVCapturePhotoCaptureDelegate {
}
