//
//  ThirdViewController.swift
//  25-day
//
//  Created by Hongbo Yu on 16/5/19.
//  Copyright © 2016年 Frank. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var scaleImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        
        UIView.animateWithDuration(0.8, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .CurveEaseIn, animations: { () -> Void in
            
            self.scaleImageView.transform = CGAffineTransformMakeScale(2, 2)
            self.scaleImageView.alpha = 1
            
            }, completion: nil )
    }
    


}
