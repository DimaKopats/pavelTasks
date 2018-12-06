//
//  AnimationHelper.swift
//  Animation_Test
//
//  Created by dmitri on 12/6/18.
//  Copyright © 2018 Dzmitry Kopats. All rights reserved.
//

import UIKit

class Animator {
    let cornerRadius: CGFloat
    
    init(cornerRadius: CGFloat) {
        self.cornerRadius = cornerRadius
    }
    
    func transformToCircle(view: UIView) {
        view.layer.borderWidth = 3
        view.layer.cornerRadius = cornerRadius
        view.layer.borderColor = UIColor.gray.cgColor
    }
    
    func createRandomColor() -> (UIColor) {
        let rand1:CGFloat = ((CGFloat)(arc4random() % 256))/255
        let rand2:CGFloat = ((CGFloat)(arc4random() % 256))/255
        let rand3:CGFloat = ((CGFloat)(arc4random() % 256))/255
        
        let color = UIColor(red: rand1,
                            green: rand2,
                            blue: rand3,
                            alpha: 1)
        return color
    }
    
    // moving along Y axis in linear
    func yLineAnimationFor(startPoint: CGPoint, finishPoint: CGPoint, animationDuration: CFTimeInterval) -> CABasicAnimation {
        let yAnimation = CABasicAnimation()
        yAnimation.keyPath = "position.y"
        yAnimation.fromValue = startPoint.y
        yAnimation.toValue = finishPoint.y
        yAnimation.duration = animationDuration
        return yAnimation
    }
    
    // moving along X axis in linear
    func xLineAnimationFor(startPoint: CGPoint, finishPoint: CGPoint, animationDuration: CFTimeInterval) -> CABasicAnimation {
        let xAnimation = CABasicAnimation()
        xAnimation.keyPath = "position.x"
        xAnimation.fromValue = startPoint.x
        xAnimation.toValue = finishPoint.x
        xAnimation.duration = animationDuration
        return xAnimation
    }
}
