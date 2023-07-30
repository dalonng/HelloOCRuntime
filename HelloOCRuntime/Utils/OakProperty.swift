//
//  OakProperty.swift
//  HelloOCRuntime
//
//  Created by d on 2023/07/23.
//

import Foundation
import ObjectiveC

@frozen
public struct OakProperty {
  let name: String
  let attributes: String
  let typeEncoding: String
  let isReferenceType: Bool
  let ivarName: String
}

extension OakProperty: CustomStringConvertible {
  public var description: String {
"""
{
           name: \(name)
   typeEncoding: \(typeEncoding)
isReferenceType: \(isReferenceType)
       ivarName: \(ivarName)
}
"""
  }
}

// MARK: - oak_propertics

func oak_propertics(_ klass: AnyClass?) -> [OakProperty]? {
  var count_of_properties: UInt32 = 0
  var oak_properties = [OakProperty]()
  let properties = class_copyPropertyList(klass, &count_of_properties)
  defer { properties?.deallocate() }
  
  for i in 0..<Int(count_of_properties) {
    guard let property = properties?[i] else {
      continue
    }
    
    var attributes = "no attributes"
    if let s = property_getAttributes(property) {
      attributes = String(cString: s)
    }
    
    var count: UInt32 = 0
    let attributeList = property_copyAttributeList(property, &count)
    var typeEncoding = ""
    var isReferenceType = false
    var ivarName = ""
    for i in 0..<Int(count) {
      guard let attribute = attributeList?[i] else {
        continue
      }
      let name = String(cString: attribute.name)
      if name == "T" {
        let value = String(cString: attribute.value).trimmingCharacters(in: CharacterSet(charactersIn: "@\""))
        typeEncoding = value
      } else if name == "&" {
        isReferenceType = true
      } else if name == "V" {
        ivarName = String(cString: attribute.value)
      }

    }
    
    oak_properties.append(OakProperty(name: String(cString: property_getName(property)),
                                      attributes: attributes,
                                      typeEncoding: typeEncoding,
                                      isReferenceType: isReferenceType,
                                      ivarName: ivarName))
  }
  return oak_properties
}
