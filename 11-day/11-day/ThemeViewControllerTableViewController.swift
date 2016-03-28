//
//  ThemeViewControllerTableViewController.swift
//  11-day
//
//  Created by Hongbo Yu on 16/3/24.
//  Copyright © 2016年 Frank. All rights reserved.
//

import UIKit

class ThemeViewControllerTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        
    }
    
  
    @IBOutlet var ThemeTable: UITableView!
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    
    
    override func viewWillDisappear(animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }


    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 20
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = ThemeTable.dequeueReusableCellWithIdentifier("themecell", forIndexPath: indexPath) as! ThemeTableCell
        return cell
    }
    

   

}
