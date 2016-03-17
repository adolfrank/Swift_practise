//
//  ViewController.swift
//  01-day
//
//  Created by Adolfrank on 3/17/16.
//  Copyright © 2016 FrankAdol. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var stopBtn: UIButton!
    @IBOutlet weak var timeLable: UILabel!
    
    var Count = 0.0
    var Timer = NSTimer()
    
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timeLable.text = String(Count)
        
    }

  
    @IBAction func resetBtnClick(sender: AnyObject) {
        Count = 0.0
        timeLable.text = String(Count)
        playBtn.enabled = true
        stopBtn.enabled = true
    }

    @IBAction func playBtnClick(sender: AnyObject) {
        playBtn.enabled = false
        stopBtn.enabled = true
        Timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: ("timeUpdate"), userInfo: nil, repeats: true)
    }
    
    @IBAction func stopBtnClick(sender: AnyObject) {
        stopBtn.enabled = false
        playBtn.enabled = true
        Timer.invalidate()
    }
    
    func timeUpdate(){
        Count += 0.1
        timeLable.text = String(format: "%.1f", arguments: [Count])
    }
    
    
    
    
}
