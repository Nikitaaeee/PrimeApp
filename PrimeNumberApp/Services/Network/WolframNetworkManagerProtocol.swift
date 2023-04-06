//
//  WolframNetworkManagerProtocol.swift
//  PrimeNumberApp
//
//  Created by Nikita Kirshin on 04.04.2023.
//

import Combine

protocol WolframNetworkManagerProtocol {
    var networkService: NetworkServiceProtocol { get }
    func findClosestPrime(to n: Int) -> AnyPublisher<WolframAlphaResult, APIError>
}

//MARK: - Default Implementation

extension WolframNetworkManagerProtocol {
    func findClosestPrime(to n: Int) -> AnyPublisher<WolframAlphaResult, APIError> {
        return networkService.request(with: WolframEndpoint.isPrimeCheck(query: "prime \(n)"))
            .eraseToAnyPublisher()
    }
}
