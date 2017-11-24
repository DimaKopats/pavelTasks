//
//  DKTableViewCell.swift
//  VKReader
//
//  Created by Dzmitry Kopats on 11/20/17.
//  Copyright © 2017 Dzmitry Kopats. All rights reserved.
//

import UIKit

class DKTableViewCell: UITableViewCell {

    @IBOutlet weak var groupLogo: UIImageView!
    @IBOutlet weak var groupTitle: UILabel!
    @IBOutlet weak var postTime: UILabel!
    @IBOutlet weak var postTitle: UILabel!
    @IBOutlet weak var bigPhoto: UIImageView!
    @IBOutlet weak var verticalStackView: UIStackView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        bigPhoto.frame.size = CGSize(width: 200, height: 100)
        bigPhoto.backgroundColor = UIColor.lightGray
        groupLogo.backgroundColor = UIColor.cyan
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
