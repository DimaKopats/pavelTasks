////
////  CircularCollectionViewLayout.swift
////  CollectionView_task
////
////  Created by Dzmitry Kopats on 11/9/17.
////  Copyright © 2017 Dzmitry Kopats. All rights reserved.
////
//
//import UIKit
//
//let horizontalIndent: CGFloat = 0
//let verticalIndent: CGFloat = 150
//let itemSizeHeight: CGFloat = 100
//let itemSizeWidth: CGFloat = 100
//let screenWidth = UIScreen.main.bounds.width
//
//class CircularCollectionViewLayoutAttributes: UICollectionViewLayoutAttributes {
//    var anchorPoint = CGPoint(x: 0.5, y: 0.5)
//    var angle: CGFloat = 0 {
//        didSet {
//            zIndex = Int(angle * 1000000)
//            transform = CGAffineTransform(rotationAngle: angle)
//        }
//    }
//    override func copy(with zone: NSZone? = nil) -> Any {
//        let copiedAttributes: CircularCollectionViewLayoutAttributes =
//            super.copy(with: zone) as! CircularCollectionViewLayoutAttributes
//        copiedAttributes.anchorPoint = self.anchorPoint
//        copiedAttributes.angle = self.angle
//        return copiedAttributes
//    }
//}
//
//class CircularCollectionViewLayout: UICollectionViewLayout {
//    let itemSize = CGSize(width: itemSizeWidth, height: itemSizeHeight)
//    
//    var angleAtExtreme: CGFloat {
//        return collectionView!.numberOfItems(inSection: 0) > 0 ?
//            -CGFloat(collectionView!.numberOfItems(inSection: 0) - 1) * anglePerItem : 0
//    }
//    var angle: CGFloat {
//        return angleAtExtreme * collectionView!.contentOffset.x / (collectionViewContentSize.width - collectionView!.bounds.width)
//    }
//    
//    var radius: CGFloat = screenWidth/2 - itemSizeHeight - horizontalIndent {
//        didSet {
//            invalidateLayout()
//        }
//    }
//    
//    var anglePerItem: CGFloat {
////        return atan(itemSize.width / radius)
//        return 2*CGFloat.pi/CGFloat(collectionView!.numberOfItems(inSection: 0))
//    }
//    
//    var attributesList = [CircularCollectionViewLayoutAttributes]()
//    
//    override var collectionViewContentSize: CGSize {
//        return CGSize(width: CGFloat(collectionView!.numberOfItems(inSection: 0)) * itemSize.width,
//                      height: collectionView!.bounds.height)
//    }
//    
//    override func prepare() {
//        super.prepare()
//        
//        let centerX = collectionView!.contentOffset.x + (collectionView!.bounds.width / 2.0)
//        let centerY = collectionView!.contentOffset.y + verticalIndent
//        let anchorPointY = ((itemSize.height / 2.0) + radius) / itemSize.height
//        
//        attributesList = (0..<collectionView!.numberOfItems(inSection: 0)).map { (i)
//            -> CircularCollectionViewLayoutAttributes in
//            // 1
//            let attributes = CircularCollectionViewLayoutAttributes(forCellWith: IndexPath(item: i, section: 0))
//            attributes.size = self.itemSize
//            // 2
//            
//            attributes.center = CGPoint(x: centerX, y: centerY)
//            // 3
//            attributes.angle = self.angle + (self.anglePerItem * CGFloat(i))
//            attributes.anchorPoint = CGPoint(x: 0.5, y: anchorPointY)
//            return attributes
//        }
//    }
//    
//    override class var layoutAttributesClass: AnyClass {
//        return CircularCollectionViewLayoutAttributes.self
//    }
//    
//    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
//        return attributesList
//    }
//    
//    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
//        return attributesList[indexPath.item]
//    }
//    
//    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
//        return true
//    }
//}

