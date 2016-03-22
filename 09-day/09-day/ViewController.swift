//
//  ViewController.swift
//  09-day
//
//  Created by Hongbo Yu on 16/3/22.
//  Copyright © 2016年 Frank. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate{

    var imageView:UIImageView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpScrollView()
        setZoomScaleFor(scrollView.bounds.size)
    }

    
    private func setUpScrollView(){
        imageView = UIImageView(image: UIImage(named:"jobs"))
        scrollView.contentSize = imageView.bounds.size
        scrollView.delegate = self
        scrollView.addSubview(imageView)
    }

    private func setZoomScaleFor(srollViewSize: CGSize) {
        let imageSize = imageView.bounds.size
        let widthScale = srollViewSize.width / imageSize.width
        let heightScale = srollViewSize.height / imageSize.height
        scrollView.minimumZoomScale = min(widthScale, heightScale)
        scrollView.maximumZoomScale = max(widthScale, heightScale)
        scrollView.zoomScale = scrollView.minimumZoomScale
    }
    
    
    private func recenterImage() {
        let scrollViewSize = scrollView.bounds.size
        let imageViewSize = imageView.frame.size
        let horizontalSpace = (imageViewSize.width < scrollViewSize.width) ? ((scrollViewSize.width - imageViewSize.width) / 2 ) : 0
        let verticalSpace = (imageViewSize.height < scrollViewSize.height) ? ((scrollViewSize.height - imageViewSize.height) / 2 ) : 0
        scrollView.contentInset = UIEdgeInsetsMake(verticalSpace, horizontalSpace, verticalSpace, horizontalSpace)
        
    }

    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    func scrollViewDidZoom(scrollView: UIScrollView) {
        recenterImage()
    }
}

