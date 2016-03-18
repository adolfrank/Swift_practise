//
//  ViewController.swift
//  01-day
//
//  Created by Adolfrank on 3/17/16.
//  Copyright © 2016 FrankAdol. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var timeLable: UILabel!
    @IBOutlet weak var controlBtn: UIButton!
    
    var Count = 0.0
    var Timer = NSTimer()
    var IsPlaying = false
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timeLable.text = String(Count)
        
    }

    @IBAction func resetBtnDidTouch(sender: AnyObject) {
        Count = 0.0
        timeLable.text = String(Count)
    }
  
    

    @IBAction func controlBtnDidTouch(sender: AnyObject) {
        if (IsPlaying == false) {
            Timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: ("timeUpdate"), userInfo: nil, repeats: true)
            controlBtn.setImage(UIImage(named: "stop_btn"), forState: UIControlState.Normal)
            controlBtn.backgroundColor = UIColor(red: 204/255.0, green: 0/255.0, blue: 0/255.0, alpha: 1.0)
            IsPlaying = true
        } else {
        Timer.invalidate()
        controlBtn.setImage(UIImage(named: "play_btn"), forState: UIControlState.Normal)
        controlBtn.backgroundColor = UIColor(red: 49/255.0, green: 104/255.0, blue: 250/255.0, alpha: 1.0)
        IsPlaying = false
        }
    }
    
    
    func timeUpdate(){
        Count += 0.1
        timeLable.text = String(format: "%.1f", arguments: [Count])
    }
    
    
    
    
}
