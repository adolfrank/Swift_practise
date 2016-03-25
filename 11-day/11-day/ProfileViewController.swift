//
//  ProfileViewController.swift
//  11-day
//
//  Created by Hongbo Yu on 16/3/24.
//  Copyright © 2016年 Frank. All rights reserved.
//

import UIKit

let offset_HeaderStop:CGFloat = 40.0 // At this offset the Header stops its transformations
let offset_B_LabelHeader:CGFloat = 125.0 // At this offset the Black label reaches the Header
let distance_W_LabelHeader:CGFloat = 35.0 // The distance between the bottom of the Header and the top of the White Label

class ProfileViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet var Header: UIView!
    @IBOutlet weak var HeaderLable: UILabel!
    @IBOutlet weak var AvatarImage: UIImageView!
    @IBOutlet weak var ProfileTable: UITableView!
    
    @IBOutlet var headerImageView:UIImageView!
    @IBOutlet var headerBlurImageView:UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        ProfileTable.delegate = self
        ProfileTable.dataSource = self
        // Header - Image
        
        headerImageView = UIImageView(frame: Header.bounds)
        headerImageView?.image = UIImage(named: "header_bg")
        headerImageView?.contentMode = UIViewContentMode.ScaleAspectFill
        Header.insertSubview(headerImageView, belowSubview: HeaderLable)
        
        // Header - Blurred Image
        
        headerBlurImageView = UIImageView(frame: Header.bounds)
        //        headerBlurImageView?.image = UIImage(named: "header_bg")?.blurredImageWithRadius(10, iterations: 20, tintColor: UIColor.clearColor())
        headerBlurImageView?.contentMode = UIViewContentMode.ScaleAspectFill
        headerBlurImageView?.alpha = 0.0
        Header.insertSubview(headerBlurImageView, belowSubview: HeaderLable)
        Header.clipsToBounds = true
        
        }

    @IBAction func backBtnDidTouch(sender: AnyObject) {
        
        print("backBtnDidTouch")
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        let offset = scrollView.contentOffset.y
        var avatarTransform = CATransform3DIdentity
        var headerTransform = CATransform3DIdentity
        
        // PULL DOWN -----------------
        
        if offset <= 0 {
            
            let headerScaleFactor:CGFloat = -(offset) / Header.bounds.height
            let headerSizevariation = ((Header.bounds.height * (1.0 + headerScaleFactor)) - Header.bounds.height)/2.0
            headerTransform = CATransform3DTranslate(headerTransform, 0, headerSizevariation, 0)
            headerTransform = CATransform3DScale(headerTransform, 1.0 + headerScaleFactor, 1.0 + headerScaleFactor, 0)
            
            Header.layer.transform = headerTransform
        }
            
            // SCROLL UP/DOWN ------------
            
        else {
            
            // Header -----------
            
            headerTransform = CATransform3DTranslate(headerTransform, 0, max(-offset_HeaderStop, -offset), 0)
            
            //  ------------ Label
            
//            let labelTransform = CATransform3DMakeTranslation(0, max(-distance_W_LabelHeader, offset_B_LabelHeader - offset), 0)
//            HeaderLable.layer.transform = labelTransform

            
            //  ------------ 返回按钮顶置
            let backBtnTrasform = CATransform3DMakeTranslation(0, 0, 10)
            backBtn.layer.transform = backBtnTrasform

            
            //  ------------ Blur
            
            headerBlurImageView?.alpha = min (1.0, (offset - offset_B_LabelHeader)/distance_W_LabelHeader)
            
            // Avatar -----------
            
            let avatarScaleFactor = (min(offset_HeaderStop, offset)) / AvatarImage.bounds.height / 1.4 // Slow down the animation
            let avatarSizeVariation = ((AvatarImage.bounds.height * (1.0 + avatarScaleFactor)) - AvatarImage.bounds.height) / 2.0
            avatarTransform = CATransform3DTranslate(avatarTransform, 0, avatarSizeVariation, 0)
            avatarTransform = CATransform3DScale(avatarTransform, 1.0 - avatarScaleFactor, 1.0 - avatarScaleFactor, 0)
            
            if offset <= offset_HeaderStop {
                
                if AvatarImage.layer.zPosition < Header.layer.zPosition{
                    Header.layer.zPosition = 0
                }
                
            }else {
                if AvatarImage.layer.zPosition >= Header.layer.zPosition{
                    Header.layer.zPosition = 2
                }
            }
        }
        // Apply Transformations
        Header.layer.transform = headerTransform
        AvatarImage.layer.transform = avatarTransform
    }
    

    
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    
    
    override func viewWillDisappear(animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 20
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = ProfileTable.dequeueReusableCellWithIdentifier("profilecell", forIndexPath: indexPath) as! ProfileTableCell
        return cell
    }

    
   

   
}
