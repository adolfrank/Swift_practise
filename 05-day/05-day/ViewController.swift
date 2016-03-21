//
//  ViewController.swift
//  05-day
//
//  Created by Adolfrank on 3/19/16.
//  Copyright © 2016 FrankAdol. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate, CenterViewControllerDelegate,RightViewControllerDelegate{

    @IBOutlet weak var homeScrollView: UIScrollView!
    
    let leftVC:LeftViewController = LeftViewController()
    let centerVC:CenterViewController = CenterViewController()
    let rightVC:RightViewController = RightViewController()
    
    let width:CGFloat = UIScreen.mainScreen().bounds.width
    
    var indexA = 0
    
    let  x :CGFloat = UIScreen.mainScreen().bounds.width
    
    override func viewDidLoad() {
        super.viewDidLoad()
            setupVC()
            scrollViewDidEndScrollingAnimation(homeScrollView)
        }
    
    
    
    func setupVC() {
       
        self.addChildViewController(leftVC)
        self.addChildViewController(centerVC)
        self.addChildViewController(rightVC)
        self.homeScrollView.contentSize = CGSizeMake(width * 3, 0)
        self.homeScrollView.delegate = self
        self.homeScrollView.bounces = false
    }
    

    
    func scrollViewDidEndScrollingAnimation(scrollView: UIScrollView) {
    
        let tmpWidth:CGFloat = homeScrollView.frame.width
        let tmpHight:CGFloat = homeScrollView.frame.height
        let tmpOffsetX:CGFloat = homeScrollView.contentOffset.x
        let index:NSInteger = NSInteger (tmpOffsetX / tmpWidth)
        let willShowVC:UIViewController = self.childViewControllers[index]
        if (willShowVC.isViewLoaded() == true){
            return
        } else {
            willShowVC.view.frame = CGRectMake(tmpOffsetX, 0, tmpWidth, tmpHight)
            homeScrollView.addSubview(willShowVC.view)
        }
        centerVC.delegate = self
        rightVC.delegate = self
    }
    
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        
        let tmpWidth:CGFloat = homeScrollView.frame.width
        let tmpHight:CGFloat = homeScrollView.frame.height
        let tmpOffsetX:CGFloat = homeScrollView.contentOffset.x
        let index:NSInteger = NSInteger (tmpOffsetX / tmpWidth)
        let willShowVC:UIViewController = self.childViewControllers[index]
        
        indexA = index
        willShowVC.setNeedsStatusBarAppearanceUpdate()
        if (willShowVC.isViewLoaded() == true){
            return
        } else {
            willShowVC.view.frame = CGRectMake(tmpOffsetX, 0, tmpWidth, tmpHight)
            homeScrollView.addSubview(willShowVC.view)
        }
        centerVC.delegate = self
        rightVC.delegate = self
    }
    
    

    override func childViewControllerForStatusBarHidden() -> UIViewController? {
        if indexA == 0 {
            return leftVC
        } else if indexA == 1 {
            return centerVC
        } else if indexA == 2{
            return rightVC
        } else {
            return nil
        }
    }
    
    
    override func childViewControllerForStatusBarStyle() -> UIViewController? {
        if indexA == 0 {
            return leftVC
        } else if indexA == 1 {
            return centerVC
        } else if indexA == 2{
            return rightVC
        } else {
            return nil
        }
    }
  
    
    func storiesBtnDidTouch(width: CGFloat) {
        self.homeScrollView.setContentOffset(CGPointMake(width, 0) , animated: true)
    }
    
    func backBtnDidTouch(width: CGFloat) {
        self.homeScrollView.setContentOffset(CGPointMake(width, 0) , animated: true)

    }
}

