//
//  ViewController.swift
//  ScrollPageDemo
//
//  Created by HOLLEY on 15/11/11.
//  Copyright © 2015年 com.digga. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate {
    
    let numOfPages = 3
    //scrollView的初始化
    let scrollView = UIScrollView()
    var segment:UISegmentedControl = UISegmentedControl()
    //
    //    override func viewDidLoad(){
    //        super.viewDidLoad()
    //
    //        //scrollView的初始化
    //        let scrollView = UIScrollView()
    //
    //        let viewRect = CGRect(x: 0, y: 200, width: self.view.frame.width, height: self.view.frame.height - 45)
    //
    //        scrollView.frame = viewRect
    //
    //        let pageWidth = self.view.frame.width
    //        let pageHeight = scrollView.frame.height
    //
    //        //为了让内容横向滚动，设置横向内容宽度为3个页面的宽度总和
    //        scrollView.contentSize=CGSizeMake(CGFloat(pageWidth * CGFloat(numOfPages)), CGFloat(pageHeight))
    //        scrollView.pagingEnabled = true
    //        scrollView.showsHorizontalScrollIndicator = false
    //        scrollView.showsVerticalScrollIndicator = false
    //        scrollView.scrollsToTop = false
    //
    //        //添加子页面
    //        for i in 0..<numOfPages{
    //            let myViewController = MyViewController(number:(i+1))
    //            myViewController.view.frame = CGRectMake(CGFloat(pageWidth*CGFloat(i)),
    //                CGFloat(0), CGFloat(pageWidth), CGFloat(pageHeight))
    //            scrollView.addSubview(myViewController.view)
    //        }
    //        self.view.addSubview(scrollView)
    //    }
    //
    //    override func didReceiveMemoryWarning() {
    //        super.didReceiveMemoryWarning()
    //        // Dispose of any resources that can be recreated.
    //    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        //先创建一个数组用于设置分段控件的标题
        let appsArray:[String] = ["页面一","页面二","页面三"]
        
        //创建分段控件
        segment = UISegmentedControl(items: appsArray)
        
        //设置坐标大小
        segment.frame = CGRectMake(0, 50, self.view.frame.width, 40)
        
        segment.apportionsSegmentWidthsByContent = true
        
        segment.selectedSegmentIndex = 0
        
        //添加到视图上
        self.view.addSubview(segment)
        
        //添加事件，当segment改变时，触发
        segment.addTarget(self, action: "segmentChange:", forControlEvents: UIControlEvents.ValueChanged)
        
        
        
        
        
        
        let viewRect = CGRect(x: 0, y: 90, width: self.view.frame.width, height: self.view.frame.height - 45)
        
        scrollView.frame = viewRect
        
        let pageWidth = self.view.frame.width
        let pageHeight = scrollView.frame.height
        
        //为了让内容横向滚动，设置横向内容宽度为3个页面的宽度总和
        scrollView.contentSize=CGSizeMake(CGFloat(pageWidth * CGFloat(numOfPages)), CGFloat(pageHeight))
        scrollView.pagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.scrollsToTop = false
        scrollView.delegate = self
        
        //添加子页面
        for i in 0..<numOfPages{
            let myViewController = MyViewController(number:(i+1))
            myViewController.view.frame = CGRectMake(CGFloat(pageWidth*CGFloat(i)),
                CGFloat(0), CGFloat(pageWidth), CGFloat(pageHeight))
            scrollView.addSubview(myViewController.view)
        }
        
        self.view.addSubview(scrollView)
        
    }
    
    func segmentChange(sender: UISegmentedControl)
    {
        print(sender.titleForSegmentAtIndex(sender.selectedSegmentIndex)! as NSString)
        
        scrollView.setContentOffset(CGPoint(x:CGFloat(sender.selectedSegmentIndex) * self.view.frame.width,y:0), animated: true);
    }
    
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        //print("只要滚动了就会触发哦。")
    }
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        print("开始拖拽视图")
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        print("结束滚动")
        
    }
    
    func scrollViewWillBeginDecelerating(scrollView: UIScrollView) {
        print("将开始降速时")
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        print("减速停止了时执行，手触摸时执行执行")
        print(scrollView.contentOffset.x)
        print(self.view.frame.width)
        segment.selectedSegmentIndex = Int(scrollView.contentOffset.x / self.view.frame.width)
        print(segment.selectedSegmentIndex)
        
    }
    
    func scrollViewDidEndScrollingAnimation(scrollView: UIScrollView) {
        print("滚动动画停止时执行,代码改变时触发,也就是setContentOffset改变时")
    }
    
    func scrollViewDidEndZooming(scrollView: UIScrollView, withView view: UIView?, atScale scale: CGFloat) {
        print("完成放大缩小时调用")
    }
}

