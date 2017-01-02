//
//  ViewController.swift
//  AnimateAttributedString
//
//  Created by ShrawanKumar Sharma on 30/12/16.
//  Copyright © 2016 com. AnimateAttributedString. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var textView:UITextView!
    var attributedString:NSAttributedString!
    var imageArray : [UIImage]!
    var animteAlter:Bool = true

    
    override func viewDidLoad() {
        super.viewDidLoad()

        let attributedString = animateText()
        textView = UITextView(frame:CGRect(x: 2, y: 50, width: self.view.frame.width - 10, height: 300))
        textView.attributedText = attributedString
        textView.layer.borderColor = UIColor.red.cgColor
        textView.layer.borderWidth = 2.0
        textView.isEditable = true
        self.view.addSubview(textView)
        
        
        
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func animateText() -> NSAttributedString {
        let attachment:NSTextAttachment = NSTextAttachment()
        attachment.image = UIImage(named: "launch.png")
        attachment.setImageHeight(height: 20)
        let attachmentString:NSAttributedString = NSAttributedString(attachment: attachment)
        let attributedString:NSMutableAttributedString = NSMutableAttributedString(string:"This is the attributed String.")
        attributedString.append(attachmentString)
        return attributedString
    }


    @IBAction func animteTextView(_ sender: Any) {
        
        
        let attachment = NSTextAttachment()
        
        let size = textView.dictionaryWithValues(forKeys: <#T##[String]#>)
        if animteAlter {
            self.textView.frame.size.height = 200
            attachment.bounds = CGRect(x: 0, y: 200, width: 20, height: 20)

            animteAlter = false

        }else{
            self.textView.frame.size.height = 100
            attachment.bounds = CGRect(x: 0, y: 100, width: 20, height: 20)

            animteAlter = true

        }
        UIView.animate(withDuration: 2, animations: {
            self.textView.layoutIfNeeded()
        })

    }
    
    
}


// Keeping Image aspect ratio
extension NSTextAttachment {
    func setImageHeight(height: CGFloat) {
        guard let image = image else { return }
        let ratio = image.size.width / image.size.height
        bounds = CGRect(x:bounds.origin.x, y:bounds.origin.y, width:ratio * height, height:height)
    }
}
