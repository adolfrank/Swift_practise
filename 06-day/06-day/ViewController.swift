//
//  ViewController.swift
//  06-day
//
//  Created by Hongbo Yu on 16/3/21.
//  Copyright © 2016年 Frank. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var BGView: UIImageView!
    
    @IBOutlet weak var imageFlewView: UICollectionView!
    
    private var interests = data.createInterests()
    
    private struct Storyboard {
        static let CellIdentifier = "InterestCell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
}


extension ViewController : UICollectionViewDataSource {
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return interests.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = imageFlewView.dequeueReusableCellWithReuseIdentifier(Storyboard.CellIdentifier, forIndexPath: indexPath) as! imageCell
        cell.interest = self.interests[indexPath.item]
        return cell
    }
    
}
