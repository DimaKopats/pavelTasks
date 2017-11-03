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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.customize(titleLabel: labelTitle, descriptionLabel: labelDescription)
        self.customize(circle: ImageViewCircle)
        self.backgroundColor = UIColor.green
        viewSeparator.backgroundColor = .lightGray
        
        // using anchors
        
        labelTitle.translatesAutoresizingMaskIntoConstraints = false;
        labelDescription.translatesAutoresizingMaskIntoConstraints = false;
        ImageViewCircle.translatesAutoresizingMaskIntoConstraints = false;
        viewSeparator.translatesAutoresizingMaskIntoConstraints = false;
        
        
        // labels
        contentView.topAnchor.constraint(equalTo: labelTitle.topAnchor, constant: -23).isActive = true
        labelDescription.topAnchor.constraint(equalTo: labelTitle.bottomAnchor, constant: 15).isActive = true
        labelDescription.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -25).isActive = true
        labelTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -33).isActive = true
        labelTitle.leadingAnchor.constraint(equalTo: labelDescription.leadingAnchor).isActive = true
        labelTitle.trailingAnchor.constraint(equalTo: labelDescription.trailingAnchor).isActive = true
        
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

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
