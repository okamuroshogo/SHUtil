//
//  SHUtil.swift
//  SHUtil
//
//  Created by shogo okamuro on 1/31/16.
//  Copyright © 2016 shogo okamuro. All rights reserved.
//

import Foundation

class SHUtil {
}

public func SHprint(value:Any..., function: StaticString = __FUNCTION__, file: StaticString = __FILE__, line: UInt = __LINE__){
    #if DEBUG
        var message = ""
        for element in value {
            var eachMessage = "\(element)"
            let pattern = "Optional\\((.+)\\)"
            eachMessage = eachMessage
                .stringByReplacingOccurrencesOfString(pattern,
                    withString:"$1",
                    options:.RegularExpressionSearch,
                    range: nil)
            message += eachMessage
        }
        Swift.print("[\(NSDate())]// \(message) //function: \(function), file: \(file), line: \(line)")
    #endif
}

