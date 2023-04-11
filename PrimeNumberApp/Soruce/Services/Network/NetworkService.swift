//
//  NetworkService.swift
//  PrimeNumberApp
//
//  Created by Nikita Kirshin on 30.03.2023.
//

import Foundation
import Combine

protocol NetworkServiceProtocol {
    func request<T: Decodable>(with builder: RequestBuilder) -> AnyPublisher<T, APIError>
    func requestString(with builder: RequestBuilder) -> AnyPublisher<String, APIError>
}

struct NetworkService: NetworkServiceProtocol {
    
    //MARK: - Generic Request
    
    func request<T>(with builder: RequestBuilder) -> AnyPublisher<T, APIError> where T: Decodable {
        let decoder = JSONDecoder()
        return URLSession.shared
            .dataTaskPublisher(for: builder.urlRequest)
            .receive(on: DispatchQueue.main)
            .mapError { _ in .unknown }
            .flatMap { data, response -> AnyPublisher<T, APIError> in
                if let response = response as? HTTPURLResponse {
                    if (200...299).contains(response.statusCode) {
                        return Just(data)
                            .decode(type: T.self, decoder: decoder)
                            .mapError {_ in .decodingError}
                            .eraseToAnyPublisher()
                    } else {
                        
                        return Fail(error: APIError.httpError(response.statusCode))
                            .eraseToAnyPublisher()
                    }
                }
                return Fail(error: APIError.unknown)
                    .eraseToAnyPublisher()
            }
            .eraseToAnyPublisher()
    }
    
    func requestString(with builder: RequestBuilder) -> AnyPublisher<String, APIError> {
        return URLSession.shared
            .dataTaskPublisher(for: builder.urlRequest)
            .tryMap { data, response in
                if let response = response as? HTTPURLResponse {
                    if (200...299).contains(response.statusCode) {
                        if let stringData = String(data: data, encoding: .utf8) {
                            return stringData
                        } else {
                            throw APIError.decodingError
                        }
                    } else {
                        throw APIError.httpError(response.statusCode)
                    }
                } else {
                    throw APIError.unknown
                }
            }
            .mapError { error in
                if let apiError = error as? APIError {
                    return apiError
                } else {
                    return APIError.unknown
                }
            }
            .eraseToAnyPublisher()
    }
}
