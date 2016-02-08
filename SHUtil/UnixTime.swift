//
//  UnixTime.swift
//  SHUtil
//
//  Created by shogo okamuro on 2/9/16.
//  Copyright © 2016 shogo okamuro. All rights reserved.
//

import UIKit

class UNIXTime: NSObject {
    static func convertStringForInt64(unixtime: Int64, format: String) -> String {
        let date = NSDate(timeIntervalSince1970: Double(unixtime))
        
        let formatter = NSDateFormatter()
        formatter.dateFormat = format
        return formatter.stringFromDate(date)
        
    }
}
extension NSDate {
    convenience init?(jsonDate: String) {
        let prefix = "/Date("
        let suffix = ")/"
        let scanner = NSScanner(string: jsonDate)
        
        // Check prefix:
        if scanner.scanString(prefix, intoString: nil) {
            
            // Read milliseconds part:
            var milliseconds : Int64 = 0
            if scanner.scanLongLong(&milliseconds) {
                // Milliseconds to seconds:
                var timeStamp = NSTimeInterval(milliseconds)/1000.0
                
                // Read optional timezone part:
                var timeZoneOffset : Int = 0
                if scanner.scanInteger(&timeZoneOffset) {
                    let hours = timeZoneOffset / 100
                    let minutes = timeZoneOffset % 100
                    // Adjust timestamp according to timezone:
                    timeStamp += NSTimeInterval(3600 * hours + 60 * minutes)
                }
                
                // Check suffix:
                if scanner.scanString(suffix, intoString: nil) {
                    // Success! Create NSDate and return.
                    self.init(timeIntervalSince1970: timeStamp)
                    return
                }
            }
        }
        
        // Wrong format, return nil. (The compiler requires us to
        // do an initialization first.)
        self.init(timeIntervalSince1970: 0)
        return nil
    }
}