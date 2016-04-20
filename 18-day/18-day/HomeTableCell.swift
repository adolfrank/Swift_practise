//
//  HomeTableCell.swift
//  18-day
//
//  Created by Hongbo Yu on 16/4/20.
//  Copyright © 2016年 Frank. All rights reserved.
//

import UIKit

class HomeTableCell: UITableViewCell {
    
    @IBOutlet weak var bannerImageView: UIImageView!
    @IBOutlet weak var avatarView: UIImageView!
    @IBOutlet weak var titleView: UILabel!
    @IBOutlet weak var authorView: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        avatarView.layer.cornerRadius = 4
        avatarView.layer.masksToBounds = true
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
