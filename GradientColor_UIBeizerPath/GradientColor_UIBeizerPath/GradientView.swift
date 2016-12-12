//
//  GradientView.swift
//  GradientColor_UIBeizerPath
//
//  Created by ShrawanKumar Sharma on 09/12/16.
//  Copyright © 2016 com. GradientColor. All rights reserved.
//

import Foundation
import UIKit

class  GradientView:UIView {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //drawCircle()
    }
    
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
       // let currentContext = UIGraphicsGetCurrentContext()
        //currentContext?.saveGState()
        
        let path = drawCircle(radius: 100)
        UIColor.black.setStroke()
        //UIColor.red.setFill()
        path.lineWidth = 15
        path.stroke()
        
        
        
        
        let path2 = drawCircle(radius: 50)
        UIColor.blue.setStroke()
        UIColor.green.setFill()
        path2.lineWidth = 5
        path2.stroke()
        
        
        let dynamicPath2 = drawTimeCircle(radius: 50, startAngle: 75, endAngle: 270)
//        UIColor.gray.setStroke()
//        UIColor.green.setFill()
//        dynamicPath2.lineWidth = 8
//        dynamicPath2.stroke()

        
        let startingColorOfGradient = UIColor(colorLiteralRed: 50/255, green: 189/255, blue: 170/255, alpha: 1.0).cgColor
         let startingColorOfGradient2 = UIColor(colorLiteralRed: 50/255, green: 189/255, blue: 170/255, alpha: 1.0).cgColor
        let endingColorOFGradient = UIColor(colorLiteralRed: 133/255, green: 210/255, blue: 230/255, alpha: 1.0).cgColor
        let endingColorOFGradient2 = UIColor(colorLiteralRed: 133/255, green: 210/255, blue: 230/255, alpha: 1.0).cgColor
        
        
        
        //2 - get the current context
        let context = UIGraphicsGetCurrentContext()
        let colors = [startingColorOfGradient,UIColor.white.cgColor ]
        
        //3 - set up the color space
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        
        //4 - set up the color stops
        let colorLocations:[CGFloat] = [0.0, 0.8]
        
        //5 - create the gradient
        let gradient = CGGradient(colorsSpace: colorSpace,
                                  colors: colors as CFArray,
                                  locations: colorLocations)
//        
//        
//        
//        
//        let startPoint = CGPoint(x:0, y: 0)
//        let  endPoint = CGPoint(x:180, y:180)
        
      
        
        //context!.drawLinearGradient(gradient!, start: startPoint, end: endPoint, options: CGGradientDrawingOptions(rawValue: 0))
        
//        context?.drawRadialGradient(gradient!, startCenter: CGPoint(x:bounds.size.width/2 ,y:bounds.size.height/2) , startRadius: 25, endCenter:CGPoint(x:bounds.size.width/2 ,y:bounds.size.height/2) , endRadius: 30, options: CGGradientDrawingOptions(rawValue: 0))
//        
        
        
        
        
        
        
        // public func drawRadialGradient(_ gradient: CGGradient, startCenter: CGPoint, startRadius: CGFloat, endCenter: CGPoint, endRadius: CGFloat, options: CGGradientDrawingOptions)
        

//        path.append(path2)
        
       // currentContext?.restoreGState()
        //let currentState = uigraphicsget
        
        
        let context2 = UIGraphicsGetCurrentContext()
        let strokeWidth:CGFloat = 10
        let strokeOffset:CGFloat = strokeWidth / 2
        
//        let pathRect = CGRect(
//            x: strokeOffset,
//            y: strokeOffset,
//            width: rect.width  - CGFloat(strokeWidth),
//            height: rect.height - CGFloat(strokeWidth)
//        )
        
        
        let pathRect = CGRect(
            x: bounds.size.width/2,
            y: bounds.size.height/2,
            width: 200,
            height: 200
        )
        
        
        let mainpath = UIBezierPath(ovalIn: pathRect)
//        mainpath =  UIBezierPath(arcCenter: pathRect, radius: 25, startAngle: 100, endAngle: 180, clockwise: true)
        
       
//        let strokedPath = CGPathCreateCopyByStrokingPath(mainpath.cgPath, NULL, strokeWidth, .Butt, .Miter, 0)
        
        
        
//      
//        
//        let strokePath = mainpath.cgPath.copy(strokingWithWidth: strokeWidth, lineCap: .butt, lineJoin: .miter, miterLimit: 0)
//        
//        context!.addPath(strokePath )
//    
//        
//        context?.clip()
//        
//        
//        
//        let gradient2 = CGGradient(colorsSpace: colorSpace,
//                                  colors: colors as CFArray,
//                                  locations: colorLocations)
//        
//        
////        let gradient = CGGradientCreateWithColors(
////            CGColorSpaceCreateDeviceRGB(),
////            [ UIColor.whiteColor().CGColor, UIColor.blackColor().CGColor],
////            [0, 1]
////        )
//        context2!.drawLinearGradient(
//            gradient2!,
//            start: CGPoint(x: 0, y: 0),
//            end: CGPoint(x: rect.width, y: rect.height),
//            options: []
//        )
//        
//        
        
        
        
        /////update above gradient path 
        
        
        
        let strokePath22 = path.cgPath.copy(strokingWithWidth: strokeWidth, lineCap: .butt, lineJoin: .miter, miterLimit: 0)
        
        context!.addPath(strokePath22 )
        
        
        context?.clip()
        
        
        
        let gradient22 = CGGradient(colorsSpace: colorSpace,
                                   colors: colors as CFArray,
                                   locations: colorLocations)
        
        
        //        let gradient = CGGradientCreateWithColors(
        //            CGColorSpaceCreateDeviceRGB(),
        //            [ UIColor.whiteColor().CGColor, UIColor.blackColor().CGColor],
        //            [0, 1]
        //        )
        context2!.drawLinearGradient(
            gradient!,
            start: CGPoint(x: 0, y: 0),
            end: CGPoint(x: rect.width, y: rect.height),
            options: []
        )
        
        

        
    }
    
    
    required init?(coder aDecoder: NSCoder) {

        super.init(coder: aDecoder)
        //fatalError("init(coder:) has not been implemented")

    }
    
    func drawCircle(radius:CGFloat) -> UIBezierPath {
        let circlePath:UIBezierPath =  UIBezierPath(arcCenter: CGPoint(x:bounds.size.width/2 ,y:bounds.size.height/2), radius: radius, startAngle: 0, endAngle: 180, clockwise: true)
        return circlePath
    }
    
    
    
    func drawTimeCircle(radius:CGFloat , startAngle:CGFloat , endAngle:CGFloat) -> UIBezierPath {
        let circlePath:UIBezierPath =  UIBezierPath(arcCenter: CGPoint(x:bounds.size.width/2 ,y:bounds.size.height/2), radius: radius, startAngle: startAngle.degreesToRadian, endAngle: endAngle.degreesToRadian , clockwise: true)
        
        
        return circlePath
    }
    
}

extension Int {
    var degreesToRadian: Double { return Double(self) * .pi / 180 }
    var radiansToDegree: Double { return Double(self) * 180 / .pi }
}

extension FloatingPoint {
    var degreesToRadian: Self { return self * .pi / 180 }
    var radiansToDegree: Self { return self * 180 / .pi }
}
