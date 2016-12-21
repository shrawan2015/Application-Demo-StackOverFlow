//
//  ViewController.swift
//  CompressionAndDecompressionImage
//
//  Created by ShrawanKumar Sharma on 21/12/16.
//  Copyright © 2016 com. ImageProcessing. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var compressedImage:NSString?
    var decompressedImage:NSString?

    

    
    override func viewDidLoad() {
        super.viewDidLoad()

    
        let image = compressImage()
        var imageView = UIImageView(image: image)
        //self.view.addSubview(imageView)
    
        
      let decompressImage = deCompressImage(image: image)
      
        let imageData =  Data(UIImagePNGRepresentation(decompressImage)! )
        print("*****  Size after decompred \(imageData.description) **** ")
        imageView = UIImageView(image: decompressImage)
        
        decompressedImage = imageData.description as NSString?

        let decompressed = checkImageBeenDecompressed(decompressedImage: decompressedImage!, compressedImage: compressedImage!)
        print(decompressed)
               //self.view.addSubview(imageView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func checkImageBeenDecompressed(decompressedImage:NSString , compressedImage:NSString) -> Bool {
        
         let decompressedSize  = Int( decompressedImage.getNumFromString()! )
         let  compressedSize  =   Int (compressedImage.getNumFromString()! )
         if( decompressedSize!  >  compressedSize! ) {
            print("Image has been decompressed")
           return true
        }
        print("Image has not been decompressed")
        return false
    }
    
    
    func compressImage() -> UIImage {
        
        let oldImage = UIImage(named: "background.jpg")
        var imageData =  Data(UIImagePNGRepresentation(oldImage!)! )
        print("***** Original Uncompressed Size \(imageData.description) **** ")
        
        imageData = UIImageJPEGRepresentation(oldImage!, 0.025)!
        print("***** Compressed Size \(imageData.description) **** ")
       
        compressedImage = imageData.description as NSString?

        let image = UIImage(data: imageData)
        return image!
        
    }
    
    
    func deCompressImage(image:UIImage) -> UIImage {

        UIGraphicsBeginImageContextWithOptions(image.size, true, 0)
        image.draw(at: CGPoint.zero)
        let decompressedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return decompressedImage!
        
    }
    
}


extension NSString {
    func getNumFromString() -> String? {
        
        var numberString: NSString?
        let thisScanner = Scanner(string: self as String)
        let numbers = NSCharacterSet(charactersIn: "0123456789")
        thisScanner.scanUpToCharacters(from: numbers as CharacterSet, into: nil)
        thisScanner.scanCharacters(from: numbers as CharacterSet, into: &numberString)
        return numberString as? String;
    }
}

