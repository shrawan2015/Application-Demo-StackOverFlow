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
    var pathLayer:CAShapeLayer!
    var pathToTrace:CALayer!
    var animateLayer:CALayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addAnimateLayer()
        addPathLayer()
        addpenLayer()
        
        drawGmailPath()
        
        animatePenAndText()
        
//        animateGmailPath()
    
    
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
    
    
    
    
    
    
//    addAnimateLayer()
//    addPathLayer()
//    addpenLayer()
  
    
    func addAnimateLayer() {
        let animateLayer = CALayer()
        animateLayer.frame = CGRect(x: 20.0, y: 40.0, width: self.view.layer.bounds.width - 40.0, height: self.view.layer.bounds.height - 84.0)
        self.view.layer.addSublayer(animateLayer)
        self.animateLayer = animateLayer
    
    }
    
    func addPathLayer() {
        
        let path = gmailPath()
        let pathLayer = CAShapeLayer()
        pathLayer.path = path.cgPath
        pathLayer.fillColor = UIColor.clear.cgColor
        pathLayer.strokeColor = UIColor.red.cgColor
        pathLayer.frame = animateLayer.bounds
        pathLayer.bounds = animateLayer.bounds
        pathLayer.isGeometryFlipped = true
        pathLayer.strokeColor = UIColor.black.cgColor
        pathLayer.lineWidth = 10.0
        pathLayer.lineJoin = kCALineJoinBevel
        animateLayer.addSublayer(pathLayer)
        
        self.pathLayer = pathLayer
        
    }
    
    func addpenLayer() {
        
        let penImage = UIImage(named: "penProjection.png")
        let penLayer = CALayer()
        penLayer.contents = penImage?.cgImage
        penLayer.anchorPoint = CGPoint.zero
        penLayer.frame = CGRect(x: 0, y: 0, width:(penImage?.size.width)! , height: (penImage?.size.height)!)
        pathLayer.addSublayer(penLayer)
       
        self.penLayer = penLayer
    }
    
    
    func animatePenAndText() {

        let pathAnimation = CABasicAnimation(keyPath: "strokeEnd")
        pathAnimation.duration = 10.0
        pathAnimation.fromValue = 0.0
        pathAnimation.toValue = 1.0
        pathLayer?.add(pathAnimation, forKey: "strokeEnd")
        
        let penAnimation = CAKeyframeAnimation(keyPath: "position")
        penAnimation.duration = 10.0
        penAnimation.path = self.pathLayer.path
        penAnimation.calculationMode = kCAAnimationPaced
        penLayer?.add(penAnimation, forKey: "position")
    }
}

