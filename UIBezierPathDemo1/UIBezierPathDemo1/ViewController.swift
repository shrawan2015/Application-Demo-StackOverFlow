//
//  ViewController.swift
//  UIBezierPathDemo1
//
//  Created by ShrawanKumar Sharma on 01/12/16.
//  Copyright © 2016 com.demoapp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageOutlet: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let path3 = createBeizePath()

        
        
        //we can create path either by the draw or CAShapreLayre
        

        //first method by the CAShapeLayer
        let shapeLayer = CAShapeLayer()
        shapeLayer.path =  createBeizePath().cgPath
        shapeLayer.strokeColor = UIColor.black.cgColor
        shapeLayer.fillColor = UIColor.red.cgColor
        shapeLayer.position = CGPoint(x: 30, y: 30)
        shapeLayer.lineWidth =  2.0
        //self.view.layer.addSublayer(shapeLayer)
        
        
        //to scale the path we can 
        let path = createBeizePath()
        let scale = CGAffineTransform(scaleX: 5, y: 2)
        path.apply(scale)
        shapeLayer.path = path.cgPath
        
        
        
        //second method by draw
        let path2 = createBeizePath()
        
        //fill
        let fillColor = UIColor.black
        fillColor.setFill()
        
        //stroke
        path2.lineWidth = 2.0
        let strokeColor = UIColor.blue
        strokeColor.setStroke()
        
        //path and stroke the path 
        path2.fill()
        path2.stroke()
        
        
        
        //self.view.draw(CGRect(x: 4 , y: 5 , width: 50, height: 50) )
        self.view.setNeedsLayout()

        let image:UIImage = UIImage.shapeImageWithBezierPath(bezierPath: path3, fillColor: .red, strokeColor: .black)
        self.view.setNeedsLayout()
        imageOutlet.image = image
//        imageOutlet.image( UIImage.shapeImageWithBezierPath(bezierPath: path, fillColor: .red, strokeColor: .black))
        self.view.setNeedsLayout()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

     func draw(_ rect: CGRect) {
        //second method by draw
        let path2 = createBeizePath()
        
        //fill
        let fillColor = UIColor.black
        fillColor.setFill()
        
        //stroke
        path2.lineWidth = 2.0
        let strokeColor = UIColor.blue
        strokeColor.setStroke()
        
        //path and stroke the path
        path2.fill()
        path2.stroke()

    }
    
    
func createBeizePath() -> UIBezierPath
{
    let path = UIBezierPath()
    path.move(to: CGPoint(x: 20, y: 100) )
    path.addLine(to: CGPoint(x: 50 , y: 100))
    path.addLine(to: CGPoint(x: 50, y: 150))
    path.addLine(to: CGPoint(x: 20, y: 150))
//    path.addLine(to: CGPoint(x: 15, y: 200))
    return path
    }
    
}
    
    extension UIImage {
        class func shapeImageWithBezierPath(bezierPath: UIBezierPath, fillColor: UIColor?, strokeColor: UIColor?, strokeWidth: CGFloat = 0.0) -> UIImage! {
            
            
            //: 1. Normalize bezier path. We will apply a transform to our bezier path to ensure that it's placed at the coordinate axis. Then we can get its size.
            bezierPath.apply(CGAffineTransform(translationX: -bezierPath.bounds.origin.x, y: -bezierPath.bounds.origin.y ) )
//            let size = CGSize(width: bezierPath.bounds.size.width, height:  bezierPath.bounds.size.height)
            let size = CGSize(width: 100    , height: 100)
           // let size = CGSizeMake(bezierPath.bounds.size.width, bezierPath.bounds.size.height)
            
            
            //: 2. Initialize an image context with our bezier path normalized shape and save current context
            UIGraphicsBeginImageContext(size)
            let context = UIGraphicsGetCurrentContext()
            
            var image = UIImage()
            
            if let context  = context {
                context.saveGState()
                context.addPath(bezierPath.cgPath)
                
                //: 4. Set parameters and draw
                if strokeColor != nil {
                    strokeColor!.setStroke()
                    context.setLineWidth(strokeWidth)
                } else { UIColor.clear.setStroke() }
                fillColor?.setFill()
                
                context.drawPath(using: .fillStroke)
                //: 5. Get the image from the current image context
                 image = UIGraphicsGetImageFromCurrentImageContext()!
                //: 6. Restore context and close everything
                context.restoreGState()
                UIGraphicsEndImageContext()
            }
            
            
            
            
            //: 3. Set path
           
            //: Return image
            return image
        }
    }





