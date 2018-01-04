//
//  CanvasViewController.swift
//  CoreImageSample
//
//  Created by はるふ on 2018/01/04.
//  Copyright © 2018年 ha1f. All rights reserved.
//

import UIKit

struct TransformState {
    let position: CGPoint = .zero
    let scaleX: CGFloat = 1.0
    let scaleY: CGFloat = 1.0
    let rotation: CGFloat = 0
    
    func asCGAffineTransform() -> CGAffineTransform {
        return CGAffineTransform(translationX: position.x, y: position.y)
            .rotated(by: rotation)
            .scaledBy(x: scaleX, y: scaleY)
    }
}

protocol LayerStateType {
    var transformState: TransformState { get }
}

struct ImageLayerState {
    let transformState: TransformState = TransformState()
    let image: UIImage?
}

struct DrawLayerState {
    let transformState: TransformState = TransformState()
    let lines: [DrawLine]
    
    init(lines: [DrawLine] = []) {
        self.lines = lines
    }
}

struct DrawLine {
    let drawLineConfig: DrawLineConfig
    let path: UIBezierPath
}

struct DrawLineConfig {
    let width: CGFloat
    let lineColor: UIColor
    let lineCap: CGLineCap = CGLineCap.round
    let lineJoin: CGLineJoin = CGLineJoin.round
}

protocol CanvasLayerViewType {
    associatedtype State
    var state: State { get set }
}

class DrawLayerView: UIView, CanvasLayerViewType {
    typealias State = DrawLayerState
    var state: DrawLayerState = DrawLayerState() {
        didSet {
            self.transform = state.transformState.asCGAffineTransform()
            setNeedsDisplay()
        }
    }
    
    static func instantiate(with state: DrawLayerState) -> DrawLayerView {
        let view = DrawLayerView()
        view.state = state
        return view
    }
    
    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        state.lines.forEach { line in
            context.setLineCap(line.drawLineConfig.lineCap)
            context.setLineJoin(line.drawLineConfig.lineJoin)
            context.setLineWidth(line.drawLineConfig.width)
            context.addPath(line.path.cgPath)
            line.drawLineConfig.lineColor.setStroke()
            context.strokePath()
        }
    }
}

class ImageLayerView: UIView {
    var state: ImageLayerState = ImageLayerState(image: nil) {
        didSet {
            self.transform = state.transformState.asCGAffineTransform()
            imageView.image = state.image
        }
    }
    
    private lazy var imageView = UIImageView()
    
    static func instantiate(with state: ImageLayerState) -> ImageLayerView {
        let view = ImageLayerView()
        view._setup()
        view.state = state
        return view
    }
    
    private func _setup() {
        self.addSubview(imageView)
        imageView.constraintTo(frameOf: self)
    }
}

enum CanvasLayerHistory {
    // target, oldState
}

enum CanvasLayer {
    case image(ImageLayerView)
    case draw(DrawLayerView)
    
    init(state: ImageLayerState) {
        let view = ImageLayerView.instantiate(with: state)
        self = .image(view)
    }
    init(state: DrawLayerState) {
        let view = DrawLayerView.instantiate(with: state)
        self = .draw(view)
    }
}

class CanvasView: UIView {
    private var layers: [CanvasLayer] = []
    var currentLayer: CanvasLayer? = nil {
        didSet {
            // ツールを切り替える
        }
    }
    
    func append(_ layer: CanvasLayer) {
        switch layer {
        case .image(let view):
            view.frame = self.bounds
            view.backgroundColor = UIColor.clear
            self.addSubview(view)
        case .draw(let view):
            view.frame = self.bounds
            view.backgroundColor = UIColor.clear
            self.addSubview(view)
        }
        currentLayer = layer
    }
}

class CanvasViewController: UIViewController {
    
    var canvasSize: CGSize = CGSize(width: 512, height: 512)
    
    private lazy var canvasView: CanvasView = {
        let view = CanvasView()
        view.backgroundColor = UIColor.lightGray
        return view
    }()
    
    override func viewDidLoad() {
        view.backgroundColor = UIColor.black
        
        view.addSubview(canvasView)
        canvasView.bounds = CGRect(origin: .zero, size: canvasSize)
        
        adjustCanvasViewScale()
        
        canvasView.append(CanvasLayer(state: ImageLayerState(image: #imageLiteral(resourceName: "Lenna.png"))))
        let path = UIBezierPath(rect: CGRect(x: 10, y: 10, width: 400, height: 40))
        canvasView.append(CanvasLayer(state: DrawLayerState(lines: [DrawLine(drawLineConfig: DrawLineConfig(width: 5, lineColor: UIColor.red), path: path)])))
    }
    
    private func adjustCanvasViewScale() {
        print(canvasView.bounds.size, view.bounds.size)
        let scale = canvasView.bounds.size.aspectFitScale(to: view.bounds.size)
        canvasView.transform = CGAffineTransform(scaleX: scale, y: scale)
        canvasView.frame.origin = CGPoint(x: 0, y: 100)
    }
}
