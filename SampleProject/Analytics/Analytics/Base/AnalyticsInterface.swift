//
//  AnalyticsInterface.swift
//  Analytics
//
//  Created by Renan Germano on 09/07/21.
//

import Foundation

protocol AnalyticsInterface {
    
    func logEvent(event: Event, parameters: [Key:Any])
    
}
