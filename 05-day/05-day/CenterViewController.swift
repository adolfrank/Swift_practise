//
//  CenterViewController.swift
//  05-day
//
//  Created by Adolfrank on 3/19/16.
//  Copyright © 2016 FrankAdol. All rights reserved.
//

import UIKit


protocol CenterViewControllerDelegate:class{
    func storiesBtnDidTouch(width: CGFloat)
}

class CenterViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    weak var delegate: CenterViewControllerDelegate?
    
    
    
    @IBOutlet weak var homeTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        homeTableView.delegate = self
        homeTableView.dataSource = self
        
        // Nib 注册
        self.homeTableView.registerNib(UINib(nibName: "HomeViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        
//         Class 注册
//        self.homeTableView.registerClass(HomeViewCell.self, forCellReuseIdentifier: "cell")
        
    }

    @IBAction func storiesBtnDidTouch(sender: AnyObject) {
        
        delegate?.storiesBtnDidTouch(self.homeTableView.bounds.width * 2)
        
    }
    
    override func prefersStatusBarHidden() -> Bool {
      
        return false
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        print("center - preferredStatusBarStyle")
        return UIStatusBarStyle.Default
    }
    
    override func preferredStatusBarUpdateAnimation() -> UIStatusBarAnimation {
       
        return UIStatusBarAnimation.Slide
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 400
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = homeTableView.dequeueReusableCellWithIdentifier("cell")
        return cell!
    }
}
