//
//  HomeTableController.swift
//  21-day
//
//  Created by Hongbo Yu on 16/4/28.
//  Copyright © 2016年 Frank. All rights reserved.
//

import UIKit

private let kRefreshViewHeight: CGFloat = 200
let kWidth: CGFloat = UIScreen.mainScreen().bounds.width

class HomeTableController: UITableViewController, RefreshViewDelegate {

    var dataArray: Array<String> = ["😂", "🤗", "😳", "😌", "😊","😂", "🤗", "😳", "😌", "😊"]
    var cunstumRefresh: RefreshView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cunstumRefresh = RefreshView(frame: CGRect(x: 0 , y: -kRefreshViewHeight, width: kWidth , height: kRefreshViewHeight ), scrollView: tableView)
        self.cunstumRefresh.delegate = self
        tableView.insertSubview(cunstumRefresh, atIndex: 0)
    }

    override func scrollViewDidScroll(scrollView: UIScrollView) {
        cunstumRefresh.scrollViewDidScroll(scrollView)
    }

    override func scrollViewWillEndDragging(scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        cunstumRefresh.scrollViewWillEndDragging(scrollView, withVelocity: velocity, targetContentOffset: targetContentOffset)
    }
    
    // MARK: - Table view data source
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dataArray.count
    }

    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("idCell", forIndexPath: indexPath)
        cell.textLabel!.text = dataArray[indexPath.row]
        cell.textLabel?.font = UIFont(name: "Apple Color Emoji", size: 40)
        cell.textLabel?.textAlignment = NSTextAlignment.Center
        return cell
    }
 
    
    func refreshviewDidRefresh(refreshView: RefreshView) {
        sleep(3)
        cunstumRefresh.endRefresh()
    }


}
