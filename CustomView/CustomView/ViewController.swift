//
//  ViewController.swift
//  CustomView
//
//  Created by ShrawanKumar Sharma on 02/12/16.
//  Copyright © 2016 com.demoapp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


class CustomView:UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setUpView() {
        let frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        UIGraphicsBeginImageContextWithOptions(self.frame.size, false, 0.0)
        let context = UIGraphicsGetCurrentContext()
        context!.saveGState()
        let beizerPath = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height) )
        beizerPath.addClip()
        //self.drawInRect(frame)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        context!.restoreGState()
        UIGraphicsEndImageContext()
        //return newImage
        
    }
    
}

