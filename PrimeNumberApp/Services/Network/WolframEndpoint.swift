//
//  WolframEndpoint.swift
//  PrimeNumberApp
//
//  Created by Nikita Kirshin on 30.03.2023.
//

import Foundation

enum WolframEndpoint {
    case isPrimeCheck(query: String)
    
    var wolframAlphaApiKey: String {
        return "AYAAX2-R3X5UEL263" // TODO: Replace with your Wolfram Alpha API key
    }
}

extension WolframEndpoint: RequestBuilder {
    var urlRequest: URLRequest {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.wolframalpha.com"
        components.path = "/v2/query"
        
        switch self {
        case .isPrimeCheck(let query):
            let queryItems = [
                URLQueryItem(name: "input", value: query),
                URLQueryItem(name: "format", value: "plaintext"),
                URLQueryItem(name: "output", value: "JSON"),
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
