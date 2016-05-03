//
//  PatternCell.swift
//  23-day
//
//  Created by Hongbo Yu on 16/5/3.
//  Copyright © 2016年 Frank. All rights reserved.
//

import UIKit

struct pattern {
    let image: String
    let name: String
}

class PatternCell: UITableViewCell {

    @IBOutlet weak var patternImage: UIImageView!
    @IBOutlet weak var patternLable: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
