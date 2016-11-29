//
//  InterfaceController.swift
//  WatchOS Extension
//
//  Created by ShrawanKumar Sharma on 29/11/16.
//  Copyright © 2016 WATCHOS.COM. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
    }
    
    var refreshTimer = Timer()
   
    func startTimer() {
        refreshTimer = Timer.scheduledTimer(timeInterval: 60, target: self, selector: #selector(InterfaceController.timerDone), userInfo: nil, repeats: false)
    }
    
    func stopTimer() {
        refreshTimer.invalidate()
    }
    
    func timerDone() {
        //countDownTimer.stop()
        //countDownTimer.setHidden(true)
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
