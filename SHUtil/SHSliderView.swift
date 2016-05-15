//
//  SHSliderView.swift
//  SeriesAppBase
//
//  Created by shogo okamuro on 5/14/16.
//  Copyright © 2016 shogo okamuro. All rights reserved.
//

import UIKit
import SHUtil

public class SHSliderView: UIView {
    
    public var front = UIImageView()
    public var back  = UIImageView()
    public var thunb = UIImageView()
    
    public var slideValue : CGFloat {
        get{    return self.slideValue   }
        set(p){ self.moveThunb(p)        }
    }
    
//    var startValue : CGFloat {
//        get{    return self.startValue   }
//        set(p){ self.changeStartValue(p) }
//    }
//    
//    var endValue   : CGFloat {
//        get{    return self.endValue     }
//        set(p){ self.changeEndValue(p)   }
//    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.settingView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.settingView()
        
    }
    
    private func settingView(){
        self.backgroundColor = UIColor.orangeColor()
        self.front.backgroundColor = UIColor.clearColor()
        self.thunb.backgroundColor = UIColor.blackColor()
        self.back.backgroundColor = UIColor.yellowColor()
        self.thunb.frame.size = CGSizeMake(30, 30)
        self.thunb.center = CGPointMake(self.width / 2 , self.height / 2)
        self.back.center = CGPointMake(self.width / 2 , self.height / 2)
        
        self.front.frame = self.bounds
        self.back.frame = self.bounds
        self.back.frame.size = CGSizeMake(self.width / 2, self.height)
        self.addSubview(self.back )
        self.addSubview(self.front)
        self.addSubview(self.thunb)
        self.userInteractionEnabled = true
        self.tag = 9999
    }
    
    override public func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesBegan(touches, withEvent: event)
        self.location(touches)
        
    }
    
    override public func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesEnded(touches, withEvent: event)
        self.location(touches)
        
    }
    
    override public func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesEnded(touches, withEvent: event)
        self.location(touches)
    
    }
    
    private func location(touches: Set<UITouch>){
        for touch: UITouch in touches {
            guard let tag = touch.view?.tag else{ return }
            if tag != 9999 { return }
            let x = touch.locationInView(self).x / self.bounds.size.width
            if x < 0 || x > 1 { return }
            self.slideValue = x
        }
    }
    
    private func moveThunb(x :CGFloat){
        let val = x * self.bounds.size.width
        self.back.frame.size = CGSizeMake(val, self.back.height)
        self.thunb.center.x = val

        
    }
    
//    private func changeStartValue(val :CGFloat){
//        
//    
//    }
//    
//    private func changeEndValue(val :CGFloat){
//    
//    }
    
}


