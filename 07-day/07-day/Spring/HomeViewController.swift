//
//  HomeViewController.swift
//  07-day
//
//  Created by Hongbo Yu on 16/3/21.
//  Copyright © 2016年 Frank. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    override func prefersStatusBarHidden() -> Bool {
        return false
    }
    
    override func preferredStatusBarUpdateAnimation() -> UIStatusBarAnimation {
        return UIStatusBarAnimation.Slide
    }
    
    
    
}
