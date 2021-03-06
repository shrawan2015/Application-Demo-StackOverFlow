//
//  ViewController.swift
//  WatchKitDemo2
//
//  Created by ShrawanKumar Sharma on 28/11/16.
//  Copyright © 2016 WATCHOS.COM. All rights reserved.
//

import UIKit
import WatchConnectivity


class ViewController: UIViewController,WCSessionDelegate {

    @IBOutlet weak var updateLabel: UILabel!
    
    var session:WCSession?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        checkStatus()
        updateSavedState()
    }
    
    func checkStatus() {
        print("check status")
        if WCSession.isSupported() {
            session = WCSession.default()
            session?.delegate = self
            session?.activate()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    public func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
         /** Called when the session has completed activation. If session state is WCSessionActivationStateNotActivated there will be an error with more details. */
    }

     func sessionDidBecomeInactive(_ session: WCSession){
        
        /** ------------------------- iOS App State For Watch ------------------------ */
        
        /** Called when the session can no longer be used to modify or add any new transfers and, all interactive messages will be cancelled, but delegate callbacks for background transfers can still occur. This will happen when the selected watch is being changed. */

    }

     func sessionDidDeactivate(_ session: WCSession){
        /** Called when all delegate callbacks for the previously selected watch has occurred. The session can be re-activated for the now selected watch using activateSession. */

    }
    
    
    func session(_ session: WCSession, didReceiveApplicationContext applicationContext: [String : Any]) {
        let type = applicationContext["watchType"]!
         DispatchQueue.main.async {
            self.updateLabel.text =  " Type: \(type)"
            UserDefaults.standard.set(type, forKey: "savedState") //setObject
        }
    }
    
    func updateSavedState() {
        self.updateLabel.text = UserDefaults.standard.string(forKey: "savedState")
        
    }
    
   }

extension Integer {
    
    func toCheck() {
        
    }
    
    
}

