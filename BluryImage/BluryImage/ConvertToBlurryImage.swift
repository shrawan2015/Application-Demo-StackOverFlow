//
//  ConvertToBlurryImage.swift
//  BluryImage
//
//  Created by ShrawanKumar Sharma on 25/09/1938 Saka.
//  Copyright © 1938 Saka com. PolygonIntersection. All rights reserved.
//

import Foundation
import UIKit

class ConvertToBlurryImage:UIView {
  
    
    
    var originalImage:UIImage!
    var finalImage:UIImage!
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        
        //Original Image
        originalImage = UIImage(named: "originalImage.png")
        
        //Intermediate Image
        let intermediateImage = UIImage().returnBlurImage(image: originalImage)
        
        //Final Result Image
        finalImage =  blendImage(image: intermediateImage)

        let attachedImage = UIImageView(image: finalImage)
        addSubview(attachedImage)

    }
    
    func blendImage(image:UIImage) -> UIImage {
        
        UIGraphicsBeginImageContext(frame.size)
        image.draw(in: CGRect(origin: frame.origin, size: frame.size) )
        
         //  20 === clear
        let mode = CGBlendMode(rawValue: 16)
        UIGraphicsGetCurrentContext()!.setBlendMode(mode!)
        
        //Path that need to crop
        pathToCrop()
        
        let mode2 = CGBlendMode(rawValue: 16)
        UIGraphicsGetCurrentContext()!.setBlendMode(mode2!)
        
        let finalImage = UIGraphicsGetImageFromCurrentImageContext()
        return finalImage!
        
    }

    func pathToCrop() {
        let path = UIBezierPath(ovalIn: CGRect(x: frame.width/2 - 50, y: frame.height/2 - 100 , width: 150, height: 150) )
        path.fill()
        path.stroke()
    }
    
    
}

extension UIImage {
    
    func returnBlurImage(image:UIImage) -> UIImage {
        
        let beginImage = CIImage(cgImage: image.cgImage!)
        let blurfilter = CIFilter(name: "CIGaussianBlur")
        blurfilter?.setValue(beginImage, forKey: "inputImage")
        let resultImage = blurfilter?.value(forKey: "outputImage") as! CIImage
        let blurredImage = UIImage(ciImage: resultImage)

        return blurredImage
        
        
        
    }
    
}

