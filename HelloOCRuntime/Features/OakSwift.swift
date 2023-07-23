//
//  OakSwift.swift
//  HelloOCRuntime
//
//  Created by d on 2023/07/23.
//

import Foundation

@objc public final class OakSwift: NSObject {
  @objc public static func main() {
    var cls: AnyClass? = Oak.self
    while cls != nil {
      print(String(cString: object_getClassName(cls)))
      cls = cls?.superclass()
    }
    
    if let values = oak_propertics(Oak.self) {
      values.forEach { p in
        print("\(p)")
      }
    }
    
    print("========")
    if let values = oak_ivars(Oak.self) {
      values.forEach { v in
        print("\(v)")
      }
    }
  }
}
