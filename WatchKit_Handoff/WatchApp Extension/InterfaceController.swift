//
//  InterfaceController.swift
//  WatchApp Extension
//
//  Created by ShrawanKumar Sharma on 29/11/16.
//  Copyright © 2016 WATCHOS.COM. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController     {

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
      //  let userActivity = NSUserActivity(activityType: "WatchKit-Handoff.Notification.com")
        //userActivity.title = "HANDOFF"
        //self.activi
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    @IBAction func navigateToApp() {
      //  let userActivity = NSUserActivity(activityType: "WatchKitHandoff.Notification.com")
        //userActivity.ac
        self.updateUserActivity("com.WatchKit.Notification.", userInfo:["key":"value"], webpageURL:nil)
    }
    
}
