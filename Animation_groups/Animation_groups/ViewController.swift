//
//  ViewController.swift
//  Animation_groups
//
//  Created by Dmitry on 07.11.17.
//  Copyright © 2017 Dzmitry Kopats. All rights reserved.
//

import UIKit

private enum Constants {
    static let animationDuration: CFTimeInterval = 1.2
    static let animationKey: String = "shuffle"
}

class ViewController: UIViewController {
    
    @IBOutlet weak var card: UIImageView!
    @IBOutlet weak var card2: UIImageView!
    
    var catFirst = false
    var animationGroup = CAAnimationGroup()
    var invertedAnimationGroup = CAAnimationGroup()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAnimationGroups()
        addGestureRecognizer()
        printConfigVariables()
        setupBackground()
    }
}
 
private extension ViewController {
    func setupAnimationGroups() {
        animationGroup.animations = createAnimationGroup(invert: false)
        animationGroup.duration = Constants.animationDuration
        
        invertedAnimationGroup.animations = createAnimationGroup(invert: true)
        invertedAnimationGroup.duration = Constants.animationDuration
    }
    
    func createAnimationGroup(invert: Bool) -> [CAAnimation]? {
        let sign = Int(truncating: NSNumber(booleanLiteral: invert))
        
        let zPosition = CABasicAnimation(keyPath: "zPosition")
        zPosition.fromValue = 1 * sign
        zPosition.toValue = -1 * sign
        zPosition.duration = Constants.animationDuration
        
        let rotation = CAKeyframeAnimation(keyPath: "transform.rotation")
        rotation.values = [0, (-0.14 * Double(sign)), 0]
        rotation.duration = Constants.animationDuration
        rotation.timingFunctions = [CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)]
        
        let position = CAKeyframeAnimation(keyPath: "position")
        position.timingFunctions = [CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)]
        position.isAdditive = true
        position.values = [CGPoint.zero, CGPoint.init(x: -110 * sign, y: -20), CGPoint.zero]
        position.duration = Constants.animationDuration
        
        return [zPosition, rotation, position]
    }
    
    func addGestureRecognizer() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(startShuffle))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func startShuffle() {
        card.layer.add((catFirst ? invertedAnimationGroup : animationGroup), forKey: Constants.animationKey)
        card2.layer.add((catFirst ? animationGroup : invertedAnimationGroup), forKey: Constants.animationKey)
        
        card.layer.zPosition = CGFloat(truncating: NSNumber(booleanLiteral: !catFirst))
        card2.layer.zPosition = CGFloat(truncating: NSNumber(booleanLiteral: catFirst))
        
        catFirst = !catFirst
    }
    
    func printConfigVariables() {
        printKeyValuePair("Backend url")
        printKeyValuePair("Consumer secret")
        printKeyValuePair("Consumer key")
    }
    
    func printKeyValuePair(_ key: String) {
        print("\(key) = \(infoForKey(key))")
    }
    
    func infoForKey(_ key: String) -> String {
           return (Bundle.main.infoDictionary?[key] as? String)?
               .replacingOccurrences(of: "\\", with: "") ?? ""
    }
    
    func setupBackground() {
        let color: UIColor
        #if RELEASE
        color = UIColor.darkGray
        #elseif DEBUG
        color = UIColor.brown
        #elseif STAGING
        color = UIColor.white
        #else
        color = UIColor.green
        #endif
        
        view.backgroundColor = color
    }
}
