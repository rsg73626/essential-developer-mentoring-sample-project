//
//  ConfigurationAPI.swift
//  Service
//
//  Created by Renan Germano on 09/07/21.
//

import Foundation

import Models

public class ConfigurationAPI: HTTPBase {
    
    private let appConfiguration = "/appconfigurations"
    private let appColors = "/appcolors"
    
    public override init() {
        super.init()
    }
    
    public func getConfiguration(onSuccess: @escaping ()->Void, onError: @escaping (SystemMessage)->Void) {
        let request = newRequest(path: appConfiguration, method: .get, headers: [:], parameters: [:])
        executeRequest(request,
                       onSuccess: { dictionary in
                        _ = AppConfigurations.init(fromDictionary: dictionary as! [String : Any])
                       }, onError: { error in
                        onError(SystemMessage())
                       })
    }
    
    public func getColors(onSuccess: @escaping ()->Void, onError: @escaping (SystemMessage)->Void) {
        
        // ...
        
    }
    
    public func getHome(onSuccess: @escaping ()->Void, onError: @escaping ()->()) {
        // Mock
        Timer.scheduledTimer(withTimeInterval: 2, repeats: false, block: {
            $0.invalidate()
            Home.create(fromDictionary: [:])
            onSuccess()
        })
    }
    
}
