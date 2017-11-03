//
//  ViewController.swift
//  simple_animation_test
//
//  Created by Dmitry on 27.10.17.
//  Copyright © 2017 Dzmitry Kopats. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var circle: UIView!
    @IBOutlet weak var circle2: UIView!
    
    let cornerRadius: CGFloat = 25
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.lightGray
        customize(circle: circle)
        customize(circle: circle2)
        circle2.backgroundColor = UIColor.init(red: 196/255, green: 249/255, blue: 78/255, alpha: 1)
        let tapGR = UITapGestureRecognizer.init(target: self, action: #selector(ViewController.restartAnimationAfterTapped(recognizer:)))
        self.view.addGestureRecognizer(tapGR)
        self.startSputnik()
    }
    
    func startSputnik() {
        let sputnikImageView = UIImageView.init(frame: CGRect(x: 0, y: 40, width: 90, height: 70))
        sputnikImageView.image = #imageLiteral(resourceName: "sputnik")
        
        let rectSize = UIScreen.main.bounds.width - 90
        
        let boundingRect = CGRect(x: 0, y: 0, width: rectSize, height: rectSize)
        
        let orbitAnimation = CAKeyframeAnimation()
        orbitAnimation.keyPath = "position"
        orbitAnimation.path = CGPath(ellipseIn: boundingRect, transform: nil)
        orbitAnimation.duration = 10
        orbitAnimation.isAdditive = true
        orbitAnimation.repeatCount = 50
        orbitAnimation.calculationMode = kCAAnimationPaced
        orbitAnimation.rotationMode = kCAAnimationRotateAuto
        sputnikImageView.layer.add(orbitAnimation, forKey: "orbit")
        
        
        
        self.view.addSubview(sputnikImageView)
    }
    
    func restartAnimationAfterTapped(recognizer: UITapGestureRecognizer) {
//        let secondVC = SecondViewController()
//        let transition = CATransition()
//        transition.duration = 2.35
//        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
//        transition.type = kCATransitionFade // затемнение
//        transition.type = kCATransitionMoveIn // замена
//        transition.type = kCATransitionPush // выталкивание + naviBar?
//        transition.type = kCATransitionReveal // выталкивание?
//        transition.subtype = kCATransitionFromTop
        //        self.navigationController?.view.layer.add(transition, forKey: nil)
//        self.navigationController?.pushViewController(secondVC, animated: false)
        
        
        print("restart animation")
        animate(circle: circle)
        animate2(circle: circle2)
        animate3(circle: circle2)
    }
    
    func customize(circle: UIView) {
        circle.layer.borderWidth = 3
        circle.layer.cornerRadius = cornerRadius
        circle.layer.borderColor = UIColor.gray.cgColor
    }
    
    func animate(circle: UIView) {
        let animation = CABasicAnimation()
        animation.keyPath = "position.x"
        animation.fromValue = circle.frame.origin.x
        animation.toValue = UIScreen.main.bounds.size.width - self.cornerRadius
        animation.duration = 4
        animation.isRemovedOnCompletion = false
        //        animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
//                animation.fillMode = kCAFillModeForwards
        
        circle.layer.add(animation, forKey: "basic")
        circle.layer.position = CGPoint.init(x: 250,
                                             y: circle.frame.origin.y + self.cornerRadius)
        
    }
    
    func animate2(circle: UIView) {
        
        let animation = CABasicAnimation()
        animation.keyPath = "position.y"
        animation.fromValue = circle.frame.origin.y + self.cornerRadius
        animation.toValue = circle.frame.origin.y + self.cornerRadius + 200
        animation.duration = 4
//        animation.isRemovedOnCompletion = false
        
        circle.layer.add(animation, forKey: "basic")
        circle.layer.position = CGPoint.init(x: circle.frame.origin.x + self.cornerRadius,
                                             y: circle.frame.origin.y + self.cornerRadius + 20)
        animation.isCumulative = true
        
    }
    
    func animate3(circle: UIView) {
        
    }
    
    func keyFrameAnimationTest(circle: UIView) {
        let animation = CAKeyframeAnimation()
        animation.keyPath = "position.y";
        //        let currentY = circle.frame.origin.y + self.cornerRadius
        animation.values = [ 0, 100, -100, 100, 0 ];
        animation.keyTimes = [ 0, 0.2, 0.6, 0.8, 1 ];
        animation.duration = 4;
        
        animation.isAdditive = true;
        circle.layer.add(animation, forKey: "shake")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

//extension ViewController: CAAnimationDelegate {
//    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
//        circle.layer.position = CGPoint.init(x: 25, y: circle.frame.origin.y + self.cornerRadius)
//    }
//}

