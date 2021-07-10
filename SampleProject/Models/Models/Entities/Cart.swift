//
//  Cart.swift
//  Models
//
//  Created by Renan Germano on 09/07/21.
//

import Foundation

public class Cart {
    
    public static var shared: Cart?
    
    // Cart properties...
    
    private init(fromDictionary dictionary: [String:Any]) {
        // Use the dictionary to get the values for the properties of the cart
    }
    
    public static func create(fromDictionary dictionary: [String:Any]) {
        Cart.shared = Cart(fromDictionary: dictionary)
    }
    
}
