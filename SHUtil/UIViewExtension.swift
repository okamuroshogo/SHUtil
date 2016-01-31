//
//  UIViewExtension.swift
//  SHUtil
//
//  Created by shogo okamuro on 1/31/16.
//  Copyright © 2016 shogo okamuro. All rights reserved.
//

@IBDesignable
public extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable var borderWidth :CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var borderColor :UIColor {
        get {
            return (layer.borderColor != nil) ? UIColor(CGColor: layer.borderColor!) : UIColor.whiteColor()
        }
        set {
            layer.borderColor = newValue.CGColor
        }
    }
}


public extension UIView {
    var x: CGFloat {
        get {
            return frame.minX
        }
        set {
            frame = CGRect(newValue, frame.minY, frame.width, frame.height)
        }
    }
    
    var y: CGFloat {
        get {
            return frame.minY
        }
        set {
            frame = CGRect(frame.minX, newValue, frame.width, frame.height)
        }
    }
    
    var width: CGFloat {
        get {
            return frame.width
        }
        set {
            frame = CGRect(frame.minX, frame.width, newValue, frame.height)
        }
    }
    var height: CGFloat {
        get {
            return frame.height
        }
        set {
            frame = CGRect(frame.minX, frame.minY, frame.width, newValue)
        }
    }
    var top: CGFloat {
        get {
            return y
        }
        set {
            y = newValue
        }
    }
    var bottom: CGFloat {
        get {
            return frame.maxY
        }
        set {
            frame = CGRect(x, newValue - height, width, height)
        }
    }
    
    var left: CGFloat {
        get {
            return x
        }
        set {
            x = newValue
        }
    }
    
    var right: CGFloat {
        get {
            return frame.maxX
        }
        set {
            frame = CGRect(newValue - width, y, width, height)
        }
    }
    
    var midX: CGFloat {
        get {
            return frame.midX
        }
        set {
            frame = CGRect(newValue - width / 2, y, width, height)
        }
    }
    var midY: CGFloat {
        get {
            return frame.midY
        }
        set {
            frame = CGRect(x, newValue - height / 2, width, height)
        }
    }
    var centerPoint: CGPoint {
        get {
            return CGPoint(frame.midX, frame.midY)
        }
        set {
            frame = CGRect(newValue.x - width / 2, newValue.y - height / 2, width, height)
        }
    }
}