//
//  HomeViewController.swift
//  18-day
//
//  Created by Hongbo Yu on 16/4/20.
//  Copyright © 2016年 Frank. All rights reserved.
//

import UIKit

class HomeViewController: UITableViewController, MenuTransitionManagerDelegate {

    
    let menuTransitionManager = MenuTransitionManager()
    
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        view.backgroundColor = UIColor(red:0.062, green:0.062, blue:0.07, alpha:1)
    }

    

    // MARK: - Table view data source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 5
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! HomeTableCell

        if indexPath.row == 0 {
            cell.bannerImageView.image = UIImage(named: "banner01")
            cell.titleView.text = "Love mountain."
            cell.authorView.text = "Allen Wang"
            cell.avatarView.image = UIImage(named: "header01")
            
        } else if indexPath.row == 1 {
            cell.bannerImageView.image = UIImage(named: "banner02")
            cell.titleView.text = "New graphic design - LIVE FREE"
            cell.authorView.text = "Cole"
            cell.avatarView.image = UIImage(named: "header02")
            
        } else if indexPath.row == 2 {
            cell.bannerImageView.image = UIImage(named: "banner03")
            cell.titleView.text = "Summer sand"
            cell.authorView.text = "Daniel Hooper"
            cell.avatarView.image = UIImage(named: "header03")
            
        } else if indexPath.row == 3{
            cell.bannerImageView.image = UIImage(named: "banner04")
            cell.titleView.text = "Seeking for signal"
            cell.authorView.text = "Noby-Wan Kenobi"
            cell.avatarView.image = UIImage(named: "header04")
            
        } else {
            cell.bannerImageView.image = UIImage(named: "banner05")
            cell.titleView.text = "Seeking for signal"
            cell.authorView.text = "Noby-Wan Kenobi"
            cell.avatarView.image = UIImage(named: "header05")
        
        }
        
        return cell
    }
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let menuTableViewController = segue.destinationViewController as! MenuViewController
//        menuTableViewController.currentItem = self.title!
        menuTableViewController.transitioningDelegate = menuTransitionManager
        menuTransitionManager.delegate = self
    }
    

    func dismiss() {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func unwindToHome(segue: UIStoryboardSegue) {
        let sourceController = segue.sourceViewController as! MenuViewController
        self.title = sourceController.currentItem
    }
    
}
