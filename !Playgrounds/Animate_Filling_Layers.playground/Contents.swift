//: A UIKit based Playground for presenting user interface

// fill screen using layers

import UIKit
import PlaygroundSupport

fileprivate enum Constants {
    static let animationDuration: Double = 0.25
    static let animationDelay: Double = 0.2
    
    enum Colors {
        static let start = #colorLiteral(red: 1, green: 0.8588235294, blue: 0.05098039216, alpha: 1)
        static let middle = #colorLiteral(red: 0.2588235294, green: 0.5843137255, blue: 1, alpha: 1)
        static let final = #colorLiteral(red: 0.33, green: 0.25, blue: 0.68, alpha: 1.0)
    }
}

class MyViewController : UIViewController {
    
    var yellowLayer: CALayer!
    var blueLayer: CALayer!
    var purpleLayer: CALayer!
    
    override func loadView() {
        
        let view = UIView()
        view.backgroundColor = .gray
        
        let yellow_Layer = CALayer()
        let blue_Layer = CALayer()
        let purple_Layer = CALayer()
        
        yellow_Layer.backgroundColor = Constants.Colors.start.cgColor
        blue_Layer.backgroundColor = Constants.Colors.middle.cgColor
        purple_Layer.backgroundColor = Constants.Colors.final.cgColor
        
        self.yellowLayer = yellow_Layer
        self.blueLayer = blue_Layer
        self.purpleLayer = purple_Layer
        
        self.view.layer.addSublayer(yellowLayer)
        self.view.layer.addSublayer(blueLayer)
        self.view.layer.addSublayer(purpleLayer)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animate()
    }
    
    func animate() {
        let animationYellowLayer = animationWith(delay: 0)
        self.yellowLayer?.add(animationYellowLayer, forKey: "yellow")
        
        let animationBlueLayer = animationWith(delay: Constants.animationDelay)
        self.blueLayer?.add(animationBlueLayer, forKey: "blue")
        
        let animationPurpleLayer = animationWith(delay: Constants.animationDelay * 2)
        self.purpleLayer?.add(animationPurpleLayer, forKey: "purple")
    }
    
    func animationWith(delay: CFTimeInterval) -> CABasicAnimation {
        let screenWidth = UIScreen.main.bounds.size.width
        let screenHeight = UIScreen.main.bounds.size.height
        
        let animationLayer = CABasicAnimation(keyPath: "bounds.size")
        animationLayer.fromValue = NSValue(cgSize: CGSize(width: 0, height: screenHeight/2))
        animationLayer.toValue = NSValue(cgSize: CGSize(width: screenWidth, height: screenHeight/2))
        animationLayer.duration = Constants.animationDuration
        animationLayer.beginTime = CACurrentMediaTime() + delay
        animationLayer.isRemovedOnCompletion = false
        animationLayer.fillMode = kCAFillModeForwards
        return animationLayer
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
