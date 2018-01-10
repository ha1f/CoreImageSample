//
//  CanvasViewController.swift
//  CoreImageSample
//
//  Created by はるふ on 2018/01/04.
//  Copyright © 2018年 ha1f. All rights reserved.
//

import UIKit

/// 歪みのないtransform
/// activeFrameを取得できるようにする
/// 実際のフレームはすべてcanvasSizeと揃える
struct LayerFrameState {
    let rotation: CGFloat
    var frame: CGRect
    
    var center: CGPoint {
        return frame.center
    }
    
    init(frame: CGRect = .zero, rotation: CGFloat = 0) {
        self.frame = frame
        self.rotation = rotation
    }
}

protocol LayerStateType {
 }

struct ImageLayerState: LayerStateType {
    let image: UIImage?
    
    init(image: UIImage? = nil) {
        self.image = image
    }
}

struct DrawLayerState: LayerStateType {
    let lines: [DrawLine]
    
    init(lines: [DrawLine] = []) {
        self.lines = lines
    }
}

struct DrawLine {
    let path: UIBezierPath
    let lineColor: UIColor
}

protocol CanvasLayerViewType {
    associatedtype State: LayerStateType
    var state: State { get set }
}

class CanvasLayerView: UIView {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        _commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        _commonInit()
    }
    
    private func _commonInit() {
        layer.borderWidth = 2
        layer.borderColor = UIColor.white.cgColor
    }
    
    func setFrameAndTransform(with state: LayerFrameState) {
        self.frame = state.frame
        self.transform = CGAffineTransform(rotationAngle: state.rotation)
        self.setNeedsLayout()
    }
}

class DrawLayerView: CanvasLayerView, CanvasLayerViewType {
    typealias State = DrawLayerState
    var state: DrawLayerState = DrawLayerState() {
        didSet {
            sizeToFit()
            setNeedsDisplay()
        }
    }
    var frameState: LayerFrameState = LayerFrameState() {
        didSet {
            setFrameAndTransform(with: frameState)
        }
    }
    
    static func instantiate(with state: DrawLayerState) -> DrawLayerView {
        let view = DrawLayerView()
        view.state = state
        return view
    }
    
    override func draw(_ rect: CGRect) {
//        guard let context = UIGraphicsGetCurrentContext() else {
//            return
//        }
        state.lines.forEach { line in
            line.lineColor.setStroke()
            line.path.stroke()
        }
    }
    
    private func _normalizePathAndFrame() {
        let rect = CGRect.containing(self.state.lines.map({ $0.path.bounds }))
        self.frameState = LayerFrameState(frame: rect, rotation: frameState.rotation)
        self.state = DrawLayerState(lines: state.lines.map({ line in
            let path = line.path.offset(byDx: -rect.origin.x, dy: -rect.origin.y)
            return DrawLine(path: path, lineColor: line.lineColor)
        }))
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        if self.state.lines.map({ $0.path.bounds.contains(point) }).contains(where: { $0 }) {
            return self
        } else {
            return nil
        }
    }
}

class ImageLayerView: CanvasLayerView {
    var state: ImageLayerState = ImageLayerState(image: nil) {
        didSet {
            imageView.image = state.image
            self.sizeToFit()
        }
    }
    
    var frameState: LayerFrameState = LayerFrameState() {
        didSet {
            setFrameAndTransform(with: frameState)
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
    
    init(state: ImageLayerState, frameState: LayerFrameState) {
        let view = ImageLayerView.instantiate(with: state)
        view.frameState = frameState
        self = .image(view)
    }
    init(state: DrawLayerState, frameState: LayerFrameState) {
        let view = DrawLayerView.instantiate(with: state)
        view.frameState = frameState
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
            view.backgroundColor = UIColor.clear
            self.addSubview(view)
        case .draw(let view):
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
    
    private lazy var tapGestureRecognizer: UITapGestureRecognizer = {
        let gesture = UITapGestureRecognizer()
        return gesture
    }()
    
    private lazy var pinchGestureRecognizer: UIPinchGestureRecognizer = {
        let gesture = UIPinchGestureRecognizer()
        return gesture
    }()
    
    private lazy var panGestureRecognizer: UIPanGestureRecognizer = {
        let gesture = UIPanGestureRecognizer()
        gesture.minimumNumberOfTouches = 2
        return gesture
    }()
    
    private lazy var moveGestureRecognizer: UIPanGestureRecognizer = {
        let gesture = UIPanGestureRecognizer()
        gesture.minimumNumberOfTouches = 1
        gesture.addTarget(self, action: #selector(self.onMoved(_:)))
        return gesture
    }()
    
    override func viewDidLoad() {
        view.backgroundColor = UIColor.black
        
        view.addSubview(canvasView)
        canvasView.bounds = CGRect(origin: .zero, size: canvasSize)
        
        adjustCanvasViewScale()
        
        canvasView.append(CanvasLayer(state: ImageLayerState(image: #imageLiteral(resourceName: "Lenna.png")), frameState: LayerFrameState(frame: canvasView.bounds, rotation: 0)))
        let path = UIBezierPath(rect: CGRect(x: 10, y: 30, width: 100, height: 40))
        path.lineWidth = 5
        path.lineCapStyle = .round
        canvasView.append(CanvasLayer(state: DrawLayerState(lines: [DrawLine(path: path, lineColor: UIColor.red)]), frameState: LayerFrameState(frame: path.bounds, rotation: 0)))
        
        canvasView.addGestureRecognizer(moveGestureRecognizer)
        // moveGestureRecognizer
        // moveGestureRecognizer.view
    }
    
    @objc
    private func onMoved(_ recognizer: UIPanGestureRecognizer) {
        // print(recognizer.view!.hitTest(recognizer.location(in: recognizer.view!), with: nil))
    }
    
    private func adjustCanvasViewScale() {
        let scale = canvasView.bounds.size.aspectFitScale(to: view.bounds.size)
        canvasView.transform = CGAffineTransform(scaleX: scale, y: scale)
        canvasView.frame.origin = CGPoint(x: 0, y: 100)
    }
}
