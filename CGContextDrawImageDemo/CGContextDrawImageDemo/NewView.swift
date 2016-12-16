//
//  NewView.swift
//  CGContextDrawImageDemo
//
//  Created by ShrawanKumar Sharma on 24/09/1938 Saka.
//  Copyright © 1938 Saka com. GradientColor. All rights reserved.
//

import Foundation
import UIKit

class NewView:UIView {
    
    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        let image = UIImage(named: "iamge.png")
        //CGContextDrawImage(context, CGRect(x: 10, y: 10, width: 200, height: 200)  , image?.cgImage )

    }
    
}
