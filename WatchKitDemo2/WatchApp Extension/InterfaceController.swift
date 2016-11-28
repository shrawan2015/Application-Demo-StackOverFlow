//
//  InterfaceController.swift
//  WatchApp Extension
//
//  Created by ShrawanKumar Sharma on 28/11/16.
//  Copyright © 2016 WATCHOS.COM. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity

class InterfaceController: WKInterfaceController,WCSessionDelegate {

    var session:WCSession?
    
    @IBOutlet var sliderOutlet: WKInterfaceSlider!
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        checkStatus()
        
        // Configure interface objects here.
    }
    
    func checkStatus() {
        
        if WCSession.isSupported() {
           session = WCSession.default()
            session?.delegate = self
            session?.activate()
            
        }
    }
    
    @IBAction func sliderChange(_ value: Float)
    {
        let str:String?
        
        switch value {
            
        case 0...7 :
              str = "Running"
        case 8...14 :
              str = "Sleeping"
        default:
            str = "normal"
        }
        
         updateContext(value: str!)
        
    }
    
    
    func updateContext(value:String) {
        
        let dictionary = [ "watchType" : value ]
        do {
            print("update application context is called do statemet")
            try session?.updateApplicationContext(dictionary)
        }
        catch{
            print("this is the catch statement")
        }

    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    
    public func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
        print("activation did complete with")
    }
    
    
    public func session(_ session: WCSession, didFinish userInfoTransfer: WCSessionUserInfoTransfer, error: Error?) {
        print("didfinish called ")
    }
    
//     public func session(_ session: WCSession, didFinish userInfoTransfer: WCSessionUserInfoTransfer, error: Error?) {
//     print("didFinish watch")
//        print(session)
//        print(error)
//    }
}
