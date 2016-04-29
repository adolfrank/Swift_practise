//
//  HomeViewController.swift
//  22-day
//
//  Created by Hongbo Yu on 16/4/29.
//  Copyright © 2016年 Frank. All rights reserved.
//

import UIKit


class HomeViewController: UICollectionViewController, UINavigationControllerDelegate {

     var selectedCell: CardViewCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        self.navigationController?.delegate = self
    }
    
    
    // MARK: UICollectionViewDataSource
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cardCell", forIndexPath: indexPath) as! CardViewCell
        cell.cardImage.image = UIImage(named: "2")
        return cell
    }

    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "detail" {
            let detailVC = segue.destinationViewController as! DetailViewController
            detailVC.image = self.selectedCell.cardImage.image
        }
    }
    
    
    
    func navigationController(navigationController: UINavigationController, animationControllerForOperation operation: UINavigationControllerOperation, fromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if operation == UINavigationControllerOperation.Push {
            return MagicMoveTransion()
        } else {
            return nil
        }
    }
    
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        self.selectedCell = collectionView.cellForItemAtIndexPath(indexPath) as! CardViewCell
        self.performSegueWithIdentifier("detail", sender: nil)
    }

}
