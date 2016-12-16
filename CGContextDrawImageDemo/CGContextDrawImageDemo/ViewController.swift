//
//  ViewController.swift
//  CGContextDrawImageDemo
//
//  Created by ShrawanKumar Sharma on 24/09/1938 Saka.
//  Copyright © 1938 Saka com. GradientColor. All rights reserved.
//

import UIKit
import  CoreGraphics
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        self.view = self.view.addGradientImageTo()
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func drawImage() {
        
        let context = UIGraphicsGetCurrentContext()
        
       // let context = UIGraphicsBeginImageContextWithOptions(CGSize(width:200,height:200), false, 2.0)
        let image = UIImage(named: "image.png")
        
       // CGContextDrawImage(context, CGRect(x: 10, y: 10, width: 200, height: 200)  , image?.cgImage )
        
        
    }

    
    

}


extension UIView {
    
     func addGradientImageTo() -> UIView {
        
        let gradient = CAGradientLayer()
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        let arrray = NSArray(array: [UIColor.black.cgColor,UIColor.clear.cgColor])
        gradient.colors = arrray as? [Any]
        layer.insertSublayer(gradient, at: 0)
        return self
    
    }
    
}
