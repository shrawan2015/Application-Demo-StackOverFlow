//
//  ViewController.swift
//  AnimatingCGPath
//
//  Created by ShrawanKumar Sharma on 02/01/17.
//  Copyright © 2017 com. AnimatingCGPath. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var penLayer:CALayer!
    var pathLayer:CALayer!
    var pathToTrace:CALayer!
    var animateLayer:CALayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addAnimateLayer()
        addPathLayer()
        addpenLayer()
        
        drawGmailPath()
        animateGmailPath()
    
    
    }

    
    
//    
//    func animatePath() {
//        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
//        basicAnimation.fromValue = NSNumber(value: 0.0)
//        basicAnimation.toValue = NSNumber(value: 1.0)
//        basicAnimation.duration = 10.0
//        
//        let shapeLayer = CAShapeLayer()
//        shapeLayer.path = drawPath().cgPath
//        //shapeLayer.fillColor = UIColor.red.cgColor
//        self.view.layer.addSublayer(shapeLayer)
//        shapeLayer.lineWidth = 1.0
//        shapeLayer.add(basicAnimation, forKey: "strokeEndAnimation")
//
//        let penLayer = CAShapeLayer()
//        penLayer.path = drawPenPath().cgPath
//        penLayer.lineWidth = 1.0
//        penLayer.add(basicAnimation, forKey: "strokeEndAnimation")
//        self.view.layer.addSublayer(penLayer)
//        
//        let penAnimation = CAKeyframeAnimation(keyPath: "position")
//        penAnimation.duration = 10.0
//        penAnimation.path = shapeLayer.path
//        penAnimation.calculationMode  = kCAAnimationPaced
//        penLayer.add(penAnimation, forKey: "penAnimation")
//    }
//
//    
//    
//    func drawPath() -> UIBezierPath {
//        let path = UIBezierPath(roundedRect: CGRect(x: self.view.frame.width/2, y: self.view.frame.height/2, width: 150, height: 150) , cornerRadius:34.0 )
//        return path
//    }
//    
//    
//    
//    
//    func drawPenPath() -> UIBezierPath {
//        let path = UIBezierPath()
//        path.move(to: CGPoint(x: 10, y: 10) )
//        path.addLine(to: CGPoint(x: 14, y: 10) )
//        path.addLine(to: CGPoint(x: 14, y: 15))
//        path.addLine(to: CGPoint(x: 12, y: 17) )
//        path.addLine(to: CGPoint(x: 10, y: 15))
//        path.stroke()
//        path.fill()
//        path.close()
//        return path
//    }
//    
//    func drawPenImage() {
//        let pensLayer = CALayer()
//        let penimage = UIImage(named: "penProjection.png")
//        pensLayer.contents = penimage?.cgImage
//        pensLayer.anchorPoint = CGPoint.zero
//        pensLayer.frame = CGRect(x: 0.0, y: 0.0, width: (penimage?.size.width)!, height: (penimage?.size.height)!)
//        pensLayer.addSublayer(pensLayer)
//        penLayer = pensLayer
//
//    }
//    
//    
//    func drawAnimation() {
//        
//    }
//    
    
   //MARK:-  Create path 
    
    func gmailPath() -> UIBezierPath {
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 20, y: 20))
        path.addLine(to: CGPoint(x: 80, y: 20))
        path.addLine(to: CGPoint(x:80,y:60))
        path.addLine(to: CGPoint(x: 20, y: 60) )
        path.close()
        return path
    }
    
    func drawGmailPath() {
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = gmailPath().cgPath
        
        
    }
    
    
    func animateGmailPath() -> UIBezierPath {
        
        
        
    }
    
    
}

