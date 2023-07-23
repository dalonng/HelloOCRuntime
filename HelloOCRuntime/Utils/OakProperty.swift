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
}

extension OakProperty: CustomStringConvertible {
  public var description: String {
    "<name: \(name), attributes: \(attributes)>"
  }
}

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
    oak_properties.append(OakProperty(name: String(cString: property_getName(property)), attributes: attributes))
  }
  return oak_properties
}
