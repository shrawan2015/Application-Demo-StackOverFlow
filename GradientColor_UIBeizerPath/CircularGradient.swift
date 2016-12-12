    //  GradientView.swift
    //  GradientColor_UIBeizerPath
    
    import Foundation
    import UIKit
    
    class  CircularGradient:UIView {
        
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            
            //drawCircle()
        }
        
        
        override func draw(_ rect: CGRect) {
            super.draw(rect)
            
            let path = drawCircle(radius: 100)
            UIColor.black.setStroke()
            //UIColor.red.setFill()
          //  path.lineWidth = 15
            //path.stroke()
            
            let path2 = drawCircle(radius: 50)
            UIColor.black.setStroke()
            UIColor.green.setFill()
            path2.lineWidth = 5
            path2.stroke()

            let context = UIGraphicsGetCurrentContext()
            context?.saveGState()
            
            let dynamicPath2: UIBezierPath = drawTimeCircle(radius: 50, startAngle: 75, endAngle: 270)
            
                    ///UIColor.red.setStroke()
                   // UIColor.green.setFill()
                    dynamicPath2.lineWidth = 8
                    dynamicPath2.stroke()

            
            
            //2 - get the current context
            let colors = [UIColor.black.cgColor,UIColor.white.cgColor , UIColor.red.cgColor ]
            
            //3 - set up the color space
            let colorSpace = CGColorSpaceCreateDeviceRGB()
            
            //4 - set up the color stops
            let colorLocations:[CGFloat] = [0.0, 0.2 , 0.8 , 1.0]
            
            //5 - create the gradient
            let gradient = CGGradient(colorsSpace: colorSpace,
                                      colors: colors as CFArray,
                                      locations: colorLocations)
            
            let strokeWidth:CGFloat = 20
           // let strokeOffset:CGFloat = strokeWidth / 2
            
            
//            let pathRect = CGRect(
//                x: bounds.size.width/2,
//                y: bounds.size.height/2,
//                width: 200,
//                height: 200
//            )
//            
//            let mainpath = UIBezierPath(ovalIn: pathRect)
            
          
            
            
            
            let strokePath22 = path.cgPath.copy(strokingWithWidth: strokeWidth, lineCap: .butt, lineJoin: .miter, miterLimit: 0)
            context!.addPath(strokePath22 )
            context?.clip()

            
            
//            
//            let gradient22 = CGGradient(colorsSpace: colorSpace,
//                                        colors: colors as CFArray,
//                                        locations: colorLocations)
//            
            
            
            context?.drawLinearGradient(
                gradient!,
                start: CGPoint(x: 0, y: 0),
                end: CGPoint(x: rect.width, y: rect.height),
                options: []
            )
            

            //dynamicPath2.close()

        // context?.saveGState()
            
            
            //new path 2
            
            let color2 = [UIColor.red.cgColor,UIColor.black.cgColor, UIColor.green.cgColor ]
            
            //3 - set up the color space
            let colorSpace2 = CGColorSpaceCreateDeviceRGB()
            
            //4 - set up the color stops
            let colorLocations2:[CGFloat] = [0.0, 0.2, 0.8 ,1.0 ]
            
            //5 - create the gradient
            let gradient2 = CGGradient(colorsSpace: colorSpace2,
                                      colors: color2 as CFArray,
                                      locations: colorLocations2)

            
            
            
          //  let strokePathSecond = dynamicPath2.cgPath.copy(strokingWithWidth: 200, lineCap: .butt, lineJoin: .miter, miterLimit: 0)
            context?.addPath(dynamicPath2.cgPath)
            
            
            context?.replacePathWithStrokedPath()
         dynamicPath2.stroke()
            context?.clip()
           
            context?.drawLinearGradient(
                gradient2!,
                start: CGPoint(x: 0, y: 0),
                end: CGPoint(x: rect.width, y: rect.height),
                options: []
            )
            
          //  context?.saveGState()
          //  context?.restoreGState()
context?.restoreGState()

            
            
            
            
//            
//            ////for next context
//            
//            let context3 = UIGraphicsGetCurrentContext()
//            
//            let strokePath33 = mainpath.cgPath.copy(strokingWithWidth: strokeWidth, lineCap: .butt, lineJoin: .miter, miterLimit: 0)
//            
//            context2!.addPath(strokePath33 )
//            
//            
//            context2?.clip()
//            
//            
//            
//            
//            
//            
//            context2!.drawLinearGradient(
//                gradient!,
//                start: CGPoint(x: 0, y: 0),
//                end: CGPoint(x: rect.width, y: rect.height),
//                options: []
//            )
//
//            context2?.restoreGState()
            
            
            
            
//            ///
//            
//            CGContextSaveGState(theCGContext);
//            CGPoint center = CGPointMake(x + width / 2.0, y + height / 2.0);
//            UIBezierPath* clip = [UIBezierPath bezierPathWithArcCenter:center
//                radius:max(width, height)
//                startAngle:startAngle
//                endAngle:endAngle
//                clockwise:YES];
//            [clip addLineToPoint:center];
//            [clip closePath];
//            [clip addClip];
//            
//            UIBezierPath *arc = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(x, y, width, height)];
//            [[UIColor blackColor] setStroke];
//            [arc stroke];
//            
//            CGContextRestoreGState(theCGContext);
//            
//            
//            
            ////
            
            
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
        var degreesToRadian2: Double { return Double(self) * .pi / 180 }
        var radiansToDegree2: Double { return Double(self) * 180 / .pi }
    }
    
    extension FloatingPoint {
        var degreesToRadian2: Self { return self * .pi / 180 }
        var radiansToDegree2: Self { return self * 180 / .pi }
    }
    
