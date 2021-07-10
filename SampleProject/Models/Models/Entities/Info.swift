//
//  Info.swift
//  Models
//
//  Created by Renan Germano on 09/07/21.
//

import Foundation

// A component to retrieve values from the Info.plist
public struct Info {
    
    static func value(forKey key: String) -> Any? {
        Bundle.main.object(forInfoDictionaryKey: key)
    }
    
    public static var apiURL: URL {
        if let api = Info.value(forKey: "API") as? String,
           let url = URL(string: api) {
            return url
        }
        fatalError("Couldn't find api URL")
    }
    
}
