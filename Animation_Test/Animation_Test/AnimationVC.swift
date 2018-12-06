//
//  ViewController.swift
//  Animation_Test
//
//  Created by Dmitry on 26.10.17.
//  Copyright © 2017 Dzmitry Kopats. All rights reserved.
//

import UIKit

class AnimationVC: UIViewController {
    
    @IBOutlet weak var circle1: UIView!
    @IBOutlet weak var circle2: UIView!
    @IBOutlet weak var circle3: UIView! // for animation using block
    
    let animator = Animator.init(cornerRadius: 25)
    var randomColor: UIColor = UIColor.init(red: 196/255, green: 249/255, blue: 78/255, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animator.transformToCircle(view: circle1)
        animator.transformToCircle(view: circle2)
        animator.transformToCircle(view: circle3)
        
        circle3.isHidden = true
        circle2.backgroundColor = randomColor
        
        //creating ball
        let ball = UIImageView.init(image: #imageLiteral(resourceName: "smallBall"))
        ball.frame.size = circle1.frame.size
        circle1.addSubview(ball)
        
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(AnimationVC.sampleTapGestureTapped(recognizer:)))
        self.view.addGestureRecognizer(tapGR)
    }
    
    func sampleTapGestureTapped(recognizer: UITapGestureRecognizer) {
        var tapPoint = recognizer.location(in: self.view)
        let animationDuration: CFTimeInterval = 5 // animation diration in seconds
        tapPoint = self.check(tapPoint: tapPoint, indentFromBoard: animator.cornerRadius + 1)
        
        print("tapPoint == \(tapPoint)")
//        print("self.circle2.layer.presentation()?.frame.origin == \(self.circle2.layer.presentation()?.frame.origin ?? CGPoint(x: 0, y: 0))")
        if self.view.hitTest(tapPoint, with: nil) == self.circle2 {
            print("tap inside circle2-------------------------")
        } else {
            print("tap outside circle2")
            self.circle2.frame.origin = (self.circle2.layer.presentation()?.frame.origin)!
            if let presentationColor = self.circle2.layer.presentation()?.backgroundColor {
//                self.circle2.backgroundColor = UIColor(cgColor: presentationColor)
            }
            
            self.circle1.frame.origin = (self.circle1.layer.presentation()?.frame.origin)!
//            self.circle2.layer.removeAllAnimations()
//            print("animations = \(self.circle2.layer.animationKeys())")
        }
        // moving circle with zigZag
        moveWithHorizontalZigZag(circle: self.circle2,
                                 finishPoint: tapPoint,
                                 animationDuration: animationDuration,
                                 cornerRadius: animator.cornerRadius)
        // moving ball circle linear
        moveInLine(circle: circle1,
                   finishPoint: tapPoint,
                   animationDuration: animationDuration)
    }
    
    func check(tapPoint: CGPoint, indentFromBoard: CGFloat) -> CGPoint {
        var resultPoint = tapPoint
        let screenBounds = UIScreen.main.bounds
        
        if resultPoint.x <= indentFromBoard {
            resultPoint.x = indentFromBoard
        } else if resultPoint.x >= (screenBounds.width - indentFromBoard) {
            resultPoint.x = screenBounds.width - indentFromBoard
        }
        
        if resultPoint.y <= indentFromBoard {
            resultPoint.y = indentFromBoard
        } else if resultPoint.y >= (screenBounds.height - indentFromBoard) {
            resultPoint.y = screenBounds.height - indentFromBoard
        }
        
        return resultPoint
    }

    // moving view + horizontal ZigZag
    func moveWithHorizontalZigZag(circle: UIView, finishPoint: CGPoint, animationDuration: CFTimeInterval, cornerRadius: CGFloat) {
        let startPoint = circle.center
        let indent = cornerRadius + 1
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
        zoomInAnimation.fillMode = kCAFillModeForwards
        
        let zoomOutAnimation = CABasicAnimation()
        zoomOutAnimation.keyPath = "transform.scale"
        zoomOutAnimation.toValue = 1
        zoomOutAnimation.duration = 0.25*animationDuration
        zoomOutAnimation.beginTime = 0.75*animationDuration
        zoomOutAnimation.isRemovedOnCompletion = false
        zoomOutAnimation.fillMode = kCAFillModeForwards
        
        // change backgroundColor animation
        let colorAnimation = CABasicAnimation()
        colorAnimation.keyPath = "backgroundColor"
        colorAnimation.fromValue = circle.backgroundColor
        colorAnimation.toValue = randomColor
        colorAnimation.duration = animationDuration
//        colorAnimation.isRemovedOnCompletion = false
//        colorAnimation.fillMode = kCAFillModeForwards
        
        let animationGroup = CAAnimationGroup()
        animationGroup.timingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseInEaseOut)
        animationGroup.animations = [xAnimation, yAnimation, zoomInAnimation, zoomOutAnimation, colorAnimation]
        animationGroup.duration = animationDuration
        animationGroup.isRemovedOnCompletion = false
        animationGroup.fillMode = kCAFillModeForwards
        
        circle.layer.add(animationGroup, forKey: "movingHorizontalZigZag")
        
        circle.layer.position = CGPoint.init(x: finishPoint.x, y: finishPoint.y)
//        circle.layer.backgroundColor = randomColor
//        circle.backgroundColor = UIColor(cgColor: randomColor)
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
//                rotationAnimation.isRemovedOnCompletion = false
//                rotationAnimation.fillMode = kCAFillModeForwards
        
        let animationGroup = CAAnimationGroup()
        animationGroup.animations = [xAnimation, yAnimation, rotationAnimation]
        animationGroup.duration = animationDuration
        circle.layer.add(animationGroup, forKey: "movingLinear")
        
        circle.layer.position = CGPoint.init(x: finishPoint.x, y: finishPoint.y)
    }
    
}

extension AnimationVC: CAAnimationDelegate {
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        circle1.layer.position = CGPoint.init(x: 25, y: circle1.center.y)
    }
}

