//
//  CodePrinter.swift
//  CoreImageSample
//
//  Created by はるふ on 2017/12/13.
//  Copyright © 2017年 ha1f. All rights reserved.
//

import Foundation

class CodePrinter {
    let indent: String
    private(set) var currentIndent: Int = 0
    private var buffer: String = ""
    
    init(indent: String = "    ") {
        self.indent = indent
        printSign()
    }
    
    func commitPrint() {
        Swift.print(buffer)
        buffer = ""
    }
    
    func printSign() {
        print("""
//
//  CIFilter+Extension_generated.swift
//  CoreImageSample
//
//  Created by はるふ on 2017/12/11.
//  Copyright © 2017年 ha1f. All rights reserved.
//

""")
        
    }
    
    func print(_ code: String) {
        buffer += String(repeating: indent, count: currentIndent) + code + "\n"
    }
    func shiftRight() {
        currentIndent += 1
    }
    func shiftLeft() {
        currentIndent -= 1
    }
    
    func withShiftedRight(_ closure: () -> Void) {
        shiftRight()
        closure()
        shiftLeft()
    }
}
