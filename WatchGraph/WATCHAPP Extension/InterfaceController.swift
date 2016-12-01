//
//  InterfaceController.swift
//  WATCHAPP Extension
//
//  Created by ShrawanKumar Sharma on 30/11/16.
//
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet var graphImage: WKInterfaceImage!
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        
//        // Create a graphics context
//        let size = CGSize(width: 100 , height: 100)
//        UIGraphicsBeginImageContext(size)
//        let context = UIGraphicsGetCurrentContext()
//        
//        // Setup for the path appearance
//        context!.setStrokeColor(UIColor.white.cgColor)
//        context!.setLineWidth(4.0)
//        
//        // Draw lines
//        context!.beginPath ()
//        context?.move(to:CGPoint(x: 0, y: 0),
//        context?.addLine(to: CGPoint(x:100 , y:100 ) ),
//        
//        
////        
////        CGContextMoveToPoint(context, 0, 0)
////        CGContextAddLineToPoint(context, 100, 100)
////        CGContextMoveToPoint(context, 0, 100)
////        CGContextAddLineToPoint(context, 100, 0)
//        CGContextStrokePath(context)
//        
//        // Convert to UIImage
//        let cgimage = context!.makeImage()
//        let uiimage = UIImage(cgImage: cgimage!)
//        
//        // End the graphics context
//        UIGraphicsEndImageContext()
        
        
        let aPath = UIBezierPath()
        
        aPath.move(to: CGPoint(x:20, y:50))
        
        aPath.addLine(to: CGPoint(x:300, y:50))
        
        //Keep using the method addLineToPoint until you get to the one where about to close the path
        
        aPath.close()
        
        //If you want to stroke it with a red color
        UIColor.red.set()
        aPath.stroke()
        //If you want to fill it as well
        aPath.fill()
        
        // Show on WKInterfaceImage
        graphImage.setImage(uiimage)
        
        
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
