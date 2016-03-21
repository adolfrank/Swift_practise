//
//  imageCell.swift
//  06-day
//
//  Created by Hongbo Yu on 16/3/21.
//  Copyright © 2016年 Frank. All rights reserved.
//

import UIKit

class imageCell: UICollectionViewCell {
  
    @IBOutlet weak var featureImage: UIImageView!
    @IBOutlet weak var featureLable: UILabel!
    
    var interest: data! {
        didSet {
            updateUI()
        }
    }
    
    private func updateUI() {
        featureLable?.text! = interest.title
        featureImage?.image! = interest.featuredImage
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = 8.0
        self.clipsToBounds = true
    }
    
    
}
