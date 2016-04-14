//
//  LoginViewController.swift
//  14-day
//
//  Created by Adolfrank on 4/9/16.
//  Copyright © 2016 FrankAdol. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var navBar: UINavigationBar!
    
    @IBOutlet weak var BGScrollView: UIScrollView!
    
    @IBOutlet weak var usernameLable: UITextField!
    @IBOutlet weak var passwordLable: UITextField!
    @IBOutlet weak var loginLable: UIButton!
    let width = UIScreen.mainScreen().bounds.width
    let height = UIScreen.mainScreen().bounds.height
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginLable.alpha = 0
        usernameLable.alpha = 0
        passwordLable.alpha = 0
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        BGScrollView.contentSize = CGSizeMake(width, height * 2)
        
        print(BGScrollView.contentSize.height)
    }
    
    
    override func viewDidAppear(animated: Bool) {
        
        UIView.animateWithDuration(0.5, delay: 0.00, options: UIViewAnimationOptions.CurveEaseIn, animations: {
        
            self.usernameLable.alpha = 1
            self.view.layoutIfNeeded()
            
            }, completion: nil)
        
        UIView.animateWithDuration(0.5, delay: 0.20, options: .CurveEaseOut, animations: {
            
            self.passwordLable.alpha = 1
            self.view.layoutIfNeeded()
            
            }, completion: nil)
        
        UIView.animateWithDuration(0.5, delay: 0.60, options: .CurveEaseOut, animations: {
            
            self.loginLable.alpha = 1
            
            }, completion: nil)

    }

    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    @IBAction func backBtnDidTouch(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    

}
