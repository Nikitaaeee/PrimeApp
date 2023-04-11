//
//  WolframEndpoint.swift
//  PrimeNumberApp
//
//  Created by Nikita Kirshin on 30.03.2023.
//

import Foundation

enum WolframEndpoint {
    static let wolframAlphaApiKey = "XXXXXX-XXXXXX" // TODO: Replace with your Wolfram Alpha API key
    
    case isPrimeCheck(query: String)
    case getPrimeNumbers
    case getInfo
}

extension WolframEndpoint: RequestBuilder {
    private var baseComponents: URLComponents {
        let components = URLComponents(string: "https://api.wolframalpha.com")!
        return components
    }
    
    private var commonQueryItems: [URLQueryItem] {
        return [
            URLQueryItem(name: "appid", value: WolframEndpoint.wolframAlphaApiKey)
        ]
    }
    
    var urlRequest: URLRequest {
        var components = baseComponents
        
        switch self {
        case .isPrimeCheck(let query):
            components.path = "/v2/query"
            let queryItems = [
                URLQueryItem(name: "input", value: query),
                URLQueryItem(name: "format", value: "plaintext"),
                URLQueryItem(name: "output", value: "JSON")
            ] + commonQueryItems
            components.queryItems = queryItems
            
        case .getPrimeNumbers:
            components.path = "/v1/result"
            let query = "list+of+first+twenty+prime+numbers"
            let queryItems = [
                URLQueryItem(name: "i", value: query)
            ] + commonQueryItems
            components.queryItems = queryItems
            
        case .getInfo:
            components.path = "/v1/result"
            let query = "what+is+prime+number"
            let queryItems = [
                URLQueryItem(name: "i", value: query)
            ] + commonQueryItems
            components.queryItems = queryItems
        }
        
        guard let url = components.url else {
            preconditionFailure("Invalid URL format")
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        return request
    }
}
