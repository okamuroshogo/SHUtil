//
//  StringExtension.swift
//  SHUtil
//
//  Created by shogo okamuro on 1/31/16.
//  Copyright © 2016 shogo okamuro. All rights reserved.
//

public extension String {
    func urlEncodedString() -> String {
        return self.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!
    }
    
    func urlDecodedString() -> String {
        return self.stringByRemovingPercentEncoding!
    }
}