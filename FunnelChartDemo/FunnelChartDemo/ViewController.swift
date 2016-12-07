//
//  ViewController.swift
//  FunnelChartDemo
//
//  Created by ShrawanKumar Sharma on 07/12/16.
//  Copyright © 2016 com.demoapp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
   
        let customView = FilterView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height) )
        self.view.addSubview(customView)
        
        
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    
    
    func drawTopLabel() {
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 50, y: 50) )
        path.addLine(to: CGPoint(x: 100, y: 50) )
        path.addLine(to: CGPoint(x: 100 - 4, y: 50 + 30) )
        path.addLine(to: CGPoint(x: 50 + 4 , y: 50 +  30) )
        path.close()
       // return path
        
    }
    
    func middleLabel() {
        
    }
    
    func bottomLabel() {
        
        
        
    }
    
    

}

