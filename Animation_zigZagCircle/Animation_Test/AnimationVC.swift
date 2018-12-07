//
//  ViewController.swift
//  Animation_Test
//
//  Created by Dmitry on 26.10.17.
//  Copyright © 2017 Dzmitry Kopats. All rights reserved.
//

import UIKit

class AnimationVC: BaseVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @objc func sampleTapGestureTapped(recognizer: UITapGestureRecognizer) {
        var tapPoint = recognizer.location(in: view)
        let animationDuration = Constants.animationDuration
        
        tapPoint = updated(tapPoint: tapPoint, using: animator.cornerRadius + 1)
        
        self.circle1.frame.origin = (self.circle1.layer.presentation()?.frame.origin)!
        self.circle2.frame.origin = (self.circle2.layer.presentation()?.frame.origin)!
        // need to fix updating color if we stop animation
        //            if let presentationColor = self.circle2.layer.presentation()?.backgroundColor {
        ////                self.circle2.backgroundColor = UIColor(cgColor: presentationColor)
        //            }
        
        // moving circle with zigZag
        moveWithHorizontalZigZag(circle: circle2,
                                 finishPoint: tapPoint,
                                 animationDuration: animationDuration)
        // moving ball circle linear
        moveInLine(circle: circle1,
                   finishPoint: tapPoint,
                   animationDuration: animationDuration)
    }
    

    // moving view + horizontal ZigZag
    func moveWithHorizontalZigZag(circle: UIView, finishPoint: CGPoint, animationDuration: CFTimeInterval) {
        let startPoint = circle.center
        let indent = animator.cornerRadius + 1
        let screenBounds = UIScreen.main.bounds
        circle.backgroundColor = randomColor
        randomColor = animator.createRandomColor()
        
        let xAnimation = CAKeyframeAnimation()
        xAnimation.keyPath = "position.x"
        
        var resultXPath: CGFloat
        var part1XPath: CGFloat
        let part2XPath = screenBounds.width - 2*indent
        
        let leftBoard = indent - finishPoint.x
        let rightBoard = screenBounds.width - finishPoint.x - indent
        
        // first touch left board
        if startPoint.x < screenBounds.width/2 {
            resultXPath = 2*screenBounds.width + startPoint.x - finishPoint.x - 4*indent
            part1XPath = startPoint.x - indent
            //            let part3XPath = screenBounds.width - tapPoint.x - indentFromBoard
            xAnimation.values = [startPoint.x - finishPoint.x,
                                 leftBoard,
                                 rightBoard,
                                 0]
        } else {
            // first touch right board
            resultXPath = 2*screenBounds.width - startPoint.x + finishPoint.x - 4*indent
            part1XPath = screenBounds.width - startPoint.x - indent
            //            let part3XPath = tapPoint.x - indentFromBoard
            xAnimation.values = [startPoint.x - finishPoint.x,
                                 rightBoard,
                                 leftBoard,
                                 0]
        }
        
        xAnimation.keyTimes = [0,
                               NSNumber(value:Float(part1XPath/resultXPath)),
                               NSNumber(value:Float((part1XPath + part2XPath)/resultXPath)),
                               1]
        xAnimation.duration = animationDuration
        xAnimation.isAdditive = true
        
        let yAnimation = animator.yLineAnimationFor(startPoint: circle.center, finishPoint: finishPoint, animationDuration: animationDuration)
        
        // change circle size animation
        let zoomInAnimation = CABasicAnimation()
        zoomInAnimation.keyPath = "transform.scale"
        zoomInAnimation.toValue = 0.5
        zoomInAnimation.duration = 0.25*animationDuration
        zoomInAnimation.isRemovedOnCompletion = false
        zoomInAnimation.fillMode = CAMediaTimingFillMode.forwards
        
        let zoomOutAnimation = CABasicAnimation()
        zoomOutAnimation.keyPath = "transform.scale"
        zoomOutAnimation.toValue = 1
        zoomOutAnimation.duration = 0.25*animationDuration
        zoomOutAnimation.beginTime = 0.75*animationDuration
        zoomOutAnimation.isRemovedOnCompletion = false
        zoomOutAnimation.fillMode = CAMediaTimingFillMode.forwards
        
        // change backgroundColor animation
        let colorAnimation = CABasicAnimation()
        colorAnimation.keyPath = "backgroundColor"
        colorAnimation.fromValue = circle.backgroundColor
        colorAnimation.toValue = randomColor
        colorAnimation.duration = animationDuration
        
        let animationGroup = CAAnimationGroup()
        animationGroup.timingFunction = CAMediaTimingFunction.init(name: CAMediaTimingFunctionName.easeInEaseOut)
        animationGroup.animations = [xAnimation, yAnimation, zoomInAnimation, zoomOutAnimation, colorAnimation]
        animationGroup.duration = animationDuration
        animationGroup.isRemovedOnCompletion = false
        animationGroup.fillMode = CAMediaTimingFillMode.forwards
        
        circle.layer.add(animationGroup, forKey: "movingHorizontalZigZag")
        
        circle.layer.position = CGPoint.init(x: finishPoint.x, y: finishPoint.y)
    }
    
    // moving view linear
    func moveInLine(circle: UIView, finishPoint: CGPoint, animationDuration: CFTimeInterval) {
        let xAnimation = animator.xLineAnimationFor(startPoint: circle.center, finishPoint: finishPoint, animationDuration: animationDuration)
        
        let yAnimation = animator.yLineAnimationFor(startPoint: circle.center, finishPoint: finishPoint, animationDuration: animationDuration)
        
        // rotation
        let rotationAnimation = CABasicAnimation()
        
        rotationAnimation.keyPath = "transform.rotation"
        rotationAnimation.toValue = CGFloat(.pi * 6.0)
        rotationAnimation.duration = animationDuration
        
        let animationGroup = CAAnimationGroup()
        animationGroup.animations = [xAnimation, yAnimation, rotationAnimation]
        animationGroup.duration = animationDuration
        circle.layer.add(animationGroup, forKey: "movingLinear")
        
        circle.layer.position = CGPoint.init(x: finishPoint.x, y: finishPoint.y)
    }
    
}
