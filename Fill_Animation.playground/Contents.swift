
// fill screen using views


////: A UIKit based Playground for presenting user interface
//
//import UIKit
//import PlaygroundSupport
//
//class MyViewController : UIViewController {
//
//    var firstView: UIView?
//    var secondView: UIView?
//
//    override func loadView() {
//
//        let view = UIView()
//        view.backgroundColor = .gray
//
//        let label = UILabel()
//        label.frame = CGRect(x: 150, y: 200, width: 200, height: 20)
//        label.text = "Hello World!"
//        label.textColor = .black
//
//        view.addSubview(label)
//        self.view = view
//    }
//
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//
//        var rect = self.view.frame
//        rect.size.width = 0
//
//        let first = UIView(frame: rect)
//        first.backgroundColor = .magenta
//
//        let second = UIView(frame: rect)
//        second.backgroundColor = .yellow
//
//        firstView = first
//        secondView = second
//
//        if let firstView = firstView, let secondView = secondView {
//            print("add two views")
//            self.view.addSubview(firstView)
//            self.view.addSubview(secondView)
//        }
//        animate()
//    }
//
//    func animate() {
//        let screenWidth = UIScreen.main.bounds.size.width
//        self.view.frame.size.width = 0
//        UIView.animate(withDuration: 3) {
//            self.view.backgroundColor = .green
//            self.view.frame.size.width = screenWidth
//        }
//        UIView.animate(withDuration: 3, delay: 1, options: [], animations: {
//            self.firstView?.frame.size.width = screenWidth
//        })
//        UIView.animate(withDuration: 3, delay: 2, options: [], animations: {
//            self.secondView?.frame.size.width = screenWidth
//        })
//    }
//}
//// Present the view controller in the Live View window
//PlaygroundPage.current.liveView = MyViewController()

//: A UIKit based Playground for presenting user interface

// fill screen using layers

import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    
    var yellowLayer: CALayer?
    
    override func loadView() {
        
        let view = UIView()
        view.backgroundColor = .gray
        
        let label = UILabel()
        label.frame = CGRect(x: 150, y: 200, width: 200, height: 20)
        label.text = "Hello World!"
        label.textColor = .black
        
        view.addSubview(label)
        self.view = view
        
        print(UIScreen.main.bounds)
        
        var rect = UIScreen.main.bounds
        rect.size.width = 0
        
        let yellow_Layer = CALayer()
        yellow_Layer.backgroundColor = UIColor.yellow.cgColor
        
        self.yellowLayer = yellow_Layer
        
        if let yellowLayer = yellowLayer {
            print("add yellow layer")
            self.view.layer.addSublayer(yellowLayer)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animate()
    }
    
    func animate() {
        let screenWidth = UIScreen.main.bounds.size.width
        let screenHeight = UIScreen.main.bounds.size.height
//        self.view.frame.size.width = 0
        self.yellowLayer?.frame.size.width = 100
        self.yellowLayer?.frame.size.height = screenHeight/3
        
        print("before")
        print("layerFrame = \(yellowLayer!.frame)")
        
//        UIView.animate(withDuration: 3) {
//            self.view.backgroundColor = .green
//            self.view.frame.size.width = screenWidth
//        }
        
        
//        self.yellowLayer?.frame.size.width = screenWidth
        
        let animationYellowLayer = CABasicAnimation(keyPath: "bounds.size")
        animationYellowLayer.toValue = NSValue(cgSize: CGSize(width: screenWidth, height: screenHeight/3))
        animationYellowLayer.duration = 3
        animationYellowLayer.isRemovedOnCompletion = false
        self.yellowLayer?.add(animationYellowLayer, forKey: "yellow")
        // need to dont remove animation in the end
        
        
        print("after")
        print("layerFrame = \(yellowLayer!.frame)")
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()

