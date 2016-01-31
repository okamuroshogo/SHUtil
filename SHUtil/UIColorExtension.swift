//
//  UIColorExtension.swift
//  SHUtil
//
//  Created by shogo okamuro on 1/31/16.
//  Copyright © 2016 shogo okamuro. All rights reserved.
//

public extension UIColor {
    // 0~255
    class func colorWith255(red :Int, green :Int, blue :Int, alpha :Int) -> UIColor {
        return UIColor(red: CGFloat(red)/255.0, green: CGFloat(green)/255.0, blue: CGFloat(blue)/255.0, alpha: CGFloat(alpha)/255.0)
    }
    
    class func colorWith255(red :Int, green :Int, blue :Int) -> UIColor {
        return UIColor.colorWith255(red, green: green, blue: blue, alpha: 255)
    }
    
    
    // Hex
    class func colorWithHexAlpha(hex :UInt32) -> UIColor {
        let r = Int32((hex >> 24) & 0xFF)
        let g = Int32((hex >> 16) & 0xFF)
        let b = Int32((hex >> 8) & 0xFF)
        let a = Int32(hex & 0xFF)
        
        return UIColor.colorWith255(Int(r), green: Int(g), blue: Int(b), alpha: Int(a))
    }
    
    class func colorWithHex(hex :UInt32) -> UIColor {
        let r = Int32((hex & 0xFF0000) >> 16)
        let g = Int32((hex & 0x00FF00) >> 8)
        let b = Int32(hex & 0x0000FF)
        
        return UIColor.colorWith255(Int(r), green: Int(g), blue: Int(b))
    }
    
    
    // Hex String
    class func colorWithHexAlphaString(hex :String) -> UIColor {
        let colorScanner = NSScanner(string: hex)
        var color :UInt32 = 0
        colorScanner.scanHexInt(&color)
        
        return UIColor.colorWithHexAlpha(color)
    }
    
    class func colorWithHexString(hex :String) -> UIColor {
        let colorScanner :NSScanner = NSScanner(string: hex)
        var color :UInt32 = 0
        colorScanner.scanHexInt(&color)
        
        return UIColor.colorWithHex(color)
    }
}