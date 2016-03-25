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
}



class HomeViewController: UITableViewController,UIGestureRecognizerDelegate {

    
    var data = [
        video(image: "screenshot01", title: "Introduce 3DS Mario", subTitle: "Youtube - 06:32", source: "video01.mp4"),
        video(image: "screenshot02", title: "Emoji Among Us", subTitle: "Vimeo - 3:34", source: "video01.mp4"),
        video(image: "screenshot03", title: "Seals Documentary", subTitle: "Vine - 00:06", source: "video01.mp4"),
        video(image: "screenshot04", title: "Adventure Time", subTitle: "Youtube - 02:39", source: "video01.mp4"),
        video(image: "screenshot05", title: "Facebook HQ", subTitle: "Facebook - 10:20", source: "video02.mp4"),
        video(image: "screenshot06", title: "Lijiang Lugu Lake", subTitle: "Allen - 20:30", source: "video02.mp4"),
        video(image: "screenshot07", title: "Lijiang Lugu Lake", subTitle: "Allen - 20:30", source: "video02.mp4"),
        video(image: "screenshot08", title: "Lijiang Lugu Lake", subTitle: "Allen - 20:30", source: "video02.mp4")
    ]
    
    
    
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
        return 5
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 8
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
    
    
    
    
  
}
