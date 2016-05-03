//
//  HomeTableController.swift
//  23-day
//
//  Created by Hongbo Yu on 16/5/3.
//  Copyright © 2016年 Frank. All rights reserved.
//

import UIKit

class HomeTableController: UITableViewController {

    @IBOutlet var homeTableView: UITableView!
    
    var data = [
        pattern(image: "1", name: "Pattern Building"),
        pattern(image: "2", name: "Joe Beez"),
        pattern(image: "3", name: "Car It's car"),
        pattern(image: "4", name: "Floral Kaleidoscopic"),
        pattern(image: "5", name: "Sprinkle Pattern"),
        pattern(image: "6", name: "Palitos de queso"),
        pattern(image: "7", name: "Ready to Go? Pattern"),
        pattern(image: "8", name: "Sets Seamless"),
        ]
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }




    // MARK: - Table view data source
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = homeTableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! PatternCell
        let pattern = data[indexPath.row]
        cell.patternImage?.image = UIImage(named: pattern.image)
        cell.patternLable?.text = pattern.name
        return cell
    }
    

    
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
 

    
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        
        let delete = UITableViewRowAction(style: .Normal, title: "Delete") { action, index in
            print("Delete button tapped")
        }
        delete.backgroundColor = UIColor.grayColor()
        
        let share = UITableViewRowAction(style: .Normal, title: "Share") { (action: UITableViewRowAction!, indexPath: NSIndexPath) -> Void in
            
            let firstActivityItem = self.data[indexPath.row]
            
            let activityViewController = UIActivityViewController(activityItems: [firstActivityItem.image as NSString], applicationActivities: nil)
            
            self.presentViewController(activityViewController, animated: true, completion: nil)
        }
        
        share.backgroundColor = UIColor.redColor()
        
        let download = UITableViewRowAction(style: .Normal, title: "Download") { action, index in
            print("Download button tapped")
        }
        download.backgroundColor = UIColor.blueColor()
        
        return [download, share, delete]
    }



}
