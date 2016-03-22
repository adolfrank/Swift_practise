//
//  HomeViewController.swift
//  08-day
//
//  Created by Adolfrank on 3/21/16.
//  Copyright © 2016 FrankAdol. All rights reserved.
//

import UIKit

class HomeViewController: UITableViewController {

    let cellIdentifer = "NewCellIdentifier"
    
    let favoriteEmoji = ["🤗🤗🤗🤗🤗", "😅😅😅😅😅", "😆😆😆😆😆"]
    let newFavoriteEmoji = ["🏃🏃🏃🏃🏃", "💩💩💩💩💩", "👸👸👸👸👸", "🤗🤗🤗🤗🤗", "😅😅😅😅😅", "😆😆😆😆😆" ]
    var emojiData = [String]()
//    var tableViewController = UITableViewController(style: .Plain)
    
//    var refreshControl = UIRefreshControl()
    
    @IBAction func showNav(sender: AnyObject) {
        print("yyy")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emojiData = favoriteEmoji
        let emojiTableView = self.tableView
        
        emojiTableView.backgroundColor = UIColor(red:0.092, green:0.096, blue:0.116, alpha:1)
        emojiTableView.dataSource = self
        emojiTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellIdentifer)
       
        emojiTableView.tableFooterView = UIView(frame: CGRectZero)
        emojiTableView.separatorStyle = UITableViewCellSeparatorStyle.None

        self.refreshControl = UIRefreshControl()
        self.refreshControl?.addTarget(self, action: "didRoadEmoji", forControlEvents: UIControlEvents.ValueChanged)
        
        self.refreshControl!.backgroundColor = UIColor(red:100/255/0
            , green:0.113, blue:0.145, alpha:1)
        let attributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        self.refreshControl!.attributedTitle = NSAttributedString(string: "Last updated on \(NSDate())", attributes: attributes)
        self.refreshControl!.tintColor = UIColor.whiteColor()
        
//        self.title = "emoji"
        let titleLabel = UILabel(frame: CGRectMake(0, 0, 0 , 44))
        titleLabel.textAlignment = NSTextAlignment.Center
        titleLabel.text = "下拉刷新"
        titleLabel.textColor = UIColor.whiteColor()
        self.navigationItem.titleView = titleLabel
        self.navigationController?.hidesBarsOnSwipe
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(named: "bg"), forBarMetrics: UIBarMetrics.Default)
        self.navigationController?.navigationBar.shadowImage = UIImage(named: "bg")
        emojiTableView.rowHeight = UITableViewAutomaticDimension
        emojiTableView.estimatedRowHeight = 60.0
        
    }
    
    
    func didRoadEmoji() {
        print("ttt")
        self.emojiData = newFavoriteEmoji
        self.tableView.reloadData()
        self.refreshControl!.endRefreshing()
    }
    
    
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return emojiData.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifer, forIndexPath: indexPath)
//        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifer)! as UITableViewCell
        // Configure the cell...
        cell.textLabel!.text = self.emojiData[indexPath.row]
        cell.textLabel!.textAlignment = NSTextAlignment.Center
        cell.textLabel!.font = UIFont.systemFontOfSize(50)
        cell.backgroundColor = UIColor.clearColor()
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        return cell
    }


}
