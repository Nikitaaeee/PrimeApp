//
//  FindPrimeNumberManagerProtocol.swift
//  PrimeNumberApp
//
//  Created by Nikita Kirshin on 04.04.2023.
//

import Combine

protocol FindPrimeNumberManagerProtocol {
    var networkService: NetworkServiceProtocol { get }
    func findClosestPrime(to n: Int) -> AnyPublisher<WolframAlphaResult, APIError>
}


extension FindPrimeNumberManagerProtocol {
    func findClosestPrime(to n: Int) -> AnyPublisher<WolframAlphaResult, APIError> {
        return networkService.request(with: WolframEndpoint.isPrimeCheck(query: "prime \(n)"))
            .eraseToAnyPublisher()
    }
}
