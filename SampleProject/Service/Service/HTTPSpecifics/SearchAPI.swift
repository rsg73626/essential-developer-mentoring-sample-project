//
//  SearchAPI.swift
//  Service
//
//  Created by Renan Germano on 09/07/21.
//

import Foundation

import Models

public class SearchAPI: HTTPBase {
    
    public override init() {
        super.init()
    }
    
    public func search(usingSearch search: Search, onSuccess: @escaping ([SearchProduct])->Void, onError: @escaping ()->Void) {
        // Mock
        Timer.scheduledTimer(withTimeInterval: 2, repeats: false, block: {
            $0.invalidate()
            onSuccess(Array(repeating: SearchProduct(fromDictionary: [:]), count: 10))
        })
    }
    
}
