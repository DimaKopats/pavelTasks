//
//  ViewController.swift
//  Animation_groups
//
//  Created by Dmitry on 07.11.17.
//  Copyright © 2017 Dzmitry Kopats. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var card: UIImageView!
    @IBOutlet weak var card2: UIImageView!
    var catFirst = false
    var group1 = CAAnimationGroup()
    var group2 = CAAnimationGroup()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // animation for group1
        let animationDuration: CFTimeInterval = 1.2
        
        let zPosition = CABasicAnimation(keyPath: "zPosition")
        zPosition.fromValue = -1
        zPosition.toValue = 1
        zPosition.duration = animationDuration
        
        let rotation = CAKeyframeAnimation(keyPath: "transform.rotation")
        rotation.values = [0, 0.14, 0]
        rotation.duration = animationDuration
        rotation.timingFunctions = [CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)]
        
        let position = CAKeyframeAnimation(keyPath: "position")
        position.values = [CGPoint.zero, CGPoint.init(x: 110, y: -20), CGPoint.zero]
        position.timingFunctions = [CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)]
        position.isAdditive = true
        position.duration = animationDuration
        
        group1.animations = [zPosition, rotation, position]
        group1.duration = animationDuration
        
        // animation for group2
        let zPosition2 = CABasicAnimation(keyPath: "zPosition")
        zPosition2.fromValue = 1
        zPosition2.toValue = -1
        zPosition2.duration = animationDuration
        
        let rotation2 = CAKeyframeAnimation(keyPath: "transform.rotation")
        rotation2.values = [0, -0.14, 0]
        rotation2.duration = animationDuration
        rotation2.timingFunctions = [CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)]
        
        let position2 = CAKeyframeAnimation(keyPath: "position")
        position2.values = [CGPoint.zero, CGPoint.init(x: -110, y: -20), CGPoint.zero]
        position2.timingFunctions = [CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)]
        position2.isAdditive = true
        position2.duration = animationDuration
        
        group2.animations = [zPosition2, rotation2, position2]
        group2.duration = animationDuration
        
        let tapGesture = UITapGestureRecognizer.init(target: self, action: #selector(startShuffle))
        self.view.addGestureRecognizer(tapGesture)
        
    }
    
    func startShuffle() {
        if catFirst {
            card.layer.add(group2, forKey: "shuffle")
            card2.layer.add(group1, forKey: "shuffle")
        } else {
            card.layer.add(group1, forKey: "shuffle")
            card2.layer.add(group2, forKey: "shuffle")
        }
        
        card.layer.zPosition = CGFloat(NSNumber(booleanLiteral: !catFirst))
        card2.layer.zPosition = CGFloat(NSNumber(booleanLiteral: catFirst))
        
        catFirst = !catFirst
    }
}

