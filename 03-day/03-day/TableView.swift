//
//  TableView.swift
//  03-day
//
//  Created by Hongbo Yu on 16/3/18.
//  Copyright © 2016年 Frank. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

struct video {
    let image: String
    let title: String
    let subTitle: String
    let source: String
}

class TableView: UITableViewController {

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
    

    var playViewController = AVPlayerViewController()
    var playerView = AVPlayer()
    
    @IBOutlet var videoTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blackColor()
        
    }

    
    func playVideo (indexPath: NSIndexPath){
        let videoInfo = data[indexPath.row]
        let path = NSBundle.mainBundle().pathForResource(videoInfo.source, ofType: nil)
        playerView = AVPlayer(URL: NSURL(fileURLWithPath: path!))
        playViewController.player = playerView
        self.presentViewController(playViewController, animated: true) {
            self.playViewController.player?.play()
        }
    }
    

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return data.count
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 220
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = videoTableView.dequeueReusableCellWithIdentifier("VideoCell", forIndexPath: indexPath) as! VideoCell
        let videoInfo = data[indexPath.row]
        cell.titleV.text = videoInfo.title
        cell.subTitleV.text = videoInfo.subTitle
        cell.imageV.image = UIImage(named: videoInfo.image)
        return cell
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        playVideo(indexPath)
    }

}
