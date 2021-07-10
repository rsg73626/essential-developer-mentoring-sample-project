//
//  SDK2AppDelegate.swift
//  Main
//
//  Created by Renan Germano on 09/07/21.
//

import UIKit

import Models

// Import SDK2

class SDK2AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]?) -> Bool {
        
        if let key = AppConfigurations.current?.sdk2Key {
            print(key)
            // Initialize SDK2
        }
        
        return true
    }
    
}
