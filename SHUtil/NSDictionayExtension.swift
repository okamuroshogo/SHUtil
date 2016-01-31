//
//  NSDictionayExtension.swift
//  SHUtil
//
//  Created by shogo okamuro on 1/31/16.
//  Copyright © 2016 shogo okamuro. All rights reserved.
//

public extension NSDictionary {
    // @{ @"key":@"value", ...}   =>  "key=value&..." に変換
    func httpBuildQuery() -> String {
        // 再帰関数
        var buildQuery :((String, AnyObject) -> String)!
        buildQuery = { (key :String, value :AnyObject) -> String in
            var str = String()
            
            if(value is NSArray) {
                // arrayの場合
                var idx :Int = 0
                for element in (value as! NSArray) {
                    str += buildQuery(key + "[" + String(idx) + "]", element)
                    idx++
                }
            } else if (value is NSDictionary) {
                // dictionaryの場合
                let valueDict = value as! NSDictionary
                for element in (valueDict.allKeys as! [String]) {
                    str += buildQuery(key + "[" + element + "]", valueDict[element]!)
                }
            } else {
                str += key.urlEncodedString() + "=" + (value as! String).urlEncodedString() + "&"
            }
            
            return str
        }
        
        var str = ""
        for key in (self.allKeys as! [String]) {
            str += buildQuery(key, self[key]!)
        }
        
        // 最後の & は削除する
        str = str.stringByTrimmingCharactersInSet(NSCharacterSet(charactersInString: "&"))
        
        return str
    }
    
}

