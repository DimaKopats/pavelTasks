//
//  DKCustomCell2.swift
//  constraints_task1
//
//  Created by Dmitry on 16.10.17.
//  Copyright © 2017 Dzmitry Kopats. All rights reserved.
//

import UIKit

class DKCustomCell2: DKCustomRootCell {
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var ImageViewCircle: UIImageView!
    @IBOutlet weak var viewSeparator: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.customize(titleLabel: labelTitle, descriptionLabel: labelDescription)
        self.customize(circle: ImageViewCircle)
        self.backgroundColor = UIColor.cyan
        viewSeparator.backgroundColor = .lightGray
        
        labelTitle.translatesAutoresizingMaskIntoConstraints = false;
        labelDescription.translatesAutoresizingMaskIntoConstraints = false;
        ImageViewCircle.translatesAutoresizingMaskIntoConstraints = false;
        viewSeparator.translatesAutoresizingMaskIntoConstraints = false;
        
        let views: [String: AnyObject] = ["labelTitle": labelTitle,
                                          "labelDescription": labelDescription,
                                          "ImageViewCircle": ImageViewCircle,
                                          "viewSeparator": viewSeparator,
                                          "contentView": contentView]
        
        var allConstraints = [NSLayoutConstraint]()
        
        
        
        let labelsVerticalConstraints =
            NSLayoutConstraint.constraints( withVisualFormat: "V:|-23-[labelTitle]-15-[labelDescription]",
                                            options: [.alignAllLeading, .alignAllTrailing],
                                            metrics: nil,
                                            views: views)
        allConstraints += labelsVerticalConstraints
        
        let separatorVerticalConstraints =
            NSLayoutConstraint.constraints( withVisualFormat: "V:[labelDescription]-23-[viewSeparator(2)]-0-|",
                                            options: [.alignAllLeading],
                                            metrics: nil,
                                            views: views)
        allConstraints += separatorVerticalConstraints
        
        let circlVerticalConstraints =
            NSLayoutConstraint.constraints(withVisualFormat: "V:[ImageViewCircle(50)]",
                                           options: [],
                                           metrics: nil,
                                           views: views)
        allConstraints += circlVerticalConstraints
        
        let circleAndLabelsHorizontalConstraints =
            NSLayoutConstraint.constraints(withVisualFormat: "H:|-33-[ImageViewCircle(50)]-15-[labelTitle]-33-|",
                                           options: [],
                                           metrics: nil,
                                           views: views)
        allConstraints += circleAndLabelsHorizontalConstraints
        
        let separatorHorizontalConstraints =
            NSLayoutConstraint.constraints(withVisualFormat: "H:[viewSeparator]-0-|",
                                           options: [],
                                           metrics: nil,
                                           views: views)
        allConstraints += separatorHorizontalConstraints
        
        let circleVerticalCenterConstraints =
            NSLayoutConstraint.constraints(withVisualFormat: "H:[contentView]-(<=1)-[ImageViewCircle]",
                                           options: [.alignAllCenterY],
                                           metrics: nil,
                                           views: views)
        allConstraints += circleVerticalCenterConstraints
        
//        let additionalConstraint = NSLayoutConstraint(item: ImageViewCircle,
//                           attribute: NSLayoutAttribute.centerY,
//                           relatedBy: .equal,
//                           toItem: self.contentView,
//                           attribute: NSLayoutAttribute.centerY, multiplier: 1, constant: 0)
//        allConstraints.append(additionalConstraint)
        
        NSLayoutConstraint.activate(allConstraints)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
