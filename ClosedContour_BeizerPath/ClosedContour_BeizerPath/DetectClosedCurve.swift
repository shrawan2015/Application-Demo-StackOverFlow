
import Foundation
import UIKit

class DetectClosedCurve :UIView  {
    
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
        currentContext?.saveGState()
        
        let closePath = drawClosedPath()
        closePath.lineWidth = 2
        closePath.fill()
        closePath.stroke()
        
        
        let openPath = drawOpenPath()
        openPath.lineWidth = 2
        openPath.fill()
        openPath.stroke()
        
        currentContext?.restoreGState()
        
        let status = openPath.isClosedCurve()
        print("  closePath status  == \(status)")
        
        let statusClose = closePath.isClosedCurve()
        print("  closePath status == \(statusClose)")
        
        
        
    }
    
    func drawClosedPath() -> UIBezierPath {
        
        let path = UIBezierPath()
        path.addArc(withCenter: CGPoint(x:120,y:120), radius: 50, startAngle: CGFloat(0.degreesToRadians), endAngle: CGFloat(90.degreesToRadians) , clockwise: true)
        path.addArc(withCenter: CGPoint(x:120,y:120), radius: 50, startAngle: CGFloat(90.degreesToRadians), endAngle: CGFloat(180.degreesToRadians), clockwise: true)
        path.addLine(to: CGPoint(x:170,y:120))
        //        mainPath addLineToPoint:CGPointMake(170, 120
        path.close()
        
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: 100,y: 100), radius: CGFloat(20), startAngle: CGFloat(0), endAngle:CGFloat(M_PI * 2), clockwise: true)

        
        let arrowPath = UIBezierPath()
        arrowPath.move(to: CGPoint(x:50, y:0))
        arrowPath.addLine(to:CGPoint(x:70, y:25))
        arrowPath.addLine(to: CGPoint(x:60, y:25))
        arrowPath.addLine(to: CGPoint(x:60, y:75))
        arrowPath.addLine(to: CGPoint(x:40, y:75))
        arrowPath.addLine(to: CGPoint(x:40, y:25))
        arrowPath.addLine(to: CGPoint(x:30, y:25))
        arrowPath.addLine(to: CGPoint(x:50, y:0))
        
        //arrowPath.close()
        return arrowPath
        
    }
    
    
    func drawOpenPath() -> UIBezierPath {
        let path = UIBezierPath()
        path.addArc(withCenter: CGPoint(x:200,y:200), radius: 50, startAngle: CGFloat(0.degreesToRadians), endAngle: CGFloat(90.degreesToRadians) , clockwise: true)
        path.addArc(withCenter: CGPoint(x:200,y:200), radius: 50, startAngle: CGFloat(90.degreesToRadians), endAngle: CGFloat(180.degreesToRadians), clockwise: true)
        return path
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


extension CGPath {
    func forEachs( body: @convention(block) (CGPathElement) -> Void) {
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
    func isClosedCurve() -> Bool {
        var isClosedCurve: Bool = false
        
        cgPath.forEach { element in
            
            if(element.type == .closeSubpath){
                isClosedCurve = true
                
            }
        }
        return isClosedCurve
    }
}
