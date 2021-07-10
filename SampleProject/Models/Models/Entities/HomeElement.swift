//
//  HomeElement.swift
//  Models
//
//  Created by Renan Germano on 09/07/21.
//

import Foundation

/// A type that represents the different UI components that can be appear in the HomeView.
public class HomeElement {
    
    public var type: HomeElementType
    public var element: Any // It is generic because depending on the type the elment is a different type of object
    
    public init(type: HomeElementType = .productsList,
                element: Any = Search(fromDictionary: [:])) {
        self.type = type
        self.element = element
    }
    
}
