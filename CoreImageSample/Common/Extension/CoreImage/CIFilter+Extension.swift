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
    
    private static func initializerString(for cgAffineTransform: CGAffineTransform) -> String {
        return "CGAffineTransform(a: \(cgAffineTransform.a), b: \(cgAffineTransform.b), c: \(cgAffineTransform.c), d: \(cgAffineTransform.d), tx: \(cgAffineTransform.tx), ty: \(cgAffineTransform.ty))"
    }
    
    private static func initializerString(for ciVector: CIVector) -> String {
        switch ciVector.count {
        case 1:
            return "CIVector(x: \(ciVector.x))"
        case 2:
            return "CIVector(x: \(ciVector.x), y: \(ciVector.y))"
        case 3:
            return "CIVector(x: \(ciVector.x), y: \(ciVector.y), z: \(ciVector.z))"
        case 4:
            return "CIVector(x: \(ciVector.x), y: \(ciVector.y), z: \(ciVector.z), w: \(ciVector.w))"
        default:
            return "CIVector()"
        }
    }
    
    // not complete dictionary
    private static let inputKeyConstantDict: [String: String] = [
        kCIInputImageKey: "kCIInputImageKey",
        kCIInputEVKey: "kCIInputEVKey",
        kCIInputBiasKey: "kCIInputBiasKey",
        kCIInputTimeKey: "kCIInputTimeKey",
        kCIInputAngleKey: "kCIInputAngleKey",
        kCIInputBoostKey: "kCIInputBoostKey",
        kCIInputColorKey: "kCIInputColorKey",
        kCIInputScaleKey: "kCIInputScaleKey",
        kCIInputWidthKey: "kCIInputWidthKey",
        kCIInputCenterKey: "kCIInputCenterKey",
        kCIInputExtentKey: "kCIInputExtentKey",
        kCIInputRadiusKey: "kCIInputRadiusKey",
        kCIInputContrastKey: "kCIInputContrastKey",
        kCIInputVersionKey: "kCIInputVersionKey",
        kCIInputWeightsKey: "kCIInputWeightsKey",
        kCIInputIntensityKey: "kCIInputIntensityKey",
        kCIInputMaskImageKey: "kCIInputMaskImageKey",
        kCIInputSharpnessKey: "kCIInputSharpnessKey",
        kCIInputTransformKey: "kCIInputTransformKey",
        kCIInputBrightnessKey: "kCIInputBrightnessKey",
        kCIInputBackgroundImageKey: "kCIInputBackgroundImageKey"
    ]
    private static func inputKeyStringString(for inputKeyString: String) -> String {
        return inputKeyConstantDict.first(where: { $0.key == inputKeyString })?.value
            ?? "\"\(inputKeyString)\""
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
                    let typeString = (information[kCIAttributeClass].map { "\($0)" } ?? "")
                    let defaultValue = information[kCIAttributeDefault]
                    if let value = defaultValue as? NSNumber {
                        return "\(inputKey): \(typeString) = \(value)"
                    } else if let value = defaultValue as? NSString {
                        return "\(inputKey): \(typeString) = \"\(value)\""
                    } else if let value = defaultValue as? CGAffineTransform {
                        return "\(inputKey): \(typeString) = NSValue(cgAffineTransform:  \(initializerString(for: value)))"
                    } else if let ciVector = defaultValue as? CIVector {
                        return "\(inputKey): \(typeString) = \(initializerString(for: ciVector))"
                    } else {
                        return "\(inputKey): \(typeString)"
                    }
                }
                let filterDisplayName = filter.displayName ?? filterName
                printer.print("")
                if let url = filter.referenceDocumentationUrl {
                    // I don't know why, but SeeAlso does not work on my Xcode.
                    // printer.print("/// \(filterDisplayName)")
                    // printer.print("/// - SeeAlso: [Reference/\(filterDisplayName)](\(url))")
                    printer.print("/// [\(filterDisplayName)](\(url))")
                } else {
                    printer.print("/// \(filterDisplayName)")
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
                        printer.print("\(filterVariableName).setValue(\(inputKey), forKey: \(inputKeyStringString(for: inputKey)))")
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
