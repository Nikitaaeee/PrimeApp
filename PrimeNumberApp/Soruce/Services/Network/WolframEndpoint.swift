//
//  WolframEndpoint.swift
//  PrimeNumberApp
//
//  Created by Nikita Kirshin on 30.03.2023.
//

import Foundation

enum WolframEndpoint {
    case isPrimeCheck(query: String)
    case getPrimeNumbers
    case getInfo
    
    var wolframAlphaApiKey: String {
        return "XXXXXX-XXXXXXXXXX" // TODO: Replace with your Wolfram Alpha API key
    }
}

extension WolframEndpoint: RequestBuilder {
    var urlRequest: URLRequest {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.wolframalpha.com"
        
        switch self {
        case .isPrimeCheck(let query):
            components.path = "/v2/query"
            let queryItems = [
                URLQueryItem(name: "input", value: query),
                URLQueryItem(name: "format", value: "plaintext"),
                URLQueryItem(name: "output", value: "JSON"),
                URLQueryItem(name: "appid", value: wolframAlphaApiKey)
            ]
            components.queryItems = queryItems
            
        case .getPrimeNumbers:
            components.path = "/v1/result"
            let query = "list+of+first+twenty+prime+numbers"
            let queryItems = [
                URLQueryItem(name: "i", value: query),
                URLQueryItem(name: "appid", value: wolframAlphaApiKey)
            ]
            components.queryItems = queryItems
            
        case .getInfo:
            components.path = "/v1/result"
            let query = "what+is+prime+number"
            let queryItems = [
                URLQueryItem(name: "i", value: query),
                URLQueryItem(name: "appid", value: wolframAlphaApiKey)
            ]
            components.queryItems = queryItems
        }
        
        guard let url = components.url else {
            preconditionFailure("Invalid URL format")
        }
        
        var request = URLRequest(url: url)
        print(url)
        request.httpMethod = "GET"
        
        return request
    }
}
