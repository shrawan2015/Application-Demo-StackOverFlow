//
//  ViewController.swift
//  WatchOS
//
//  Created by ShrawanKumar Sharma on 25/11/16.
//  Copyright © 2016 WATCHOS.COM. All rights reserved.
//

import UIKit
import WatchConnectivity

class ViewController: UIViewController,WCSessionDelegate {
    
    @IBOutlet weak var textWord: UITextField!
    var session:WCSession?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkSupportOfSession()
    }

    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        print("session")
    }
    
    func checkSupportOfSession() {
        if( WCSession.isSupported() ) {
            self.session = WCSession.default()
            self.session?.delegate = self
            self.session?.activate()
        }
    }
    
    
    
    @available(iOS 9.3, *)
    public func sessionDidBecomeInactive(_ session: WCSession)
    {
        print("sessionS 2")
    }
    
    @available(iOS 9.3, *)
    public func sessionDidDeactivate(_ session: WCSession){
        
    }
    
    @IBAction func sendTextToWatch(_ sender: Any) {
        print("send text to watch amount")
         if let textName = textWord.text {
            session?.sendMessage(["textIndex" : textName as String], replyHandler: nil, errorHandler: nil)
        }

    }
    
   

}
