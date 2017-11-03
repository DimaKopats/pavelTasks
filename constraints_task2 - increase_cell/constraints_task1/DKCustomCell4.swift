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
        // light pink color
        self.backgroundColor = UIColor.init(red: 255/255, green: 92/255, blue: 150/255, alpha: 1)
        // using UIStackView
    }
    
    override func loadCellUsing(model: CellModel) {
        labelTitle.text = model.title
        labelDescription.text = model.descriptionText
        isExpanded = model.isExpanded
        labelDescription.isHidden = !isExpanded
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
