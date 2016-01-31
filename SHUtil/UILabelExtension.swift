//
//  UILabelExtension.swift
//  SHUtil
//
//  Created by shogo okamuro on 1/31/16.
//  Copyright © 2016 shogo okamuro. All rights reserved.
//

public extension UILabel {
    func setFontByString(fontName: String){
        self.font = UIFont(name: fontName, size: self.font.pointSize)
    }
    func setFontByStringWithSize(fontName: String, size: CGFloat){
        self.font = UIFont(name: fontName, size: size)
    }
}