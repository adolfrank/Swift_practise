//
//  FirstViewController.swift
//  25-day
//
//  Created by Hongbo Yu on 16/5/19.
//  Copyright © 2016年 Frank. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    
    @IBOutlet weak var yellowSquareView: UIView!
    @IBOutlet weak var blueSquareView: UIView!
    @IBOutlet weak var mouseView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animateWithDuration(0.8, delay: 0.2, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.8, options: .CurveEaseInOut, animations: { () -> Void in
            
            self.yellowSquareView.center.x = self.view.bounds.width - self.yellowSquareView.center.x
            self.yellowSquareView.center.y = self.yellowSquareView.center.y + 30
            self.blueSquareView.center.x = self.view.bounds.width -  self.blueSquareView.center.x
            self.blueSquareView.center.y = self.blueSquareView.center.y + 30
            
            }, completion: nil )
        
        UIView.animateWithDuration(0.6, delay: 0.4, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.8, options: .CurveEaseOut, animations: { () -> Void in
            
            self.setHeight(180)
            self.mouseView.center.y = self.view.bounds.height - self.mouseView.center.y
            
            }, completion: nil )
        
    }
    
    
    
    
    func setHeight(height: CGFloat) {
        
        var frame: CGRect = self.mouseView.frame
        frame.size.height = height
        
        self.mouseView.frame = frame
    }

    

}
