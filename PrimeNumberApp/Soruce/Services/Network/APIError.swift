//
//  APIError.swift
//  PrimeNumberApp
//
//  Created by Nikita Kirshin on 30.03.2023.
//

import Foundation

enum APIError: Error {
    case decodingError
    case httpError(Int)
    case unknown
    case invalidURL
    case invalidResponse
    case networkError(any Error)
}
