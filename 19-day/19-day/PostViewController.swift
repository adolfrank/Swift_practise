//
//  PostViewController.swift
//  19-day
//
//  Created by Hongbo Yu on 16/4/27.
//  Copyright © 2016年 Frank. All rights reserved.
//

import UIKit

class PostViewController: UIViewController {

    @IBOutlet weak var textBtn: UIButton!
    @IBOutlet weak var photoBtn: UIButton!
    @IBOutlet weak var quoteBtn: UIButton!
    @IBOutlet weak var linkBtn: UIButton!
    @IBOutlet weak var chatBtn: UIButton!
    @IBOutlet weak var audioBtn: UIButton!
    
    let transitionManager = MenuTransitionManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.transitioningDelegate = self.transitionManager
    }

   
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    

    

}
