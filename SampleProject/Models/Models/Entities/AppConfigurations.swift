//
//  AppConfigurations.swift
//  Models
//
//  Created by Renan Germano on 09/07/21.
//

import Foundation

public class AppConfigurations {
    
    public static var shared: AppConfigurations?
    
    // This instance is used in the initialization of the app, when the request to get the configurations was not perfomed yet.
    public static var current: AppConfigurations? {
        if shared != nil {
            return shared
        }
        
        // Getting last value store in the user defaults
        if let data = UserDefaults.standard.data(forKey: "AppConfigurations"),
           let dictionary = NSKeyedUnarchiver.unarchiveObject(with: data) as? [String:Any] {
            return AppConfigurations(fromDictionary: dictionary)
        }
        
        return nil
        
    }
    
    public var sdk1Key: String?
    public var sdk2Key: String?
    // ...
    public var activateFeature1: Bool = false
    public var activateFeature2: Bool = true
    public var activateFeature3: Bool = false
    // ...
    public var screenAText: String = "Message of the screen A (example)"
    public var screenBText: String = "Message of the screen B (example)"
    // ...
    
    public init(fromDictionary dictionary: [String:Any]) {
        sdk1Key = dictionary["SDK1Key"] as? String
        sdk2Key = dictionary["SDK2Key"] as? String
        
        // flags...
        
        // texts...
        
        // Storing the value in the user defaults so the next time the app opens its configurations will be available
        let data = NSKeyedArchiver.archivedData(withRootObject: dictionary)
        UserDefaults.standard.setValue(data, forKey: "AppConfigurations")
        
        AppConfigurations.shared = self
    }
    
}
