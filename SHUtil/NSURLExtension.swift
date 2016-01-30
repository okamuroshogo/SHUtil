//
//  NSURLExtension.swift
//  SHUtil
//
//  Created by shogo okamuro on 1/31/16.
//  Copyright © 2016 shogo okamuro. All rights reserved.
//

public extension NSURL{
    func parseGetArgments() -> Dictionary<String, String>{
        let originalUrl = self.absoluteString
        let url = originalUrl.componentsSeparatedByString("?")
        let core = url[1]
        let params = core.componentsSeparatedByString("&")
        var dict : Dictionary<String, String> = Dictionary<String, String>()
        
        for param in params{
            let keyValue = param.componentsSeparatedByString("=")
            dict[keyValue[0]] = keyValue[1]
        }
        return dict
    }
}
