//
//  CustomView.swift
//  CustomViewFromXIB
//
//  Created by ShrawanKumar Sharma on 18/01/17.
//  Copyright © 2017 com. CustomViewFromXIB. All rights reserved.
//

import UIKit

class CustomView: UIView {
    
    @IBOutlet weak var firstName: UILabel!

    var view:UIView!
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpXib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpXib()
    }
    
    func loadFromNib() -> UIView{
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "CustomView", bundle: bundle)
        view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }
    
    
    func setUpXib(){
        let view = loadFromNib()
        view.frame = bounds
        view.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight]
        addSubview(view)
    }
    
    
}
