//
//  DKCustomCell4.swift
//  constraints_task1
//
//  Created by Dmitry on 19.10.17.
//  Copyright © 2017 Dzmitry Kopats. All rights reserved.
//

import UIKit

class DKCustomCell4: DKCustomRootCell {
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var ImageViewCircle: UIImageView!
    @IBOutlet weak var viewSeparator: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.customize(titleLabel: labelTitle, descriptionLabel: labelDescription)
        self.customize(circle: ImageViewCircle)
        viewSeparator.backgroundColor = .lightGray
        self.backgroundColor = .red
        // using UIStackView.
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
