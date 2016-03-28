//
//  NavController.swift
//  tete
//
//  Created by Adolfrank on 3/27/16.
//  Copyright © 2016 FrankAdol. All rights reserved.
//

import UIKit

class NavController: UINavigationController {

    var tmpImages:[UIImageView] = [UIImageView]()
//    var someInts = Int[]()
    
   
    
    
    lazy var lastTmpImage:UIImageView = {
        let lastTmpImage:UIImageView = self.tmpImages[self.tmpImages.count - 2]
        let window:UIWindow = UIApplication.sharedApplication().keyWindow!
        lastTmpImage.frame = window.bounds
        return lastTmpImage
    }()
    
    
    @IBAction func tocuid(sender: AnyObject) {
        print("hahaha")
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let recognizer: UIPanGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(NavController.dragging(_:)))
        self.view.addGestureRecognizer(recognizer)
        
    }

    
    
    func createScreenShot() {
        UIGraphicsBeginImageContext(self.view.frame.size)
        self.view.layer.renderInContext(UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        let tmpImage = UIImageView(image: image)
        self.tmpImages.append(tmpImage)
    }
    
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        if self.tmpImages.count > 0 {
            return
        } else {
            createScreenShot()
        }
    }
    
    
    
    func dragging(recognizer: UIPanGestureRecognizer){
        
        
        if self.viewControllers.count <= 1 {  // 判断4:A 如果只有1个子控制器,禁止拖拽
            return
        }
        else {   // 判断4: B如果有2个控制器
            
                let tx:CGFloat = recognizer.translationInView(self.view).x
            
                if tx < 0  // －－－－－－判断3: A禁止右滑－－－－－－
                {
                    return
                }
                
                else {  // －－－－－－判断3: B左滑－－－－－－
                   
                    if recognizer.state == UIGestureRecognizerState.Ended || recognizer.state == UIGestureRecognizerState.Cancelled {   // －－－－－－判断2:左滑  A正常结束－－－－－－
                        let x :CGFloat = self.view.frame.origin.x
                        
                        
                                if ( x >= self.view.frame.size.width * 0.5 ) {   //判断1：左滑  A:距离足够
                                    UIView.animateWithDuration(0.25, animations: {
                                        self.view.transform = CGAffineTransformMakeTranslation(self.view.frame.size.width, 0)
                                        }, completion: { (true) in
                                            self.tmpImages.removeLast()
                                            self.lastTmpImage.removeFromSuperview()
                                            self.popViewControllerAnimated(false)
                                            self.view.transform = CGAffineTransformIdentity
                                    })
                                } else {  // 判断1：左滑  B: 距离不足
                                    UIView.animateWithDuration(0.25, animations: {
                                    self.view.transform = CGAffineTransformIdentity
                                    })
                                   
                                }
                        } else {  // －－－－－－判断2:左滑   B 其他情况－－－－－－
                        self.view.transform = CGAffineTransformMakeTranslation(tx, 0)
                        let window:UIWindow = UIApplication.sharedApplication().keyWindow!
                        self.lastTmpImage.image = self.tmpImages[self.tmpImages.count - 2].image
//                        let ox = self.view.transform.tx
//                        print(ox)
//                        lastTmpImage.transform = CGAffineTransformMakeTranslation(ox - 375, 0)
                        window.insertSubview(lastTmpImage, atIndex: 0)
                    }
               
                }   // －－－－－－判断3 B左滑－－－－－－
           
        }  // 判断4: B如果有2个控制器
    }

    
    override func pushViewController(viewController: UIViewController, animated: Bool) {
        super.pushViewController(viewController, animated: true)
        createScreenShot()
    }
    
}
