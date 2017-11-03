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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cellImage.backgroundColor = createRandomColor()
        print("DKCollectionViewCell - awakeFromNib")
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

}
