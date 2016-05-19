//
//  ForthViewController.swift
//  25-day
//
//  Created by Hongbo Yu on 16/5/19.
//  Copyright © 2016年 Frank. All rights reserved.
//

import UIKit

class ForthViewController: UIViewController {

    @IBOutlet weak var numberLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        
        UIView.animateWithDuration(0.5, delay: 0.2, options: .CurveEaseIn, animations: { () -> Void in
            
            self.view.backgroundColor = UIColor.blackColor()
            
            }, completion: nil )
        
        UIView.animateWithDuration(0.5, delay: 0.8, options: .CurveEaseOut, animations: { () -> Void in
            
            self.numberLabel.textColor = UIColor(red:0.959, green:0.937, blue:0.109, alpha:1)
            
            }, completion: nil)
        
        
    }


}
