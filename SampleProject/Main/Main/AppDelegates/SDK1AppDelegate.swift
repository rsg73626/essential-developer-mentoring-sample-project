//
//  SDK1AppDelegate.swift
//  Main
//
//  Created by Renan Germano on 09/07/21.
//

import UIKit

import Models

// Import SDK1

class SDK1AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]?) -> Bool {
        
        if let key = AppConfigurations.current?.sdk1Key {
            print(key)
            // Initialize SDK1
        }
        
        return true
    }
    
}
