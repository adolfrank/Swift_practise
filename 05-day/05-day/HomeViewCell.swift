//
//  HomeViewCell.swift
//  05-day
//
//  Created by Adolfrank on 3/20/16.
//  Copyright © 2016 FrankAdol. All rights reserved.
//

import UIKit

class HomeViewCell: UITableViewCell {

    @IBOutlet weak var bgView: UIImageView!
  
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
//      self.backgroundColor = UIColor.blueColor()
        bgView.image = UIImage(named: "bg")
    }
    
    
    // Class 初始化
    override init(style: UITableViewCellStyle, reuseIdentifier: String?)
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor.blueColor()
    }
    
    
    required init(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)!
    }

    
}
