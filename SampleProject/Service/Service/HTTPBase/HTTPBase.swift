//
//  HTTPBase.swift
//  Service
//
//  Created by Renan Germano on 09/07/21.
//

import Foundation

import Models

public class HTTPBase {
    
    var apiURL: URL {
        Info.apiURL
    }
    
    func newRequest(path: String, method: Method, headers: [String:String], parameters: [String:String]) -> URLRequest {
        var url = apiURL.appendingPathComponent(path)
        
        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true)
        var items = urlComponents?.queryItems ?? []
        items += parameters.map(URLQueryItem.init)
        urlComponents?.queryItems = items
        
        url = urlComponents?.url ?? url
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        headers.forEach { request.setValue($1, forHTTPHeaderField: $0) }
        
        return request
    }
    
    @discardableResult
    func executeRequest(_ request: URLRequest,
                        concurrent: Bool = false,
                        onSuccess: @escaping (NSDictionary)->Void,
                        onError: @escaping (NSDictionary)->Void) -> URLSessionDataTask {
        let dataTask = URLSession.shared.dataTask(with: request) { data, response, error in
            let queue = concurrent ? DispatchQueue(label: "com.sample.service", attributes: .concurrent) : .main
            
            if let error = error as NSError?,
               error.code == -999 {
                queue.async {
                    onError(["Code": -999, "Message": "Cancelled"])
                }
                return
            }
            
            if let data = data {
                let httpResponse = response as! HTTPURLResponse
                do {
                    let raw = try JSONSerialization.jsonObject(with: data,
                                                               options: [.mutableContainers, .allowFragments])
                    
                    let dictionary: NSDictionary
                    
                    if raw is NSDictionary {
                        dictionary = raw as! NSDictionary
                    } else if raw is NSArray {
                        dictionary = ["Array":raw as! NSArray] as NSDictionary
                    } else {
                        dictionary = ["Any":raw] as NSDictionary
                    }
                    
                    if [400, 401, 500].contains(httpResponse.statusCode) || httpResponse.statusCode > 500 {
                        queue.async {
                            let mutableDictionary = NSMutableDictionary(dictionary: dictionary)
                            mutableDictionary["StatusCode"] = httpResponse.statusCode
                            onError(mutableDictionary)
                        }
                    }
                    
                    queue.async {
                        onSuccess(dictionary)
                    }
                } catch {
                    queue.async {
                        if data.count > .zero {
                            onSuccess(NSDictionary())
                        } else {
                            onError(NSDictionary())
                        }
                    }
                }
            }
        }
        
        dataTask.resume()
        
        return dataTask
    }
    
}

enum Method: String {
    case get = "GET"
    case post = "POST"
}
