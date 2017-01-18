//
//  ViewController.swift
//  CustomViewFromXIB
//
//  Created by ShrawanKumar Sharma on 18/01/17.
//  Copyright © 2017 com. CustomViewFromXIB. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //@IBOutlet weak var viewOutlet: CustomView!
   
    
    @IBDesignable class CustomView: UIView {
        
    }
    
    var customView:UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}

