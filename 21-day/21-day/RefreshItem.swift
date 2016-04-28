//
//  RefreshItem.swift
//  21-day
//
//  Created by Hongbo Yu on 16/4/28.
//  Copyright © 2016年 Frank. All rights reserved.
//

import UIKit

class RefreshItem {
    private var centerStart: CGPoint
    private var centerEnd: CGPoint
    unowned var view: UIView
    
    init(view: UIView, centerEnd: CGPoint, parallaxRatio: CGFloat, screenHeight: CGFloat) {
        self.view = view
        self.centerEnd = centerEnd
        centerStart = CGPoint(x: centerEnd.x , y: centerEnd.y + (parallaxRatio * screenHeight))
        self.view.center = centerStart
    }
    
    
    func updateViewPositionForPercentage(percentage: CGFloat) {
        view.center = CGPoint(
            x: centerStart.x + (centerEnd.x - centerStart.x) * percentage,
            y: centerStart.y + (centerEnd.y - centerStart.y) * percentage)
    }
    
}
