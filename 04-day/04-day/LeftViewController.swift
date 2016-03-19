//
//  LeftViewController.swift
//  04-day
//
//  Created by Adolfrank on 3/19/16.
//  Copyright © 2016 FrankAdol. All rights reserved.
//

import UIKit

class LeftViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.tableView.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
        
        self.tableView.rowHeight = 160
        // self.tableView.separatorColor = UIColor.whiteColor()
    }

    

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 10
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        cell.textLabel?.text = "这是第\(indexPath.row)行"
        cell.imageView?.image = UIImage(named: "screenshot")
        
        
        
        return cell
    }


    

    

}
