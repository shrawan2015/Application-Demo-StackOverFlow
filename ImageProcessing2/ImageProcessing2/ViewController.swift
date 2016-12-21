//
//  ViewController.swift
//  ImageProcessing2
//
//  Created by ShrawanKumar Sharma on 29/09/1938 Saka.
//  Copyright © 1938 Saka com. ImageProcessing. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        var imageName = UIImage(named: "ghost.png")
        //  let context = UIImage.createARGBBitmapContext(imageName.cgImage)
        
        let grayImage = imageName?.getGrayScale()
//        print(grayImage ?? "")
        
        let imageView = UIImageView(image: grayImage)
        
       // self.view.addSubview(imageView)
        
        self.view.addSubview(imageView)
    
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

    

}



extension UIImage {
      func createARGBBitmapContext(inImage: CGImage) -> CGContext {


        let pixelWidth = inImage.width
        let pixelHeight = inImage.height
        let bitmapBytePerRow = pixelWidth * 4
        let bitmapByteCount = bitmapBytePerRow * pixelHeight
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        
        let bitMapData = UnsafeMutableRawPointer( calloc(bitmapByteCount, MemoryLayout<UInt32>.size) )
        let bitmapInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.premultipliedFirst.rawValue)
        let context = CGContext(data: bitMapData, width: pixelWidth, height: pixelHeight, bitsPerComponent: 8, bytesPerRow: bitmapBytePerRow, space: colorSpace, bitmapInfo: bitmapInfo.rawValue)
        
//        context?.draw(inImage, in:CGRect(x: 0  , y: 0, width: 200, height: 200) )
        return context!

    }
    
    
     func getGrayScale() -> UIImage? {
        
        
        let inImage = self.cgImage
        let context = self.createARGBBitmapContext(inImage: inImage!)
        
        
        let pixelWidth  =  inImage?.width
        let pixelHeight = inImage?.height
        
        let rect = CGRect(x:0, y:0, width:Int(pixelWidth!), height:Int(pixelHeight!))
        let bitmapBytePerRow = pixelWidth! * 4

        let bitmapByteCount = bitmapBytePerRow * pixelHeight!

        context.clear(rect)
        
        context.draw(self.cgImage!, in: rect)
        

        
        let data = context.data
//        let bitMapData = UnsafeMutableRawPointer( calloc(data, MemoryLayout<UInt32>.size) )
        
//        let bitMapData = UnsafeMutableRawPointer(data)
        
        
        let bitMapData = UnsafeMutableRawPointer(data)

        

        
        let point: CGPoint = CGPoint(x: 0, y: 0)
        
        
        for x in 0..<(Int(pixelWidth!)) {
            for y in 0..<(Int(pixelHeight!)) {
                
                let offset = 4*((Int(pixelWidth!) * Int(y)) + Int(x))
                
                
//                
//                let alpha = bitMapData[offset]
//                let red = bitMapData[offset+1]
//                let green = bitMapData[offset+2]
//                let blue = bitMapData[offset+3]
//                
                
                let alpha = bitMapData?.load(fromByteOffset: offset, as: UInt32.self )
                
                let red = bitMapData?.load(fromByteOffset: offset + 1 , as: UInt32.self)
                
                let green = bitMapData?.load(fromByteOffset: offset + 2, as: UInt32.self)
                let blue = bitMapData?.load(fromByteOffset: offset + 3 , as: UInt32.self)

                let avg = (UInt32(red!) + UInt32(green!) + UInt32(blue!))/3
                
                bitMapData?.storeBytes(of: (avg) , toByteOffset: offset + 1, as: UInt32.self )
                bitMapData?.storeBytes(of: (avg) , toByteOffset: offset + 2, as: UInt32.self )
                bitMapData?.storeBytes(of: (avg) , toByteOffset: offset + 3, as: UInt32.self )

//                
//                bitMapData[offset + 1] = UInt8(avg)
//                bitMapData[offset + 2] = UInt8(avg)
//                bitMapData[offset + 3] = UInt8(avg)
//                
//                
                
                
            }
        
        

    }
        
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let bitmapInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.premultipliedFirst.rawValue)
        
        let finalcontext = CGContext(data: data, width: pixelWidth!, height: pixelHeight!, bitsPerComponent: 8,  bytesPerRow: bitmapBytePerRow, space: colorSpace, bitmapInfo: bitmapInfo.rawValue)
        
//        let imageRef = CGBitmapContextCreateImage(finalcontext!)
        let imageRef = finalcontext!.makeImage()

        return UIImage(cgImage: imageRef!, scale: self.scale,orientation: self.imageOrientation)
    }
        
        
}
