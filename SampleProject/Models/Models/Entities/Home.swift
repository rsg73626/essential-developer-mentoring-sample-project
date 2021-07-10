//
//  Home.swift
//  Models
//
//  Created by Renan Germano on 09/07/21.
//

import Foundation

public class Home {
    
    public static var shared: Home!
    
    public var elements: [HomeElement] = []
    
    private init(elements: [HomeElement]) {
        self.elements = elements
    }
    
    public static func create(fromDictionary dictionary: [String:Any]) {
        // The original implementation uses the dictionary to build the Home object
        Home.shared = Home(elements: [HomeElement(), HomeElement(), HomeElement()])
    }
    
}
