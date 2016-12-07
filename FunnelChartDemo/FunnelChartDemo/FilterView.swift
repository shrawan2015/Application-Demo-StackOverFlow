//
//  FilterView.swift
//  FunnelChartDemo
//
//  Created by ShrawanKumar Sharma on 07/12/16.
//  Copyright © 2016 com.demoapp. All rights reserved.
//

import Foundation
import UIKit



class FilterView:UIView {
    
    var x1:Int?
    var y1:Int?

    var radius1:Int?
    var radius2:Int?
    var radius3:Int?
    var height1:Int?
    var height2:Int?
    var gap1:Int?
    var expand:Int?
   
    var height:[Float]  = [33, 44, 55, 66, 666]
    
    
    
    
     //rectange points
     var initialX:Int?
     var  initialY:Float?
    
      override init(frame: CGRect){
        super.init(frame: frame)
        x1 = 20;  y1 = 20; radius1 = 200;  radius2 = 20;  height1 = 20;  gap1 = 30
        height2 = 30 ; gap1 = 20 ; expand = 10 ; radius3 = 20
    
        heightConverstion()
       // height = [20,44,55,66]
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
       
        super.draw(rect)
        
        self.backgroundColor = UIColor.brown
        
        UIColor.white.setStroke()
        UIColor.red.setFill()
        let currentContext = UIGraphicsGetCurrentContext()
       
        currentContext?.saveGState() //if you want to draw after the shape then use save context
        
        let path = drawTopViewOfTunnel()
        path.lineWidth = 2
        path.fill()
        path.stroke()
        
        
        let middlepath = drawMiddleViewOfTunnel()
        middlepath.lineWidth = 2.0
        middlepath.fill()
        middlepath.stroke()
        path.append(middlepath)
       
        let lowPath = drawLowViewOfTunnel(index: 0)
        lowPath.lineWidth = 2.0
        lowPath.fill()
        lowPath.stroke()
        path.append(lowPath)
        
        
        
        let lowPath2 = drawLowViewOfTunnel(index: 1)
        lowPath2.lineWidth = 2.0
        lowPath2.fill()
        lowPath2.stroke()
        path.append(lowPath2)
        
        
        
        
       // for height in
        
        
        currentContext?.restoreGState()
        
        
    }
    
    func drawTopLabel() -> UIBezierPath {
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 50, y: 50) )
        path.addLine(to: CGPoint(x: 100, y: 50) )
        path.addLine(to: CGPoint(x: 100 - 4, y: 50 + 30) )
        path.addLine(to: CGPoint(x: 50 + 4 , y: 50 +  30) )
        path.close()
        return path
        
    }
    
    func middleLabel()  -> UIBezierPath {
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 50 + 4, y: 50 + 30 + 2 ) )
        path.addLine(to: CGPoint(x: 100 - 4 , y: 50 + 30 + 2 ) )
        path.addLine(to: CGPoint(x: 100 - 4 - 4, y: 50 + 30 + 2 + 10) )
        path.addLine(to: CGPoint( x: 100 - 4 - 4 , y: 50 + 30 + 2 + 10  + 20 ) )
        path.addLine(to: CGPoint( x: 54+8 , y: 50 + 30 + 2 + 10  + 20 ) )
        path.addLine(to: CGPoint( x: 54+8 , y: 90 ) )
        
        
        path.close()
        return path
        
    }
    
    func bottomLabel() {
        
        let path = UIBezierPath()
        
        path.move(to: CGPoint(x: 50 + 4, y: 50 + 30 + 2 ) )
    }
    
    
    func drawTopViewOfTunnel () ->UIBezierPath {
        let path = UIBezierPath()
        if let x1 = x1 , let y1 =  y1 , let radius1 = radius1 , let height1 = height1 , let gap1 = gap1{
        path.move(to: CGPoint(x: x1, y: y1)  )
        path.addLine(to: CGPoint(x: x1 + radius1, y: y1 ) )
        path.addLine(to: CGPoint(x: x1 + radius1 - gap1 , y: y1 + height1) )
        path.addLine(to: CGPoint(x: x1 + gap1  , y: y1 + height1) )
        path.close()
       
    }
         return path
 }
    
    func drawMiddleViewOfTunnel () -> UIBezierPath {
        let path = UIBezierPath()
        if let x1 = x1 , let y1 =  y1 , let radius1 = radius1 , let height1 = height1 , let gap1 = gap1 , let expand = expand  , let height2 = height2 {
            path.move(to: CGPoint(x: x1 + gap1 , y: y1 + height1 + expand )  )
            path.addLine(to: CGPoint(x: x1 + radius1 - gap1 , y: y1 + height1 + expand ) )
            path.addLine(to: CGPoint(x: x1 + radius1 - gap1 - gap1 , y: y1 + height1 + expand + height2 ) )
            
             path.addLine(to: CGPoint(x: x1 + radius1 - gap1 - gap1 , y: y1 + height1 + expand + height2 + 30  ) )
             path.addLine(to: CGPoint(x: x1 + gap1 + gap1 , y: y1 + height1 + expand + height2 + 30 ) )
            initialX =  x1 + gap1 + gap1
            initialY =  Float(y1 + height1 + expand + height2 + 30)
            radius2  = x1 + radius1 - gap1 - gap1 - ( x1 + gap1 + gap1 )
            path.addLine(to: CGPoint(x: x1 + gap1 + gap1  , y: y1 + height1 + expand + height2  ) )
            path.close()
            
        }
        return path
    }
    
    
    func drawLowViewOfTunnel (index:Int) -> UIBezierPath {

        if(index == 0) {
            initialY = initialY! + Float(expand!)
        }
        else{
            // initialY =  Float((initialY! + Float(expand!) + ( height[index - 1]  ))! )
            
            if var initialY = initialY , let expand = expand {
                
                initialY = initialY + Float(expand) + height[index - 1]
                
            }
            
         //   initialY = initialY! +  Float(expand!) + height[index - 1]
            
            
            
            
            
            
        }
        
        let rect = CGRect(origin: CGPoint(x: initialX! ,y : Int(initialY!) ), size: CGSize(width: radius2!, height: Int(height[ index ] ) ))
        
        let path = UIBezierPath(roundedRect:rect   , cornerRadius: 0)
        return path

    }
    
    
    func heightConverstion() {
      height =    HeightDistribution.height(percentages: [50,40,30], TotalHeight: 500) as! [Float]
    
    
    }
    
   
    
}
