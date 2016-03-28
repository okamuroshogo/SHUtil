//
//  UIButtonExtension.swift
//  SHUtil
//
//  Created by shogo okamuro on 3/28/16.
//  Copyright © 2016 shogo okamuro. All rights reserved.
//

private var HighlightedBackgroundColorKey = 0
private var NormalBackgroundColorKey = 0

extension UIButton {
    
    @IBInspectable var highlightedBackgroundColor: UIColor? {
        get {
            return objc_getAssociatedObject(self, &HighlightedBackgroundColorKey) as? UIColor
        }
        
        set(newValue) {
//            objc_setAssociatedObject(self,
//                                     &HighlightedBackgroundColorKey, newValue, UInt(OBJC_ASSOCIATION_RETAIN))
            
            
            objc_setAssociatedObject(self, &HighlightedBackgroundColorKey, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    private var normalBackgroundColor: UIColor? {
        get {
            return objc_getAssociatedObject(self, &NormalBackgroundColorKey) as? UIColor
        }
        
        set(newValue) {
//            objc_setAssociatedObject(self,
//                                     &NormalBackgroundColorKey, newValue, UInt(OBJC_ASSOCIATION_RETAIN))
            
            objc_setAssociatedObject(self, &NormalBackgroundColorKey, newValue, .OBJC_ASSOCIATION_RETAIN)

        }
    }
    
    override public var backgroundColor: UIColor? {
        didSet {
            if !highlighted {
                normalBackgroundColor = backgroundColor
            }
        }
    }
    
    override public var highlighted: Bool {
        didSet {
            if let highlightedBackgroundColor = self.highlightedBackgroundColor {
                if highlighted {
                    backgroundColor = highlightedBackgroundColor
                } else {
                    backgroundColor = normalBackgroundColor
                }
            }
        }
    }
}
