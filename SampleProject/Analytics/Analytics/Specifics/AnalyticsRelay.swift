//
//  AnalyticsRelay.swift
//  Analytics
//
//  Created by Renan Germano on 09/07/21.
//

import Foundation

public class AnalyticsRelay: AnalyticsInterface {
    
    public static let shared = AnalyticsRelay()
    
    private var analytics = [AnalyticsInterface]()
    
    private init() {
        analytics.append(FirebaseAnalytics())
        analytics.append(FacebookAnalytics())
    }
    
    func logEvent(event: Event, parameters: [Key : Any]) {
        analytics.forEach { $0.logEvent(event: event, parameters: parameters) }
    }
    
    public func didSeeScreen(withName name: String) {
        logEvent(event: .didSeeScreen, parameters: [.name: name])
    }
    
    public func didAddProductToCart(productName: String, productPrice: Double) {
        logEvent(event: .didAddProductToCart, parameters: [.product: productName, .price: productPrice])
    }
    
}
