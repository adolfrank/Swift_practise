//
//  HomeViewController.swift
//  10-day
//
//  Created by Hongbo Yu on 16/3/23.
//  Copyright © 2016年 Frank. All rights reserved.
//

import UIKit

class HomeViewController: VideoSplashViewController {

    @IBOutlet weak var loginBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVideoBackground()
        loginBtn.layer.cornerRadius = 4
        
        print("viewDidLoad")
    }

    @IBAction func loginBtnDidTouch(sender: AnyObject) {
    }
    
    
    
    func setupVideoBackground() {
        
        let url = NSURL.fileURLWithPath(NSBundle.mainBundle().pathForResource("welcome_2_0", ofType: "mp4")!)
        
        videoFrame = view.frame
        fillMode = .ResizeAspectFill
        alwaysRepeat = true
        sound = true
        startTime = 2.0
        alpha = 0.7
        
        contentURL = url
        view.userInteractionEnabled = true
        
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
}
