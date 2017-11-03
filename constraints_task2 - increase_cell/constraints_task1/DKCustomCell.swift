//
//  DKCustomCell.swift
//  constraints_task1
//
//  Created by Dmitry on 13.10.17.
//  Copyright © 2017 Dzmitry Kopats. All rights reserved.
//

import UIKit

class DKCustomCell: DKCustomRootCell {
    
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var ImageViewCircle: UIImageView!
    @IBOutlet weak var viewSeparator: UIView!
    
    // labels constraints
    @IBOutlet var labelsLeadingAlign: NSLayoutConstraint!
    @IBOutlet var labelsTrailingAlign: NSLayoutConstraint!
    @IBOutlet var labelsBottomConstraint: NSLayoutConstraint!
    @IBOutlet var labelsIndentConstraint: NSLayoutConstraint!
    @IBOutlet var titleBottomConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.customize(titleLabel: labelTitle, descriptionLabel: labelDescription)
        self.customize(circle: ImageViewCircle)
    }
    
    override func loadCellUsing(model: CellModel) {
        labelTitle.text = model.title
        labelDescription.text = model.descriptionText
        isExpanded = model.isExpanded
        labelDescription.isHidden = !isExpanded
        
        titleBottomConstraint.isActive = !isExpanded
        labelsBottomConstraint.isActive = isExpanded
        labelsIndentConstraint.isActive = isExpanded
        labelsLeadingAlign.isActive = isExpanded
        labelsTrailingAlign.isActive = isExpanded
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
