//
//  NSObjectExtension.swift
//  SHUtil
//
//  Created by shogo okamuro on 1/31/16.
//  Copyright © 2016 shogo okamuro. All rights reserved.
//

public extension NSObject {
    class var className: String {
        get {
            return NSStringFromClass(self).componentsSeparatedByString(".").last!
        }
    }
    
    var className: String {
        get {
            return self.dynamicType.className
        }
    }
}
