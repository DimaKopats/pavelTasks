//
//  BaseVC.swift
//  Animation_Test
//
//  Created by dmitri on 12/7/18.
//  Copyright © 2018 Dzmitry Kopats. All rights reserved.
//

import UIKit

class BaseVC: UIViewController {

    @IBOutlet weak var circle1: UIView!
    @IBOutlet weak var circle2: UIView!
    @IBOutlet weak var circle3: UIView! // for animation using block
    
    let cornerRadius: CGFloat = 25
    let animator = Animator.init(cornerRadius: 25)
    var randomColor: UIColor = UIColor(red: 196/255, green: 249/255, blue: 78/255, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        animator.transformToCircle(view: circle1)
        animator.transformToCircle(view: circle2)
        animator.transformToCircle(view: circle3)
        
        circle3.isHidden = true
        circle2.backgroundColor = randomColor
        view.backgroundColor = Constants.Colors.lightGray
        
        //creating ball
        let ball = UIImageView.init(image: #imageLiteral(resourceName: "smallBall"))
        ball.frame.size = circle1.frame.size
        circle1.addSubview(ball)
        circle1.clipsToBounds = true

        let tapGR = UITapGestureRecognizer(target: self, action: #selector(AnimationVC.sampleTapGestureTapped(recognizer:)))
        view.addGestureRecognizer(tapGR)

    }
    
    func updated(tapPoint: CGPoint, using indentFromBoard: CGFloat) -> CGPoint {
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
}
