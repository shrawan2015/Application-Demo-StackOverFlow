//
//  ViewController.swift
//  ClosedContour_BeizerPath
//
//  Created by ShrawanKumar Sharma on 08/12/16.
//  Copyright © 2016 com. ClosedContour. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
   
    // let pathView =  BeizerPathView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: //self.view.frame.height ) )
       // self.view.addSubview(pathView)
        
        
        
        let pathView2 =  DetectClosedCurve(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height ) )
        self.view.addSubview(pathView2)

    
    }




}

