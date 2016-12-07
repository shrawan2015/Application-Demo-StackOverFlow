//
//  ViewController.swift
//  CircleImage
//
//  Created by ShrawanKumar Sharma on 02/12/16.
//  Copyright © 2016 com.demoapp. All rights reserved.
//

import UIKit
import Darwin

class ViewController: UIViewController {

    @IBOutlet weak var imageOutlet: UIImageView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image = UIImage(named: "IMG_0001.JPG")
        if let image = image {
        let minSide = min(image.size.width, image.size.height )
        let clipFrame = CGRect(x: 0.5 * (image.size.width - minSide) , y:  0.5 * (image.size.height - minSide), width: minSide, height: minSide)
            
            //let clipf = CGRect(x:  0.5 * (image.size.width) - 25 , y:  0.5 * (image.size.height) - 25 ,width: 25,height:25  )
        let image3 = image.imageCroppingBezierPath(path: UIBezierPath(ovalIn: clipFrame))
//            let image3 = image.imageCroppingBezierPath(path: UIBezierPath(roundedRect: clipFrame, cornerRadius: 25))

           // let pi = M_PI
            
//            let image3 = image.imageCroppingBezierPath(path: UIBezierPath(arcCenter: CGPoint(x:image.size.width/2,y:image.size.width/2 )  , radius: 500, startAngle: 0, endAngle:  (2 * CGFloat(M_PI) ), clockwise: true) )
                imageOutlet.image = image3
        
            
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}


extension UIImage {
    func imageCroppingBezierPath(path:UIBezierPath) ->UIImage {
        
        let frame = CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height)
        
        //Defining a graphic context  to paint on
        UIGraphicsBeginImageContextWithOptions(self.size, false, 0.0)
        //Get the current graphics context (if it exists)
        let context = UIGraphicsGetCurrentContext()
        //save the current graphic context
        context?.saveGState()
        // clipping area
        path.addClip()
        self.draw(in: frame)
        
        //To extract an image from our canvas
        let image = UIGraphicsGetImageFromCurrentImageContext()
        //restore graphic context
        context?.restoreGState()
        //remove current context from stack
        UIGraphicsEndImageContext()
        return image!
    }
}

