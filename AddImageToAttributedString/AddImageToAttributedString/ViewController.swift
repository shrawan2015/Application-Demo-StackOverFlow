//
//  ViewController.swift
//  AddImageToAttributedString
//
//  Created by ShrawanKumar Sharma on 29/12/16.
//  Copyright © 2016 com. AddImageToAttributedString. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cloudOutlet: UIButton!
    @IBOutlet weak var womenOutlet: UIButton!
    @IBOutlet weak var menOutlet: UIButton!

    var textView:UITextView!
    var attributedString:NSAttributedString!
    var imageArray : [UIImage]!

    
    override func viewDidLoad() {
        super.viewDidLoad()


        let attributedString = animateText()
        textView = UITextView(frame:CGRect(x: 0, y: 50, width: self.view.frame.width, height: 300))
        textView.attributedText = attributedString
        textView.isEditable = true
        
        self.view.addSubview(textView)
        
        cloudOutlet.addTarget(self, action: #selector(ViewController.buttonPressed(_:)), for: UIControlEvents.touchUpInside)
        womenOutlet.addTarget(self, action: #selector(ViewController.buttonPressed(_:)), for: UIControlEvents.touchUpInside)
        menOutlet.addTarget(self, action: #selector(ViewController.buttonPressed(_:)), for: UIControlEvents.touchUpInside)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
    
    
  func buttonPressed(_ sender: Any) {
    
    let  button = sender as! UIButton
    let tag =  button.tag
    let attributedString:NSAttributedString!
    
    switch tag {
    case 2:
        attributedString = addAttributedText(text: (button.titleLabel?.text)!)
    case 3:
        attributedString = addAttributedText(text: (button.titleLabel?.text)!)
    case 4:
        attributedString = addAttributedText(text: (button.titleLabel?.text)!)
    default:
       attributedString = addAttributedText(text: "launch")
      }
        textView.attributedText = attributedString
    }
    
    func addAttributedText(text:String) -> NSAttributedString {
      
        textViewDidChange(textView)
        
        let axtractedImageAttribute = NSMutableAttributedString()
        for image in imageArray {
            let attachment:NSTextAttachment = NSTextAttachment()
            attachment.image = image
            attachment.setImageHeight(height: 20)
            let attachmentString:NSAttributedString = NSAttributedString(attachment: attachment)
            axtractedImageAttribute.append(attachmentString)
        }
        
        let attachment:NSTextAttachment = NSTextAttachment()
        attachment.image = UIImage(named: "\(text).png")
        attachment.setImageHeight(height: 20)
        let attachmentString:NSAttributedString = NSAttributedString(attachment: attachment)
        
        let attributedString:NSMutableAttributedString = NSMutableAttributedString(string:textView.text!)

        
        attributedString.append(axtractedImageAttribute)
        attributedString.append(attachmentString)

        return attributedString
    }
 
    //MARKS:-  Extract attachedImage
    func textViewDidChange(_ textView: UITextView)  {
        imageArray = [UIImage]()
        let range = NSRange(location: 0, length: textView.attributedText.length)
        if (textView.textStorage.containsAttachments(in: range)) {
            let attrString = textView.attributedText
            var location = 0
            while location < range.length {
                var r = NSRange()
                let attrDictionary = attrString?.attributes(at: location, effectiveRange: &r)
                if attrDictionary != nil {
                    let attachment = attrDictionary![NSAttachmentAttributeName] as? NSTextAttachment
                    if attachment != nil {
                        if attachment!.image != nil {
                            imageArray.append( attachment!.image!)
                        }
                    }
                    location += r.length
                }
            }
        }
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


