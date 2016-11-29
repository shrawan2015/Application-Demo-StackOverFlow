//
//  InterfaceController.swift
//  WatchKit Extension
//
//  Created by ShrawanKumar Sharma on 25/11/16.
//  Copyright © 2016 WATCHOS.COM. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity

class InterfaceController: WKInterfaceController,WCSessionDelegate {

    @IBOutlet var textLabel: WKInterfaceLabel!
    
    var session:WCSession?
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        checkSupportOfSession()
        changeAttributeOfText()
    }
    
    @IBOutlet var buttonOutlet: WKInterfaceButton!
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    func checkSupportOfSession() {
        if( WCSession.isSupported() ) {
            self.session = WCSession.default()
            self.session?.delegate = self
            self.session?.activate()
        }
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        print("session")
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {

        let message:String = message["textIndex"] as! String
        textLabel.setText(message)
        print(message)
       
    }
    @IBAction func buttonClicked() {
        buttonOutlet.setTitle("textNew")
       // buttonOutlet.setAttributedTitle(NSAttributedString?)
    }
    
    func changeAttributeOfText() {
        
        let paragraphStyle =  NSMutableParagraphStyle()
        paragraphStyle.alignment = .left
        let font = UIFont.boldSystemFont(ofSize: 12)
        let attributes:Dictionary = [NSParagraphStyleAttributeName:paragraphStyle ,  NSFontAttributeName:font ]
        
        let attributeString:NSAttributedString = NSAttributedString(string: "HELLO", attributes: attributes)
        textLabel.setAttributedText(attributeString)
        
    }
    

}
