//
//  HomeViewController.swift
//  11-day
//
//  Created by Hongbo Yu on 16/3/24.
//  Copyright © 2016年 Frank. All rights reserved.
//

import UIKit


struct video {
    let image: String
    let title: String
    let subTitle: String
    let source: String
    let avatar: String
}



class HomeViewController: UITableViewController,UIGestureRecognizerDelegate {


    
    @IBOutlet var HomeTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
    }
    
    
//      添加滑动返回手势
    func gestureRecognizerShouldBegin(gestureRecognizer: UIGestureRecognizer) -> Bool {
        self.view.backgroundColor = UIColor.whiteColor()
        return true
    }
    
    override func viewWillAppear(animated: Bool) {
        self.view.backgroundColor = UIColor.whiteColor()
//        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.navigationBar.alpha = 0.001
    }
    
    override func viewDidAppear(animated: Bool) {
         self.navigationController?.navigationBar.alpha = 1
    }

    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.Default
    }
    
    
   
    
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return data.count
    }

    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let aaa:UITableViewHeaderFooterView = UITableViewHeaderFooterView()
        aaa.textLabel?.text = ""
        aaa.contentView.backgroundColor = UIColor.whiteColor()
        return aaa
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = HomeTable.dequeueReusableCellWithIdentifier("homecell", forIndexPath: indexPath) as! HomeTableCell
        let cellInfo = data[indexPath.row]
        cell.titleImage.image = UIImage(named: cellInfo.image)
        cell.titleLable.text = cellInfo.title
        return cell
    }
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ProfileSegue" {
            let toView = segue.destinationViewController as! ProfileViewController
            let indexPath = tableView.indexPathForCell(sender as! UITableViewCell)!
            toView.textToGo = data[indexPath.row].title
            toView.imageToGo = data[indexPath.row].image
            toView.avatarToGo = data[indexPath.row].avatar
            
        }
        
    }
    
    
  
}
