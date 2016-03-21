//
//  RightViewController.swift
//  05-day
//
//  Created by Adolfrank on 3/19/16.
//  Copyright © 2016 FrankAdol. All rights reserved.
//

import UIKit

protocol RightViewControllerDelegate:class{
    func backBtnDidTouch(width: CGFloat)
}

class RightViewController: UIViewController,UIScrollViewDelegate {

    @IBOutlet var RightView: UIView!
    
   
    
    @IBOutlet weak var RightScrollView: UIScrollView!
    
    weak var delegate: CenterViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        RightScrollView.contentSize = CGSizeMake(375, 1334)
        let downView:UIImageView = UIImageView()
        RightScrollView.addSubview(downView)
        downView.image = UIImage(named: "profile")
        downView.frame = CGRectMake(0, 667, 375, 667)
        downView.backgroundColor = UIColor.redColor()
        
        
    }
    
    
    
    
    
    override func prefersStatusBarHidden() -> Bool {
        return false
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.Default
    }
    
    override func preferredStatusBarUpdateAnimation() -> UIStatusBarAnimation {
        return UIStatusBarAnimation.Slide
    }
    
    @IBAction func backBtnDidTouch(sender: AnyObject) {
        delegate?.storiesBtnDidTouch(self.RightView.bounds.width)
        
    }
    

}
