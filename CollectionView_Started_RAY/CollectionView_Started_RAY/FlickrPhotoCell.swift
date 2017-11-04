//
//  FlickrPhotoCell.swift
//  CollectionView_Started_RAY
//
//  Created by Dmitry on 02.11.17.
//  Copyright © 2017 Dzmitry Kopats. All rights reserved.
//

import UIKit

class FlickrPhotoCell: UICollectionViewCell {
    
    
    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    // MARK: - Properties
    override var isSelected: Bool {
        didSet {
            ImageView.layer.borderWidth = isSelected ? 10 : 0
        }
    }
    
    // MARK: - View Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        ImageView.layer.borderColor = themeColor.cgColor
        isSelected = false
        self.backgroundColor = UIColor.clear
    }
}
