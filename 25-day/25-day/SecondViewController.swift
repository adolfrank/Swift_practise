//
//  SecondViewController.swift
//  25-day
//
//  Created by Hongbo Yu on 16/5/19.
//  Copyright © 2016年 Frank. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var exampleImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animateWithDuration(2, animations: {
            
            self.exampleImageView.alpha = 0
            
        })
    }

}
