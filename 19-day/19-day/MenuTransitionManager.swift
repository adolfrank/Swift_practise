//
//  MenuTransitionManager.swift
//  TumblrMenu
//
//  Created by Allen on 16/1/24.
//  Copyright © 2016年 Allen. All rights reserved.
//

import UIKit

class MenuTransitionManager: NSObject, UIViewControllerAnimatedTransitioning, UIViewControllerTransitioningDelegate {

    private var presenting = false
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
    
        let container = transitionContext.containerView()
        
        let screens : (from:UIViewController, to:UIViewController) = (transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!, transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!)
        
        let menuViewController = !self.presenting ? screens.from as! PostViewController : screens.to as! PostViewController
        let bottomViewController = !self.presenting ? screens.to as UIViewController : screens.from as UIViewController
        
        let menuView = menuViewController.view
        let bottomView = bottomViewController.view
        
        if (self.presenting) {
        
            self.offStageMenuController(menuViewController)
            
        }
        
        container!.addSubview(bottomView)
        container!.addSubview(menuView)
        
        let duration = self.transitionDuration(transitionContext)
        
        UIView.animateWithDuration(duration, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.8, options: [], animations: {
            
            if (self.presenting){
                
                self.onStageMenuController(menuViewController)
                
            } else {
                
                self.offStageMenuController(menuViewController)
                
            }
            
            }, completion: { finished in
                
                transitionContext.completeTransition(true)
                UIApplication.sharedApplication().keyWindow!.addSubview(screens.to.view)
                
        })

        
        
    }
    
    
    func offstage(amount: CGFloat) ->CGAffineTransform {
        return CGAffineTransformMakeTranslation(amount, 0)
    }
    
    func offStageMenuController(menuViewController: PostViewController) {
        
        menuViewController.view.alpha = 0
        
        let topRowOffset  : CGFloat = 300
        let middleRowOffset : CGFloat = 150
        let bottomRowOffset  : CGFloat = 50
        
        menuViewController.textBtn.transform = self.offstage(-topRowOffset)
        menuViewController.quoteBtn.transform = self.offstage(-middleRowOffset)
        menuViewController.chatBtn.transform = self.offstage(-bottomRowOffset)
        menuViewController.photoBtn.transform = self.offstage(topRowOffset)
        menuViewController.linkBtn.transform = self.offstage(middleRowOffset)
        menuViewController.audioBtn.transform = self.offstage(bottomRowOffset)
    }
    
    func onStageMenuController(menuViewController: PostViewController) {
        
        menuViewController.view.alpha = 1
        
        menuViewController.textBtn.transform = CGAffineTransformIdentity
        menuViewController.photoBtn.transform = CGAffineTransformIdentity
        menuViewController.quoteBtn.transform = CGAffineTransformIdentity
        menuViewController.linkBtn.transform = CGAffineTransformIdentity
        menuViewController.chatBtn.transform = CGAffineTransformIdentity
        menuViewController.audioBtn.transform = CGAffineTransformIdentity
    }
    
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.5
    }
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        self.presenting = true
        return self
        
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        self.presenting = false
        return self
    }
    
}
