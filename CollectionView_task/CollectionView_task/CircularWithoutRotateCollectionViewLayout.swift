//
//  CircularWithoutRotateCollectionViewLayout.swift
//  CollectionView_task
//
//  Created by Dzmitry Kopats on 11/9/17.
//  Copyright © 2017 Dzmitry Kopats. All rights reserved.
//

import UIKit

let horizontalIndent1: CGFloat = 0
let verticalIndent1: CGFloat = 150
let itemSizeHeight1: CGFloat = 100
let itemSizeWidth1: CGFloat = 100
let screenWidth1 = UIScreen.main.bounds.width

class CircularWithoutRotateCollectionViewLayoutAttributes: UICollectionViewLayoutAttributes {
    var anchorPoint = CGPoint(x: 0.5, y: 0.5)
    var angle: CGFloat = 0 {
        didSet {
            zIndex = Int(angle * 1000000)
            transform = CGAffineTransform(rotationAngle: angle)
        }
    }
    override func copy(with zone: NSZone? = nil) -> Any {
        let copiedAttributes: CircularWithoutRotateCollectionViewLayoutAttributes =
            super.copy(with: zone) as! CircularWithoutRotateCollectionViewLayoutAttributes
        copiedAttributes.anchorPoint = self.anchorPoint
        copiedAttributes.angle = self.angle
        return copiedAttributes
    }
}

class CircularWithoutRotateCollectionViewLayout: UICollectionViewLayout {
    let itemSize = CGSize(width: itemSizeWidth1, height: itemSizeHeight1)
    var attributesList = [CircularWithoutRotateCollectionViewLayoutAttributes]()

    var angleAtExtreme: CGFloat {
        return collectionView!.numberOfItems(inSection: 0) > 0 ?
            -CGFloat(collectionView!.numberOfItems(inSection: 0) - 1) * anglePerItem : 0
    }
    var angle: CGFloat {
        return angleAtExtreme * collectionView!.contentOffset.x / (collectionViewContentSize.width - collectionView!.bounds.width)
    }
    
    var radius: CGFloat = screenWidth1/2 - itemSizeHeight1 - horizontalIndent1 {
        didSet {
            invalidateLayout()
        }
    }
    
    var anglePerItem: CGFloat {
        return 2*CGFloat.pi/CGFloat(collectionView!.numberOfItems(inSection: 0))
    }
    
    
    override var collectionViewContentSize: CGSize {
        return CGSize(width: CGFloat(collectionView!.numberOfItems(inSection: 0)) * itemSize.width,
                      height: collectionView!.bounds.height)
    }
    
    override func prepare() {
        super.prepare()
        
        let centerX = collectionView!.contentOffset.x + (collectionView!.bounds.width / 2.0)
        let centerY = collectionView!.contentOffset.y + verticalIndent1
        let anchorPointY = ((itemSize.height / 2.0) + radius) / itemSize.height
        let numberOfItems = collectionView!.numberOfItems(inSection: 0)
        attributesList = (0..<numberOfItems).map { (i)
            -> CircularWithoutRotateCollectionViewLayoutAttributes in
            let attributes = CircularWithoutRotateCollectionViewLayoutAttributes(forCellWith: IndexPath(item: i, section: 0))
            
            attributes.size = self.itemSize
            
            attributes.center = CGPoint(x: centerX, y: centerY)
            attributes.angle = self.angle + (self.anglePerItem * CGFloat(i))
            attributes.anchorPoint = CGPoint(x: 0.5, y: anchorPointY)
            return attributes
        }
    }
    
    override class var layoutAttributesClass: AnyClass {
        return CircularWithoutRotateCollectionViewLayoutAttributes.self
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return attributesList
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return attributesList[indexPath.item]
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
}


