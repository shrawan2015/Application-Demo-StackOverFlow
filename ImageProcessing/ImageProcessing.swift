//
//  ImageProcessing.swift
//  ImageProcessing
//
//  Created by ShrawanKumar Sharma on 28/09/1938 Saka.
//  Copyright © 1938 Saka com. ImageProcessing. All rights reserved.
//

import Foundation
import UIKit

class ImageProcessingView:UIView {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
       // fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        imageProcessing(image:UIImage(named: "background.jpg")!)

    }
    
    func imageProcessing(image:UIImage) {
        
        let imageRef = image.cgImage
        let inputWidth = imageRef?.width
        let inputHeight = imageRef?.height
        
        let  bytesPerPixel = 4
        let bytesPerRow = bytesPerPixel * inputWidth!
        let bitsPerComponent = 8
        
        
        var pixels = UnsafeMutableRawPointer( calloc(inputHeight! * inputWidth!, MemoryLayout<UInt32>.size) )
        
        
        /*
         
         CGContextRef context = CGBitmapContextCreate(inputPixels, inputWidth, inputHeight,
         bitsPerComponent, inputBytesPerRow, colorSpace,
         kCGImageAlphaPremultipliedLast | kCGBitmapByteOrder32Big);
         
         */
        
        
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let bitmapInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.premultipliedLast.rawValue)
        
        guard let context = CGContext.init(data: nil, width: inputWidth!, height: inputHeight!, bitsPerComponent: Int(bitsPerComponent), bytesPerRow: Int(bytesPerRow), space: colorSpace, bitmapInfo: UInt32(bitmapInfo.rawValue)) else {
            // cannot create context - handle error
            return
        }
        
        
        //CGContextDrawImage(context, CGRectMake(0, 0, inputWidth, inputHeight), inputCGImage);
        
        context.draw(imageRef!, in: CGRect(x: 0, y: 0, width: inputWidth!, height: inputHeight!) )
        
        
        
        /*
         
         // 2. Blend the ghost onto the image
         UIImage * ghostImage = [UIImage imageNamed:@"ghost"];
         CGImageRef ghostCGImage = [ghostImage CGImage];
         
         // 2.1 Calculate the size & position of the ghost
         CGFloat ghostImageAspectRatio = ghostImage.size.width / ghostImage.size.height;
         NSInteger targetGhostWidth = inputWidth * 0.25;
         CGSize ghostSize = CGSizeMake(targetGhostWidth, targetGhostWidth / ghostImageAspectRatio);
         CGPoint ghostOrigin = CGPointMake(inputWidth * 0.5, inputHeight * 0.2);
         
         // 2.2 Scale & Get pixels of the ghost
         NSUInteger ghostBytesPerRow = bytesPerPixel * ghostSize.width;
         
         UInt32 * ghostPixels = (UInt32 *)calloc(ghostSize.width * ghostSize.height, sizeof(UInt32));
         
         CGContextRef ghostContext = CGBitmapContextCreate(ghostPixels, ghostSize.width, ghostSize.height,
         bitsPerComponent, ghostBytesPerRow, colorSpace,
         kCGImageAlphaPremultipliedLast | kCGBitmapByteOrder32Big);
         
         CGContextDrawImage(ghostContext, CGRectMake(0, 0, ghostSize.width, ghostSize.height),ghostCGImage);
         
         */
        
        
        let ghostImage = UIImage(named: "ghost.png")
        let ghostRef = ghostImage?.cgImage
        let ghostImageAspectRatio = (ghostImage?.size.width)! / (ghostImage?.size.height)!
        let targetGhostWidth = Double(inputWidth!) * 0.25
        let ghostSize = CGSize(width: targetGhostWidth, height: Double(targetGhostWidth)
            / Double(ghostImageAspectRatio ) )
        let ghostOrigin = CGPoint(x: Double(inputWidth!) * 0.5, y: Double(inputHeight!) * 0.2)
        
        
        
        let ghostBytePerRow = Double(bytesPerPixel) * Double(ghostSize.width)
        
        
        var ghostpixels = UnsafeMutableRawPointer( calloc( Int(ghostSize.width) * Int(ghostSize.height), MemoryLayout<UInt32>.size) )
        
        
        
        
        guard let ghostContext = CGContext.init(data: nil, width: Int(ghostSize.width), height: Int(ghostSize.height) , bitsPerComponent: Int(bitsPerComponent), bytesPerRow: Int(bytesPerRow), space: colorSpace, bitmapInfo: UInt32(bitmapInfo.rawValue)) else {
            // cannot create context - handle error
            return
        }
        
        /*
         
         CGContextDrawImage(ghostContext, CGRectMake(0, 0, ghostSize.width, ghostSize.height),ghostCGImage);
         
         */
        
        //        ghostContext.draw( ghostImage , in: CGRect(x: 0, y: 0, width: ghostSize.width, height: ghostSize.height) )
        
        ghostContext.draw(imageRef!, in: CGRect(x: 0, y: 0, width: inputWidth!, height: inputHeight!) )
        
//        
//        CGImageRef newCGImage = CGBitmapContextCreateImage(context);
//        UIImage * processedImage = [UIImage imageWithCGImage:newCGImage];

    
        let image = context.makeImage()
        let imagePROCEEES = UIImage(cgImage: image!)
        
        let imageView = uiv
        addSubview(imageView)
        
    
    }
}
