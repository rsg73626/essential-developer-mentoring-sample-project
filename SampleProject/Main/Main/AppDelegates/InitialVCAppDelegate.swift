//
//  InitialVCAppDelegate.swift
//  Main
//
//  Created by Renan Germano on 09/07/21.
//

import UIKit

import UI

class InitialVCAppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        if #available(iOS 13.0, *) {
            return true
        } else {
            let initialViewController = InitialViewController()
            let navigationController = UINavigationController(rootViewController: initialViewController)
            navigationController.navigationBar.isTranslucent = false
            navigationController.navigationBar.backgroundColor = .white
            
            if let appDelegate = application.delegate as? AppDelegate {
                appDelegate.window = UIWindow(frame: UIScreen.main.bounds)
                appDelegate.window?.rootViewController = navigationController
                appDelegate.window?.makeKeyAndVisible()
            }
        }
        
        return true
        
    }
    
}
