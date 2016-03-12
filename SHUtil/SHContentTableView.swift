//
//  SHContentTableView.swift
//  SHUtil
//
//  Created by shogo okamuro on 2/6/16.
//  Copyright © 2016 shogo okamuro. All rights reserved.
//

import UIKit

public protocol SHContentTableViewdelegate{
    func tapLeftItem(sender: AnyObject)
    func tapRightItem(sender: AnyObject)
    func tapStatusBar(sender: AnyObject?)
}

public class SHContentTableView: UIView {
    public var tableView : UITableView!
    
    public var status_btn : UIButton!
    
    //contentView
    public var top_image: UIImageView!
    public var contentView: UIView!
    public var navi_view: UIView!
    public var navi_imageview: UIImageView!
    
    let CONTENT_RATIO_W = CGFloat(16.0)
    let CONTENT_RATIO_H = CGFloat(9.0)
    let SIDE_ITEM_W = CGFloat(40.0)
    
    var blurEffect_hight = CGFloat(60)
    var effectView : UIVisualEffectView!
    var content_height = CGFloat(0)
    var navi_view_height = CGFloat(64)
    
    //contentViewParts
    public var title_label: UILabel!
    public var search_btn: UIButton!
    public var category_open: UIButton!
    
    //tabbarController
    let tab_height = CGFloat(0)
    
    //statusBar
    var statusHeight = CGFloat(0)
    
    var content_vertical = CGFloat(0)
    var navibar_vertical = CGFloat(0)
    var open_category_vertical = CGFloat(0)
    var search_vertical = CGFloat(0)
    var title_vertical = CGFloat(0)
    
    //delegate
    public var delegate :SHContentTableViewdelegate? = nil
    
    public func shcontentTableViewInit(tableView : UITableView){
        contentPartsInit(tableView)
        updateFrame()
        setTableViewInset()
        effectViewInit()
        setContentView()
    }
    
    func contentPartsInit(tableView : UITableView){
        self.tableView = tableView
        self.top_image = UIImageView()
        self.contentView = UIView()
        self.navi_view = UIView()
        self.navi_imageview = UIImageView(image: UIImage(named: ""))
        self.navi_imageview.contentMode = .ScaleToFill
        
        self.status_btn = UIButton()
        self.status_btn.addTarget(self, action: "statusTaped:", forControlEvents: .TouchUpInside)
        
        self.title_label = UILabel()
        self.title_label.textColor = UIColor.whiteColor()
        self.title_label.frame.size = CGSizeMake(self.frame.width - SIDE_ITEM_W * 2 , self.navi_view_height)
        self.title_label.textAlignment = NSTextAlignment.Center
        self.title_label.font = UIFont.systemFontOfSize(25)
        
        self.search_btn = UIButton()
        self.search_btn.frame.size = CGSizeMake(SIDE_ITEM_W , self.navi_view_height)
        self.search_btn.addTarget(self, action: "rightTapped:", forControlEvents:.TouchUpInside)
        
        self.category_open = UIButton()
        self.category_open.frame.size = CGSizeMake(SIDE_ITEM_W , self.navi_view_height)
        self.category_open.contentHorizontalAlignment = UIControlContentHorizontalAlignment.Center
        self.category_open.addTarget(self, action: "leftTapped:", forControlEvents:.TouchUpInside)
        
        self.addSubview(navi_view)
        self.navi_view.addSubview(navi_imageview)
        
        self.addSubview(contentView)
        self.contentView.addSubview(top_image)
        
        self.addSubview(title_label)
        self.addSubview(search_btn)
        self.addSubview(category_open)
        self.addSubview(status_btn)
        
    }
    
    public func updateFrame(){
        self.statusHeight = self.setStatusBarHight()
        self.navi_view_height = 50 + self.statusHeight
        let frame = self.frame
        
        self.status_btn.frame = CGRectMake(0, 0, frame.width, self.statusHeight * 2)
        
        self.content_height = frame.width * self.CONTENT_RATIO_H / self.CONTENT_RATIO_W
        
        self.tableView.frame = CGRectMake(0, 0, frame.width, frame.height + 50)
        self.contentView.frame = CGRectMake( 0, self.content_vertical, frame.width, self.content_height + 64)
        
        self.top_image.frame = CGRectMake(0, 0, frame.width, self.content_height)
        self.navi_view.frame = CGRectMake(0,  self.navibar_vertical , frame.width, self.navi_view_height)
        self.navi_imageview.frame = CGRectMake(0, 0, frame.width, self.navi_view_height + 20)
        
        self.search_btn.frame = CGRectMake( frame.width - 80 ,self.search_vertical, 80, self.navi_view_height)
        self.category_open.frame = CGRectMake(0, self.open_category_vertical, 80, self.navi_view_height)
        self.title_label.center = CGPointMake( self.center.x, self.title_vertical + 30)
        self.category_open.center = CGPointMake( 50, self.title_vertical + 30 )
        self.search_btn.center = CGPointMake( frame.width - SIDE_ITEM_W, self.title_vertical + 30 )
        
        self.search_vertical = 10
        self.search_btn.enabled = true
    }
    
