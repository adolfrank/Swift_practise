//
//  ViewController.swift
//  16-day
//
//  Created by Hongbo Yu on 16/4/12.
//  Copyright © 2016年 Frank. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    let width = UIScreen.mainScreen().bounds.width
    let height = UIScreen.mainScreen().bounds.height
    
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var usernameLable: UITextField!
    @IBOutlet weak var passwordLable: UITextField!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ViewController.textChange), name: UITextFieldTextDidChangeNotification, object: usernameLable)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ViewController.textChange), name: UITextFieldTextDidChangeNotification, object: passwordLable)
    }
    
    deinit{
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    
    func textChange(){
        if (usernameLable.text?.characters.count > 0 && passwordLable.text?.characters.count > 0) {
            loginBtn.enabled = true
            loginBtn.backgroundColor = UIColor.blueColor()
        }
    }
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }

    
    
    @IBAction func loginBtnDidTouch(sender: AnyObject) {
        if !(usernameLable.text == "frank") {
            
            let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
            hud.mode = MBProgressHUDMode.Text
            hud.label.text = "账户不存在"
            hud.offset = CGPointMake(0, -60)
            hud.hideAnimated(true, afterDelay: 1.0)
            return }
        if !(passwordLable.text == "123") {
            let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
            hud.mode = MBProgressHUDMode.Text
            hud.label.text = "密码错误"
            hud.offset = CGPointMake(0, -60)
            hud.hideAnimated(true, afterDelay: 1.0)
            return }
        let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
        hud.label.text = "正在登录中"
        let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(0.5 * Double(NSEC_PER_SEC)))
        dispatch_after(delayTime, dispatch_get_main_queue()) {
            self.performSegueWithIdentifier("login2contacts", sender: nil)
            hud.hideAnimated(true)
        }
        
    }
    
}

