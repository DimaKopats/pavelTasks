//
//  CirclePieView.swift
//  CustomCircle
//
//  Created by Kopats, Dzmitry(AWF) on 9/22/18.
//  Copyright © 2018 Kopats, Dzmitry(AWF). All rights reserved.
//

import UIKit
import CoreGraphics

@IBDesignable class CirclePieView: UIView {
    
    //Values for each segment
    private var segmentValues : [CGFloat]
    //Total for each segment
    private var segmentTotals : [CGFloat]
    //Color for each segment
    private var segmentColors : [UIColor]
    //Sum of each segmentTotals element
    private var segmentTotalAll : CGFloat
    
    //When creating the view in code
    override init(frame: CGRect) {
        segmentValues = []
        segmentTotals = []
        segmentColors = []
        segmentTotalAll = 0
        super.init(frame: frame)
    }
    
    //When creating the view in IB
    required init?(coder aDecoder: NSCoder) {
        segmentValues = []
        segmentTotals = []
        segmentColors = []
        segmentTotalAll = 0
        super.init(coder: aDecoder)
    }
    
    //Sets all the segment members in order to draw each segment
    func setSegment(values : [Int], totals : [Int], colors : [UIColor]) {
        //Must be equal lengths
        if values.count != totals.count && totals.count != colors.count {
            return
        }
        
        //Set the colors
        segmentColors = colors
        segmentTotalAll = 0
        for total in totals {
            segmentTotalAll += CGFloat(total)
            segmentTotals.append(CGFloat(total))
        }
        for val in values {
            segmentValues.append(CGFloat(val))
        }
    }
    
    
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        //In drawRect:
        //Base circle
        UIColor.black.setFill()
        let outerPath = UIBezierPath(ovalIn: rect)
        outerPath.fill()
        
        

        //self.frame isn’t defined yet, so we can’t use self.center
        let viewCenter = CGPoint(x: rect.width/2, y: rect.height/2)
//        //Semi Circles
//        let radius = rect.width * 0.40
//        let startAngle = CGFloat(0)
//        let endAngle = CGFloat(90)
//        UIColor.green.setFill()
//        let midPath = UIBezierPath()
//        midPath.move(to: viewCenter)
//        midPath.addArc(withCenter: viewCenter, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
//        midPath.close()
//        midPath.fill()
//
        
        
        //Semicircles
        //self.frame isn't defined yet, so we can't use self.center
        var i = 0
        var lastAngle: CGFloat = 0.0
        let baseCircleRadius = rect.width / 2
        let centerCircleRadius = rect.width / 2 * 0.55
        
        //value : current number
        for value in segmentValues {
            //total : total number
            let total = segmentTotals[safe: i]!
            
            //offsetTotal : difference between Base Circle and Center Circle
            let offset =  baseCircleRadius - centerCircleRadius
            
            //radius : radius of segment
            let radius = CGFloat(value / total) * offset + centerCircleRadius
            //startAngle : start angle of this segment
            let startAngle = lastAngle
            //endAngle : end angle of this segment
            let endAngle = lastAngle + total / segmentTotalAll * 360.0
            //color : color of the segment
            let color = segmentColors[safe: i]!
            color.setFill()
            
            let midPath = UIBezierPath()
            midPath.move(to: viewCenter)
            
            midPath.addArc(withCenter: viewCenter, radius: radius, startAngle: startAngle.degreesToRadians, endAngle: endAngle.degreesToRadians, clockwise: true)
            
            midPath.close()
            midPath.fill()
            
            lastAngle = endAngle
            i = i + 1
        }
        
        //Center circle
        UIColor.white.setFill()
        let centerPath = UIBezierPath(ovalIn: rect.insetBy(dx: rect.width * 0.55 / 2, dy: rect.height * 0.55 / 2))
        
        centerPath.fill()
    }
}

extension Array {
    subscript (safe index: Int) -> Element? {
        return indices ~= index ? self[index] : nil
    }
}

extension CGFloat {
    var degreesToRadians : CGFloat {
        return CGFloat(self) * CGFloat.pi / 180.0
    }
}
