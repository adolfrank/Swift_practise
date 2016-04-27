//
//  HomeViewController.swift
//  19-day
//
//  Created by Hongbo Yu on 16/4/27.
//  Copyright © 2016年 Frank. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var postBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBarHidden = true
        postBtn.layer.cornerRadius = 5
    }

   
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    
    
    @IBAction func unwindToMainViewController (sender: UIStoryboardSegue){
        self.dismissViewControllerAnimated(true, completion: nil)
    }

   
}
