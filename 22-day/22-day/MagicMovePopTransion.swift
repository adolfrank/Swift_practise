//
//  MagicMovePopTransion.swift
//  MagicMove
//
//  Created by BourneWeng on 15/7/13.
//  Copyright (c) 2015年 Bourne. All rights reserved.
//

import UIKit

class MagicMovePopTransion: NSObject, UIViewControllerAnimatedTransitioning {
   
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.5
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let fromVC = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey) as! DetailViewController
        let toVC = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey) as! HomeViewController
        let container = transitionContext.containerView()
        
        let snapshotView = fromVC.avatarImage.snapshotViewAfterScreenUpdates(false)
        snapshotView.frame = container!.convertRect(fromVC.avatarImage.frame, fromView: fromVC.view)
        fromVC.avatarImage.hidden = true
        
        toVC.view.frame = transitionContext.finalFrameForViewController(toVC)
        toVC.selectedCell.cardImage.hidden = true
        
        container!.insertSubview(toVC.view, belowSubview: fromVC.view)
        container!.addSubview(snapshotView)
        
        UIView.animateWithDuration(transitionDuration(transitionContext), delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            snapshotView.frame = container!.convertRect(toVC.selectedCell.cardImage.frame, fromView: toVC.selectedCell)
            fromVC.view.alpha = 0
            }) { (finish: Bool) -> Void in
                toVC.selectedCell.cardImage.hidden = false
                snapshotView.removeFromSuperview()
                fromVC.avatarImage.hidden = false
                
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
        }
    }
}
