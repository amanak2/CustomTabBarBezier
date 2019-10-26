//
//  CustomTabBar.swift
//  CustomTabBarBezier
//
//  Created by Aman Chawla on 26/10/19.
//  Copyright © 2019 Aman Chawla. All rights reserved.
//

import UIKit

class CustomTabBar: UITabBar {
    
    private var shapeLayer: CALayer?
    
    override func draw(_ rect: CGRect) {
        self.addShape()
    }
    
    private func addShape() {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = createPath2()
        shapeLayer.strokeColor = UIColor.lightGray.cgColor
        shapeLayer.fillColor = UIColor.white.cgColor
        shapeLayer.lineWidth = 1.0
        
        if let oldShapeLayer = self.shapeLayer {
            self.layer.replaceSublayer(oldShapeLayer, with: shapeLayer)
        } else {
            self.layer.insertSublayer(shapeLayer, at: 0)
        }
    }
    
    private func createPath() -> CGPath {
        
        let height: CGFloat = 37
        let path = UIBezierPath()
        let centerWidth = self.frame.width / 2
        
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: (centerWidth - height*2), y: 0))
        
        //first curve
        path.addCurve(to: CGPoint(x: centerWidth, y: -height),
                      controlPoint1: CGPoint(x: (centerWidth - 30), y: 0),
                      controlPoint2: CGPoint(x: (centerWidth - 35), y: -height))
        
        //second curve
        path.addCurve(to: CGPoint(x: (centerWidth + height*2), y: 0),
                      controlPoint1: CGPoint(x: (centerWidth + 35), y: -height),
                      controlPoint2: CGPoint(x: (centerWidth + 30), y: 0))
        
        
        path.addLine(to: CGPoint(x: self.frame.width, y: 0))
        path.addLine(to: CGPoint(x: self.frame.width, y: self.frame.height))
        path.addLine(to: CGPoint(x: 0, y: self.frame.height))
        path.close()
        
        return path.cgPath
    }
    
    private func createPath2() -> CGPath {
        
        let radius: CGFloat = 35
        let smallRadius: CGFloat = 5
        let height: CGFloat = (radius + smallRadius)
        
        let path = UIBezierPath()
        let centerWidth = self.frame.width/2
        
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: (centerWidth - height), y: 0))
        
        //first small curve
        path.addCurve(to: CGPoint(x: (centerWidth - radius), y: -smallRadius),
                      controlPoint1: CGPoint(x: (centerWidth - radius), y: 0),
                      controlPoint2: CGPoint(x: (centerWidth - radius), y: -smallRadius))
        
        //half first oval
        path.addCurve(to: CGPoint(x: centerWidth, y: -height),
                      controlPoint1: CGPoint(x: (centerWidth - radius), y: -smallRadius),
                      controlPoint2: CGPoint(x: (centerWidth - radius), y: -height))
        
        //half second oval
        path.addCurve(to: CGPoint(x: (centerWidth + radius), y: -smallRadius),
                      controlPoint1: CGPoint(x: centerWidth, y: -height),
                      controlPoint2: CGPoint(x: (centerWidth + radius), y: -height))
        
        //second small curve
        path.addCurve(to: CGPoint(x: (centerWidth + height), y: 0),
                      controlPoint1: CGPoint(x: (centerWidth + radius), y: 0),
                      controlPoint2: CGPoint(x: (centerWidth + height), y: 0))
        
        path.addLine(to: CGPoint(x: self.frame.width, y: 0))
        path.addLine(to: CGPoint(x: self.frame.width, y: self.frame.height))
        path.addLine(to: CGPoint(x: 0, y: self.frame.height))
        path.close()
        
        return path.cgPath
    }
}
