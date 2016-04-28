//
//  RefreshView.swift
//  21-day
//
//  Created by Hongbo Yu on 16/4/28.
//  Copyright © 2016年 Frank. All rights reserved.
//

import UIKit

protocol RefreshViewDelegate: class {
    func refreshviewDidRefresh(refreshView:RefreshView)
}

private let kScreenHeight: CGFloat = 120.0



class RefreshView: UIView, UIScrollViewDelegate {
    
    private unowned var scrollView: UIScrollView
    private var progress: CGFloat = 0.0
    var refreshItems = [RefreshItem]()
    weak var delegate: RefreshViewDelegate?
    var isRefreshing: Bool = false
    
    init(frame: CGRect,scrollView: UIScrollView ) {
        self.scrollView = scrollView
        super.init(frame: frame)
        updateBackgroundColor()
        setupRefreshItems()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    func setupRefreshItems() {
        let groundImageView = UIImageView(image: UIImage(named: "ground"))
        let buildingsImageView = UIImageView(image: UIImage(named: "buildings"))
        let sunImageView = UIImageView(image: UIImage(named: "sun"))
        let catImageView = UIImageView(image: UIImage(named: "cat"))
        let capeBackImageView = UIImageView(image: UIImage(named: "cape_back"))
        let capeFrontImageView = UIImageView(image: UIImage(named: "cape_front"))
        
        refreshItems = [
            RefreshItem(view: buildingsImageView,
                centerEnd: CGPoint(x: CGRectGetMidX(bounds),
                    y: CGRectGetHeight(bounds) - CGRectGetHeight(groundImageView.bounds) - CGRectGetHeight(buildingsImageView.bounds) / 2),
                parallaxRatio: 1.5, screenHeight: kScreenHeight),
            RefreshItem(view: sunImageView,
                centerEnd: CGPoint(x: CGRectGetWidth(bounds) * 0.1,
                    y: CGRectGetHeight(bounds) - CGRectGetHeight(groundImageView.bounds) - CGRectGetHeight(sunImageView.bounds)),
                parallaxRatio: 3, screenHeight: kScreenHeight),
            RefreshItem(view: groundImageView,
                centerEnd: CGPoint(x: CGRectGetMidX(bounds),
                    y: CGRectGetHeight(bounds) - CGRectGetHeight(groundImageView.bounds)/2),
                parallaxRatio: 0.5, screenHeight: kScreenHeight),
            RefreshItem(view: capeBackImageView, centerEnd: CGPoint(x: CGRectGetMidX(bounds), y: CGRectGetHeight(bounds) - CGRectGetHeight(groundImageView.bounds)/2 - CGRectGetHeight(capeBackImageView.bounds)/2), parallaxRatio: -1, screenHeight: kScreenHeight),
            RefreshItem(view: catImageView, centerEnd: CGPoint(x: CGRectGetMidX(bounds), y: CGRectGetHeight(bounds) - CGRectGetHeight(groundImageView.bounds)/2 - CGRectGetHeight(catImageView.bounds)/2), parallaxRatio: 1, screenHeight: kScreenHeight),
            RefreshItem(view: capeFrontImageView, centerEnd: CGPoint(x: CGRectGetMidX(bounds), y: CGRectGetHeight(bounds) - CGRectGetHeight(groundImageView.bounds)/2 - CGRectGetHeight(capeFrontImageView.bounds)/2), parallaxRatio: -1, screenHeight: kScreenHeight),
        ]
        
        for refreshItem in refreshItems {
            addSubview(refreshItem.view)
        }
        
    }
    
    
    
    func updateRefreshItemPositions() {
        for refreshItem in refreshItems {
            refreshItem.updateViewPositionForPercentage(progress)
        }
    }
    
    
    
    func beginRefresh() {
        isRefreshing = true
        UIView.animateWithDuration(0.4, delay: 0, options: .CurveEaseOut, animations: {
            self.scrollView.contentInset.top += kScreenHeight
            }) { (true) in
        }
        let cape = refreshItems[3].view
        let cat = refreshItems[4].view
        cape.transform = CGAffineTransformMakeRotation(CGFloat(-M_PI/32))
        cat.transform = CGAffineTransformMakeTranslation(1.0, 0)
        UIView.animateWithDuration(0.2, delay: 0, options: .Repeat, animations: {
            cape.transform = CGAffineTransformMakeRotation(CGFloat(M_PI/32))
            cat.transform = CGAffineTransformMakeTranslation(-1.0, 0)
            }, completion: nil)
        // 有问题，这段动画无法执行
//        let buildings = refreshItems[0].view
//        let ground = refreshItems[2].view
//        UIView.animateWithDuration(0.2, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut , animations: {
//            ground.center.y += kScreenHeight
//            buildings.center.y += kScreenHeight
//        }){ (true) in }
    }
    
    
    func endRefresh() {
        UIView.animateWithDuration(0.4, delay: 0, options: .CurveEaseOut, animations: {
            self.scrollView.contentInset.top -= kScreenHeight
        }) { (true) in
            self.isRefreshing = false
        }
        let cape = refreshItems[3].view
        let cat = refreshItems[4].view
        cape.transform = CGAffineTransformIdentity
        cat.transform = CGAffineTransformIdentity
        cape.layer.removeAllAnimations()
    }
    
    
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        if isRefreshing { return }
        let refreshHeight = max(0, -scrollView.contentOffset.y - scrollView.contentInset.top)
        progress = min(1, refreshHeight / kScreenHeight)
        updateBackgroundColor()
        updateRefreshItemPositions()
    }
    
    
    func scrollViewWillEndDragging(scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        if !isRefreshing && progress == 1 {
            beginRefresh()
            targetContentOffset.memory.y = -scrollView.contentInset.top
            delegate?.refreshviewDidRefresh(self)
        }
    }
    
    func updateBackgroundColor(){
        backgroundColor = UIColor(white: 0.7 * progress + 0.2 , alpha: 1)
    }
    
    
}




