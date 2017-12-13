//
//  CIFilter+Extension.swift
//  CoreImageSample
//
//  Created by ST20591 on 2017/12/11.
//  Copyright © 2017年 ha1f. All rights reserved.
//

import Foundation
import CoreImage
import AVFoundation

extension CIFilter {
    var displayName: String? {
        return self.attributes[kCIAttributeDisplayName] as? String
    }
    
    var filterName: String? {
        return self.attributes[kCIAttributeFilterName] as? String
    }
    
    var referenceDocumentationUrl: URL? {
        return self.attributes[kCIAttributeReferenceDocumentation] as? URL
    }
    
    var availableIos: String? {
        return self.attributes[kCIAttributeFilterAvailable_iOS] as? String
    }
    
    private func parameterInformation(forInputKey inputKey: String) -> [String: Any] {
        return (self.attributes[inputKey] as? [String: Any]) ?? [:]
    }
    
    static func generateCode() {
        let printer = CodePrinter()
        printer.print("import Foundation")
        printer.print("import CoreImage")
        printer.print("import AVFoundation")
        printer.print("")
        printer.print("extension CIFilter {")
        printer.shiftRight()
        CIFilter.filterNames(inCategory: kCICategoryBuiltIn)
            .forEach { filterName in
                guard let filter = CIFilter(name: filterName) else {
                    return
                }
                let inputs: [String] = filter.inputKeys.map { inputKey in
                    let information = filter.parameterInformation(forInputKey: inputKey)
                    let type = (information[kCIAttributeClass].map { "\($0)" } ?? "")
                    let defaultValue = information[kCIAttributeDefault]
                    if let value = defaultValue as? NSNumber {
                        return "\(inputKey): \(type) = \(value)"
                    } else if let value = defaultValue as? NSString {
                        return "\(inputKey): \(type) = \"\(value)\""
                    } else {
                        return "\(inputKey): \(type)"
                    }
                }
                let filterDisplayName = filter.displayName ?? filterName
                printer.print("")
                printer.print("/// \(filterDisplayName)")
                if let url = filter.referenceDocumentationUrl {
                    printer.print("/// - SeeAlso: [Reference/\(filterDisplayName)](\(url))")
                }
                printer.print("/// ")
                filter.inputKeys.forEach { inputKey in
                    let information = filter.parameterInformation(forInputKey: inputKey)
                    let description = (information[kCIAttributeDescription] as? String) ?? ""
                    if let defaultValue = information[kCIAttributeDefault] {
                        printer.print("/// - parameter \(inputKey): \(description) defaultValue = \(defaultValue).")
                    } else {
                        printer.print("/// - parameter \(inputKey): \(description)")
                    }
                }
                printer.print("/// ")
                printer.print("/// - returns: Generated CIFilter (you can get result with \(filter.outputKeys))")
                if let availableIos = filter.availableIos {
                    printer.print("@available(iOS \(availableIos), *)")
                }
                
                // 関数名はfilterNameからCIを除いて、lowerCamelCaseにしたもの
                var methodName = filterName.hasPrefix("CI") ? String(filterName.dropFirst(2)) : filterName
                let initialString = methodName.removeFirst()
                let functionName =  String(initialString).lowercased() + methodName
                
                printer.print("static func \(functionName)(\(inputs.joined(separator: ", "))) -> CIFilter? {")
                printer.withShiftedRight {
                    let filterVariableName = "filter"
                    printer.print("guard let \(filterVariableName) = CIFilter(name: \"\(filterName)\") else {")
                    printer.withShiftedRight {
                        printer.print("return nil")
                    }
                    printer.print("}")
                    printer.print("\(filterVariableName).setDefaults()")
                    filter.inputKeys.forEach { inputKey in
                        printer.print("\(filterVariableName).setValue(\(inputKey), forKey: \"\(inputKey)\")")
                    }
                    printer.print("return \(filterVariableName)")
                }
                printer.print("}")
        }
        printer.shiftLeft()
        printer.print("}")
        printer.commitPrint()
    }
}
