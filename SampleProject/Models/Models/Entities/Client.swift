//
//  Client.swift
//  Models
//
//  Created by Renan Germano on 09/07/21.
//

import Foundation

public class Client {
    
    public static var shared: Client?
    
    // Client properties...
    
    private init(fromDictionary dictionary: [String:Any]) {
        // Use the dictionary to get the values for the properties of the client
    }
    
    public static func create(fromDictionary dictionary: [String:Any]) {
        Client.shared = Client(fromDictionary: dictionary)
    }
    
}
