//
//  DKCustomCell3.swift
//  constraints_task1
//
//  Created by Dmitry on 17.10.17.
//  Copyright © 2017 Dzmitry Kopats. All rights reserved.
//

import UIKit

class DKCustomCell3: DKCustomRootCell {
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var ImageViewCircle: UIImageView!
    @IBOutlet weak var viewSeparator: UIView!
    
    // labels constraints
    var labelsLeadingAlign: NSLayoutConstraint!
    var labelsTrailingAlign: NSLayoutConstraint!
    var labelsBottomConstraint: NSLayoutConstraint!
    var labelsIndentConstraint: NSLayoutConstraint!
    var titleBottomConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.customize(titleLabel: labelTitle, descriptionLabel: labelDescription)
        self.customize(circle: ImageViewCircle)
        // light green color
        self.backgroundColor = UIColor.init(red: 99/255, green: 245/255, blue: 147/255, alpha: 1)
        viewSeparator.backgroundColor = .lightGray
        
        labelTitle.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 751), for: .vertical)
        
        labelTitle.translatesAutoresizingMaskIntoConstraints = false;
        labelDescription.translatesAutoresizingMaskIntoConstraints = false;
        ImageViewCircle.translatesAutoresizingMaskIntoConstraints = false;
        viewSeparator.translatesAutoresizingMaskIntoConstraints = false;

        // using anchors
        
        // labels
        labelTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 23).isActive = true
        labelTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -33).isActive = true
        
        // circle
        ImageViewCircle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 33).isActive = true
        ImageViewCircle.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        ImageViewCircle.trailingAnchor.constraint(equalTo: labelTitle.leadingAnchor, constant: -15).isActive = true
        ImageViewCircle.heightAnchor.constraint(equalToConstant: 50).isActive = true
        ImageViewCircle.widthAnchor.constraint(equalToConstant: 50).isActive = true
        // separator constraints
        viewSeparator.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        viewSeparator.heightAnchor.constraint(equalToConstant: 2).isActive = true
        viewSeparator.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        viewSeparator.leadingAnchor.constraint(equalTo: labelTitle.leadingAnchor).isActive = true
        
        
        titleBottomConstraint = labelTitle.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -25.1)
        titleBottomConstraint.priority = UILayoutPriority(rawValue: 990)
        labelsBottomConstraint = labelDescription.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -25)
        labelsIndentConstraint = labelDescription.topAnchor.constraint(equalTo: labelTitle.bottomAnchor, constant: 15)
        labelsLeadingAlign = labelTitle.leadingAnchor.constraint(equalTo: labelDescription.leadingAnchor)
        labelsTrailingAlign = labelTitle.trailingAnchor.constraint(equalTo: labelDescription.trailingAnchor)
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
        
        // Configure the view for the selected state
    }
    
}
