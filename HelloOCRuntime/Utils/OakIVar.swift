//
//  OakIVar.swift
//  HelloOCRuntime
//
//  Created by d on 2023/07/23.
//

import Foundation

struct OakIVar {
  let name: String
  let offset: Int
  let typeEncoding: String
}

extension OakIVar: CustomStringConvertible {
  public var description: String {
    "<name: \(name), offset: \(offset), typeEncoding: \(typeEncoding)>"
  }
}

func oak_ivars(_ klass: AnyClass?) -> [OakIVar]? {
  var count: UInt32 = 0
  var oak_ivars = [OakIVar]()
  let ivars = class_copyIvarList(klass, &count)
  defer { ivars?.deallocate() }
  
  for i in 0..<Int(count) {
    guard let ivar = ivars?[i] else {
      continue
    }
    
    var name = "no name"
    if let s = ivar_getName(ivar) {
      name = String(cString: s)
    }
    var typeEncoding = "no typeEncoding"
    if let s = ivar_getTypeEncoding(ivar) {
      typeEncoding = String(cString: s)
    }
    oak_ivars.append(OakIVar(name: name, offset: ivar_getOffset(ivar), typeEncoding: typeEncoding))
  }
  return oak_ivars
}