    func setTableViewInset(){
        let edgeInsets = UIEdgeInsetsMake(self.content_height + self.navi_view_height , 0, 0, 0)
        self.tableView.contentInset = edgeInsets
        self.tableView.scrollIndicatorInsets = edgeInsets
        
    }
    
    func effectViewInit(){
        let effect = UIBlurEffect(style: UIBlurEffectStyle.Light);
        self.effectView = UIVisualEffectView(effect: effect);
        self.effectView.alpha = 0
        self.effectView.frame = self.top_image.frame
        self.top_image.layer.masksToBounds = true
        self.top_image.addSubview(effectView)
        
    }
    
    func setContentView(){
        // シャドウ
        self.contentView.layer.shadowColor = UIColor.blackColor().CGColor /* 影の色 */
        self.contentView.layer.shadowOffset = CGSizeMake(0,4.0) /* 影の大きさ */
        self.contentView.layer.shadowRadius = 9.0 /* 影の距離 */
        
    }
    
    public func scrollViewDidScroll(scrollView: UIScrollView) {
        
        if scrollView.contentOffset.y <= -self.content_height  - self.navi_view_height {//- self.tab_height {
            rockContentView()
            updateFrame()
            return
        }
        
        let val = self.navi_view_height + self.statusHeight + 40 + scrollView.contentOffset.y
        if val > 0 {
            convertContentToNavigationBar(scrollView.contentOffset.y , y: val)
            updateFrame()
            return
        }
        contentMove(scrollView.contentOffset.y)
        updateFrame()
    }
    
    func rockContentView(){
        self.contentView.layer.shadowOpacity = Float(0.0)
        self.open_category_vertical =  content_height
        self.search_vertical = self.content_height
        self.title_vertical =  self.content_height
        
        self.content_vertical = self.tab_height
        self.navibar_vertical = self.tab_height + self.content_height - self.statusHeight
        
    }
    
    func convertContentToNavigationBar(offset_y: CGFloat, y : CGFloat){
        let rate = y / self.navi_view_height
        
        if rate < 1 {
            self.contentView.layer.shadowOpacity = Float(rate * 0.6)
        }else{
            self.contentView.layer.shadowOpacity = Float(0.6)
            
        }
        self.content_vertical = -self.content_height - self.navi_view_height - offset_y
        
        self.navibar_vertical = -navi_view_height - offset_y - statusHeight
        
        
        if y < self.navi_view_height - 10 {
            self.open_category_vertical = -y + navi_view_height - 10
            self.search_vertical =  -y + navi_view_height - 10
            self.title_vertical = -y + navi_view_height - 10
            
            
        }
        if y > self.navi_view_height - self.statusHeight {
            self.open_category_vertical = self.statusHeight - 16
            self.search_vertical = self.statusHeight - 16
            self.title_vertical =  self.statusHeight - 16
            self.content_vertical = -self.top_image.bounds.height
            
        }
    }
    
    func contentMove(y : CGFloat){
        self.content_vertical =  -content_height - navi_view_height - y
        self.navibar_vertical = -statusHeight - navi_view_height - y
        
        self.open_category_vertical = -navi_view_height - y
        self.search_vertical =  -navi_view_height - y
        self.title_vertical = -navi_view_height - y
        
        self.contentView.layer.shadowOpacity = 0
        
    }
    internal func rightTapped(sender: AnyObject) {
        self.delegate?.tapRightItem(sender)
    }
    
    internal func leftTapped(sender: AnyObject) {
        self.delegate?.tapLeftItem(sender)
        
    }
    internal func statusTaped(sender: AnyObject){
        self.delegate?.tapStatusBar(sender)
    }
    
    func setStatusBarHight() -> CGFloat {
        return UIApplication.sharedApplication().statusBarFrame.size.height
        
        
    }
}
