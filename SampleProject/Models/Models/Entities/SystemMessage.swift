//
//  SystemMessage.swift
//  Models
//
//  Created by Renan Germano on 09/07/21.
//

import Foundation

public class SystemMessage {
    
    public enum Status {
        case error
        case info
        case warning
    }
    
    public var message: String
    public var status: Status
    
    public init(message: String = "Something went wrong, please try again later",
                status: Status = .error) {
        self.message = message
        self.status = status
    }
    
    
}
