//
//  DrawGestureRecognizer.swift
//  CoreImageSample
//
//  Created by はるふ on 2018/01/05.
//  Copyright © 2018年 ha1f. All rights reserved.
//

import UIKit
// necessary to write `.state`
import UIKit.UIGestureRecognizerSubclass

/// DrawGestureRecognizer is useful to detect All gestures without blocking scale/move gestures
/// PanGestureRecognizer begins recognizing after certain move, and this delay is annoying.
/// UILongPressGestureRecognizer with setting `minimumPressDuration = 0.0` is one solution, but this blocks
/// scale/move gesture. Since this Recognizer begins recognizing immediately after the first touch,
/// we must tap two fingers exactly the same time to scale/move.
class DrawGestureRecognizer: UIGestureRecognizer {
    
    // MARK: - Properties
    var trackedTouch: UITouch?
    
    // MARK: - UIGestureRecognizer
    override func reset() {
        super.reset()
        trackedTouch = nil
    }
    
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent) {
        super.touchesBegan(touches, with: event)
        if trackedTouch == nil && touches.count == 1 && state == .possible {
            trackedTouch = touches.first!
        } else if trackedTouch != nil && state == .possible {
            state = .failed
        }
    }
    
    open override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent) {
        super.touchesMoved(touches, with: event)
        guard let touch = trackedTouch, touches.contains(touch) && state != .failed else {
            return
        }
        if state == .possible {
            state = .began
        } else {
            state = .changed
        }
    }
    
    open override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent) {
        super.touchesEnded(touches, with: event)
        guard let touch = trackedTouch, touches.contains(touch) && state != .failed else {
            return
        }
        if state == .possible {
            state = .began
            // In iOS 9, state change is not notified before previous notification on main thread
            DispatchQueue.main.async {
                self.state = .ended
            }
        } else {
            state = .ended
        }
    }
    
    open override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent) {
        super.touchesCancelled(touches, with: event)
        guard let touch = trackedTouch, touches.contains(touch) && state != .failed else {
            return
        }
        
        if state == .possible {
            state = .began
            // In iOS 9, state change is not notified before previous notification on main thread
            DispatchQueue.main.async {
                self.state = .cancelled
            }
        } else {
            state = .cancelled
        }
    }
    
    override func location(in view: UIView?) -> CGPoint {
        return trackedTouch?.location(in: view) ?? .zero
    }
}
