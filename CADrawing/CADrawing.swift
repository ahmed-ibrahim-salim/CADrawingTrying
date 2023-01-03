//
//  CADrawing.swift
//  CADrawing
//
//  Created by magdy khalifa on 03/01/2023.
//

import UIKit

class CADrawing{
    
    
    static func startDrawing(view: UIView){
        // vars
        var lineWidth: Double = 10.0
        var fillColor = UIColor.clear.cgColor
        var strokeColor = UIColor.green.cgColor
        
        // layer
        let layer = CAShapeLayer()
        // layer path
        layer.path = UIBezierPath(arcCenter: CGPoint(x: view.bounds.width / 2,
                                                     y: view.bounds.height / 2),
                                  radius: (Double(view.bounds.width) / 2) - lineWidth,
                                  startAngle: 0.0,
                                  endAngle: Double.pi * 2,
                                  clockwise: true).cgPath
        layer.lineCap = .round

        // layer props
        layer.strokeColor = UIColor.green.cgColor
        layer.lineWidth = lineWidth
        layer.fillColor = fillColor
        
        
        view.layer.addSublayer(layer)
        
        
        
//        let animation = CABasicAnimation(keyPath: "strokeEnd")
//        animation.fromValue = 0
//        animation.toValue = 1
//        animation.duration = 2
////        animation.autoreverses = true
////        animation.repeatCount = .infinity
//        layer.add(animation, forKey: "line")
    }
}
