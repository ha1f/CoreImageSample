//
//  CodePrinter.swift
//  CoreImageSample
//
//  Created by はるふ on 2017/12/13.
//  Copyright © 2017年 ha1f. All rights reserved.
//

import Foundation

class CodePrinter {
    struct CodePrinterLine {
        let code: String
        let indentLevel: Int
    }
    
    let indentString: String
    private(set) var currentIndentLevel: Int = 0
    private var buffer: [CodePrinterLine] = []
    
    init(indentString: String = "    ") {
        self.indentString = indentString
        printSign()
    }
    
    func commitPrint() {
        Swift.print(
            buffer
                .map { String(repeating: indentString, count: $0.indentLevel) + $0.code }
                .joined(separator: "\n")
        )
    }
    
    func printSign() {
        print("""
//
//  Created by はるふ on 2017/12/11.
//  Copyright © 2017年 ha1f. All rights reserved.
//

""")
        
    }
    
    func print(_ code: String) {
        buffer.append(CodePrinterLine(code: code, indentLevel: currentIndentLevel))
    }
    func shiftRight() {
        currentIndentLevel += 1
    }
    func shiftLeft() {
        currentIndentLevel -= 1
    }
    
    func withShiftedRight(_ closure: () -> Void) {
        shiftRight()
        closure()
        shiftLeft()
    }
}
