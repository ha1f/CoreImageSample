//
//  Array+Extension.swift
//  CoreImageSample
//
//  Created by はるふ on 2018/01/05.
//  Copyright © 2018年 ha1f. All rights reserved.
//

import Foundation

extension Array {
    var pointer: UnsafeMutablePointer<Element> {
        return UnsafeMutablePointer<Element>(mutating: self)
    }
    func dangerouslySetValues(_ value: Element, from index: Int, count: Int) {
        pointer.advanced(by: index).initialize(to: value, count: count)
    }
    func setValues(_ value: Element, from index: Int, count: Int) {
        guard index < count else {
            return
        }
        let validCount = Swift.max(count - index, count)
        pointer.advanced(by: index).initialize(to: value, count: validCount)
    }
}
