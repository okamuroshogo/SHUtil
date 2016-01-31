//
//  UIAlertController.swift
//  SHUtil
//
//  Created by shogo okamuro on 1/31/16.
//  Copyright © 2016 shogo okamuro. All rights reserved.
//

import UIKit

public extension UIAlertController {
    
    class func singleBtnAlertWithTitle(title: String, message: String, completion: (() -> Void)?) -> UIAlertController
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: {
            (action:UIAlertAction!) -> Void in
            if let completion = completion {
                completion()
            }
        }))
        return alert
    }
    
    class func doubleBtnAlertWithTitle(title: String, message: String, otherBtnTitle:String, completion: (() -> Void)?) -> UIAlertController
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "OK", style: .Cancel, handler: nil))
        alert.addAction(UIAlertAction(title: otherBtnTitle, style: .Default, handler: {
            (action:UIAlertAction!) -> Void in
            if let completion = completion {
                completion()
            }
        }))
        return alert
    }

}
