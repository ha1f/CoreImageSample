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
        print("import Foundation")
        print("import CoreImage")
        print("import AVFoundation")
        print("")
        print("extension CIFilter {")
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
                print("    /// \(filter.displayName ?? filterName)")
                if let url = filter.referenceDocumentationUrl {
                    print("    /// \(url)")
                }
                filter.inputKeys.forEach { inputKey in
                    let information = filter.parameterInformation(forInputKey: inputKey)
                    let description = (information[kCIAttributeDescription] as? String) ?? ""
                    if let defaultValue = information[kCIAttributeDefault] {
                        print("    /// - parameter \(inputKey): \(description) defaultValue = \(defaultValue).")
                    } else {
                        print("    /// - parameter \(inputKey): \(description)")
                    }
                }
                print("    /// ")
                print("    /// - returns: Generated CIFilter (you can get result with \(filter.outputKeys)")
                if let availableIos = filter.availableIos {
                    print("    @available(iOS \(availableIos), *)")
                }
                var methodName = filterName.hasPrefix("CI") ? String(filterName.dropFirst(2)) : filterName
                let initialString = methodName.removeFirst()
                let functionName =  String(initialString).lowercased() + methodName
                print("    static func \(functionName)(\(inputs.joined(separator: ", "))) -> CIFilter? {")
                print("        guard let filter = CIFilter(name: \"\(filterName)\") else {")
                print("            return nil")
                print("        }")
                print("        filter.setDefaults()")
                filter.inputKeys.forEach { inputKey in
                    print("        filter.setValue(\(inputKey), forKey: \"\(inputKey)\")")
                }
                print("        return filter")
                print("    }")
                print("")
        }
        print("}")
    }
}
