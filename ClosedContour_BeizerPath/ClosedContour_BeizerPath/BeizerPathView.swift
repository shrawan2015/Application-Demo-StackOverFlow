//
//  BeizerPathView.swift
//  ClosedContour_BeizerPath
//
//  Created by ShrawanKumar Sharma on 08/12/16.
//  Copyright © 2016 com. ClosedContour. All rights reserved.
//

import Foundation
import UIKit

class BeizerPathView :UIView {
    

    override init(frame: CGRect){
        super.init(frame: frame)
        
    
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
        
        let closePath = drawClosedPath()
        closePath.lineWidth = 2
        closePath.fill()
        closePath.stroke()
        
        
        let openPath = drawOpenPath()
        openPath.lineWidth = 2
        openPath.fill()
        openPath.stroke()
        
        currentContext?.restoreGState()
        
        
       // toCheckClosePath(pathRef: openPath.cgPath )
        
        
        
        var segments: [CGPoint] = []
        
//        for i in 0 ..< openPath.cgPath.count - 1 {
//            segments += [points[i]]
//            segments += [points[i + 1]]
//        }
        
        // Strokes points 0->1 2->3 4->5
      //  CGContextStrokeLineSegments (currentContext, segments, segments.count)
        
        
        
        
        
        
        
        ///
        
        
        let path: CGPath =  openPath.cgPath
            // or let path: CGMutablePath
        
        
        let status = openPath.firstPoint()
        print(status)
        let status222 = closePath.firstPoint()
        print(status222)
        
            path.apply(info: nil) { (_, elementPointer) in
                let element = elementPointer.pointee
                let command: String
                let pointCount: Int
                switch element.type {
                case .moveToPoint: command = "moveTo"; pointCount = 1
                case .addLineToPoint: command = "lineTo"; pointCount = 1
                case .addQuadCurveToPoint: command = "quadCurveTo"; pointCount = 2
                case .addCurveToPoint: command = "curveTo"; pointCount = 3
                case .closeSubpath: command = "close"; pointCount = 0
                }
                let points = Array(UnsafeBufferPointer(start: element.points, count: pointCount))
                Swift.print("\(command) \(points)")
        }
        
        
        
        
        let path2: CGPath =  closePath.cgPath
        // or let path: CGMutablePath
        
        
        
        
        path2.apply(info: nil) { (_, elementPointer) in
            let element = elementPointer.pointee
            let command: String
            let pointCount: Int
            switch element.type {
            case .moveToPoint: command = "moveTo"; pointCount = 1
            case .addLineToPoint: command = "lineTo"; pointCount = 1
            case .addQuadCurveToPoint: command = "quadCurveTo"; pointCount = 2
            case .addCurveToPoint: command = "curveTo"; pointCount = 3
            case .closeSubpath: command = "close"; pointCount = 0
            }
            let points = Array(UnsafeBufferPointer(start: element.points, count: pointCount))
            Swift.print("\(command) \(points)")
        }

        
        var status22 = closeContourStatus(path: closePath.cgPath)
        print(status22)
        
        
        
      
        
        
        
    }
    
    
    func drawClosedPath() -> UIBezierPath {
        
        let path = UIBezierPath()
        path.addArc(withCenter: CGPoint(x:120,y:120), radius: 50, startAngle: CGFloat(0.degreesToRadians), endAngle: CGFloat(90.degreesToRadians) , clockwise: true)
        path.addArc(withCenter: CGPoint(x:120,y:120), radius: 50, startAngle: CGFloat(90.degreesToRadians), endAngle: CGFloat(180.degreesToRadians), clockwise: true)
        path.addLine(to: CGPoint(x:170,y:120))
        
//        mainPath addLineToPoint:CGPointMake(170, 120
        
        path.close()
        
        return path
        
        
    }

    
    func drawOpenPath() -> UIBezierPath {
        
        let path = UIBezierPath()
        path.addArc(withCenter: CGPoint(x:200,y:200), radius: 50, startAngle: CGFloat(0.degreesToRadians), endAngle: CGFloat(90.degreesToRadians) , clockwise: true)
        path.addArc(withCenter: CGPoint(x:200,y:200), radius: 50, startAngle: CGFloat(90.degreesToRadians), endAngle: CGFloat(180.degreesToRadians), clockwise: true)
        
        
        return path
        
        
    }
    
//    func toCheckClosePath(pathRef:CGPath) {
//        
//        var i:Int
//        var numberOfElements:Int
//        
//        var muttablePath:CGPath
//         let boudingPath =  pathRef.boundingBox
//        print(boudingPath)
//        print(pathRef.boundingBoxOfPath)
//        print((pathRef.currentPoint))
//        let pathElement = pathRef
//        
//        //let pathss = CGContextStrokeLineSegments(pathRef)
//       // print(pathss)
//    }
//    
    
    
    
    func closeContourStatus (path:CGPath)  {
        
        var status:Bool = false
        //withUnsafeMutablePointer(&status)
        
        
        path.apply(info: nil) { (_, elementPointer) in
            let element = elementPointer.pointee
          //  var status: UnsafePointer<Bool>
            
           // var status:Bool = false
            let buffer: UnsafePointer<Int8>? = nil
            
            switch element.type {
                
            case .closeSubpath :
             // status = mem
                break
            default: break
                
                
            }
          //  return buffer
            
          //  let points = Array(UnsafeBufferPointer(start: element.points, count: pointCount))
           // let points = Bool(UnsafeBufferPointer<status>)
            
           // withUnsafePointer(&status)
            //Swift.print("\(command) \(points)")
           // print(points)
            //return Bool(validatingUTF8: buffer!)
        }
//return true
       // return buffer

    }
    
    
    
}

extension Int {
    var degreesToRadians: Double { return Double(self) * .pi / 180 }
    var radiansToDegrees: Double { return Double(self) * 180 / .pi }
}
extension FloatingPoint {
    var degreesToRadians: Self { return self * .pi / 180 }
    var radiansToDegrees: Self { return self * 180 / .pi }
}


extension CGPath {
    func forEach( body: @convention(block) (CGPathElement) -> Void) {
        typealias Body = @convention(block) (CGPathElement) -> Void
        func callback(info: UnsafeMutableRawPointer?, element: UnsafePointer<CGPathElement>) {
            let body = unsafeBitCast(info, to: Body.self)
            body(element.pointee)
        }
        let unsafeBody = unsafeBitCast(body, to: UnsafeMutableRawPointer.self)
        apply(info: unsafeBody, function: callback)
    }
}


extension UIBezierPath {
    func firstPoint() -> Bool {
        var firstPoint: Bool = false
        
        cgPath.forEach { element in
            // Just want the first one, but we have to look at everything.
            //guard firstPoint == nil else { return }
            //assert(element.type == .closeSubpath, "Expected the first point to be a move")
            
            if(element.type == .closeSubpath){
                firstPoint = true

            }
        }
        return firstPoint
    }
}
