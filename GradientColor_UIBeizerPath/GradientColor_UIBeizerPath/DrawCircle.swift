//
//  DrawCircle.swift
//  GradientColor_UIBeizerPath
//
//  Created by ShrawanKumar Sharma on 21/09/1938 Saka.
//  Copyright © 1938 Saka com. GradientColor. All rights reserved.
//

import Foundation
import UIKit

class  DrawCircle:UIView {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //drawCircle()
}
    
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        //fatalError("init(coder:) has not been implemented")
        
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        drawTimeCircle(radius: 50, startAngle: 90, endAngle: 270, color:UIColor.red)
        
    }
    
    
    
    func drawTimeCircle(radius:CGFloat , startAngle:CGFloat , endAngle:CGFloat, color:UIColor )
    {
    //-> UIBezierPath {
        
        let circlePath:UIBezierPath =  UIBezierPath(arcCenter: CGPoint(x:bounds.size.width/2 ,y:bounds.size.height/2), radius: radius, startAngle: startAngle.degreesToRadian, endAngle: endAngle.degreesToRadian , clockwise: true)
         circlePath.lineWidth = 2
        color.setStroke()
        color.setStroke()

         circlePath.stroke()
        // return circlePath
    }
    
}
