//
//  HomeViewController.swift
//  04-day
//
//  Created by Adolfrank on 3/19/16.
//  Copyright © 2016 FrankAdol. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController,UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        self.navigationController?.hidesBarsOnSwipe = true
        
        let leftView:LeftViewController = LeftViewController()
        let rightView:RightViewController = RightViewController(nibName:"RightViewController",bundle: nil)
        
        self.addChildViewController(leftView)
        self.scrollView.addSubview(leftView.view)
        leftView.view.frame = CGRectMake(0, 0, scrollView.frame.width, scrollView.frame.height)
        leftView.didMoveToParentViewController(self)
        
        self.addChildViewController(rightView)
        rightView.view.frame = CGRectMake(scrollView.frame.width, 0, scrollView.frame.width, scrollView.frame.height)
        self.scrollView.addSubview(rightView.view)
        rightView.didMoveToParentViewController(self)
        
        self.scrollView.contentSize = CGSizeMake(scrollView.frame.width * 2, 0 )
        self.scrollView.delegate = self
        
//        self.scrollView.backgroundColor
    }
    
    func scrollViewWillEndDragging(scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        
        
        }
    

}
