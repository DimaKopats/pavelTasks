//
//  DKCollectionViewCell.swift
//  CollectionView_task
//
//  Created by Dmitry on 02.11.17.
//  Copyright © 2017 Dzmitry Kopats. All rights reserved.
//

import UIKit

class DKCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var cellImage: UIImageView!
    var circularMode = false

    override func awakeFromNib() {
        super.awakeFromNib()
        cellImage.backgroundColor = createRandomColor()
        
        contentView.layer.cornerRadius = 10
        contentView.layer.borderColor = UIColor.black.cgColor
        contentView.layer.borderWidth = 5
        contentView.layer.shouldRasterize = true
        contentView.layer.rasterizationScale = UIScreen.main.scale
        contentView.clipsToBounds = true
    }
    
    // MARK: Customize cell
    
    func createRandomColor() -> (UIColor) {
        let rand1:CGFloat = ((CGFloat)(arc4random() % 256))/255
        let rand2:CGFloat = ((CGFloat)(arc4random() % 256))/255
        let rand3:CGFloat = ((CGFloat)(arc4random() % 256))/255
        
        let color = UIColor.init(red: rand1,
                                 green: rand2,
                                 blue: rand3,
                                 alpha: 1)
        return color
    }
    
    override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
        super.apply(layoutAttributes)
        guard let circularlayoutAttributes = layoutAttributes as? CircularWithoutRotateCollectionViewLayoutAttributes else {
            self.layer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
            return
        }

        self.layer.anchorPoint = circularlayoutAttributes.anchorPoint
        self.center.y += (circularlayoutAttributes.anchorPoint.y - 0.5) * self.bounds.height
    }
}
