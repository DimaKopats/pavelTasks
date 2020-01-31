//
//  ViewController.swift
//  TestAwakeFromNib
//
//  Created by Dzmitry Kopats on 10/11/19.
//  Copyright © 2019 Dzmitry Kopats. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        button = UIButton(type: .roundedRect)
        button.frame = CGRect(x: 100, y: 100, width: 200, height: 50)
        button.backgroundColor = .magenta
        button.setTitle("Open VC", for: .normal)
        button.addTarget(self, action: #selector(self.tapButton(_:)), for: .touchUpInside)

        view.addSubview(button)
        
    }
    

    
    @objc func tapButton(_ sender: UIButton) {
        print("tap")
        
//        let view: PVinAppInterstitialHtml = UIView.fromNib()
//        view.animate(type: .appearFromBottom) {
//            view.bgView.animate(type: .alpha(0.6))
//        }
            
            
//        self.navigationController?.pushViewController(PVinAppBannerHtml1(), animated: true)

    }

}

public extension UIView {
    func animate(type: PVAnimationType, completed: (() -> (Void))? = nil) {
        switch type {
        case .appearFromBottom:
            transform = CGAffineTransform(translationX: 0, y: UIScreen.main.bounds.size.height / 3)
            UIView.animate(withDuration: PVAnimationDuration.slow.rawValue, delay: PVAnimationDuration.none.rawValue, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.3, options: .curveEaseIn, animations: {
                self.transform = .identity
            }, completion: { _ in
                completed?()
            })
        case .scaleFromSmall:
            transform = CGAffineTransform(scaleX: 0.25, y: 0.25)
            UIView.animate(withDuration: PVAnimationDuration.fast.rawValue, delay: PVAnimationDuration.none.rawValue, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.6, options: .curveEaseIn, animations: {
                self.transform = .identity
            }, completion: { _ in
                completed?()
            })
        case .alpha(let alphaValue):
            alpha = 0
            UIView.animate(withDuration: PVAnimationDuration.fast.rawValue, delay: PVAnimationDuration.none.rawValue, options: .curveEaseOut, animations: {
                self.alpha = alphaValue
            }, completion: { _ in
                completed?()
            })
        }
        
    }
    
}

public enum PVAnimationType {
    case appearFromBottom
    case scaleFromSmall
    case alpha(CGFloat)
}

public enum PVAnimationDuration: TimeInterval {
    case none = 0
    case fast = 0.5
    case slow = 1
    case verySlow = 3
}

public var isIpad: Bool {
    return UIScreen.main.traitCollection.userInterfaceIdiom == .pad
}

extension UIView {
    class func fromNib<T: UIView>() -> T {
        return Bundle(for: T.self).loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
}

