//
//  CoreGraphicsExtension.swift
//  SHUtil
//
//  Created by shogo okamuro on 1/31/16.
//  Copyright © 2016 shogo okamuro. All rights reserved.
//

public extension CGPoint {
    init(_ x: CGFloat, _ y: CGFloat) {
        self.x = x
        self.y = y
    }
}

public extension CGSize {
    init(_ width: CGFloat, _ height: CGFloat) {
        self.width = width
        self.height = height
        }
    }

public extension CGRect {
    init(_ x: CGFloat, _ y: CGFloat, _ width: CGFloat, _ height: CGFloat) {
        self.origin = CGPoint(x, y)
        self.size = CGSize(width, height)
    }
}
