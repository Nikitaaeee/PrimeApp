//
//  WolframNetworkManagerProtocol.swift
//  PrimeNumberApp
//
//  Created by Nikita Kirshin on 04.04.2023.
//

import Combine

//CHECK PRIME

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

// ALL PRIMES

protocol PrimeNumbersInfoNetworkManagerProtocol {
    var networkService: NetworkServiceProtocol { get }
    func getAllPrimeNumbersInRange() -> AnyPublisher<String, APIError>
    func getPrimeNubersInfo() -> AnyPublisher<String, APIError>
}

extension PrimeNumbersInfoNetworkManagerProtocol {
    func getAllPrimeNumbersInRange() -> AnyPublisher<String, APIError> {
        return networkService.requestString(with: WolframEndpoint.getPrimeNumbers)
            .eraseToAnyPublisher()
    }
    
    func getPrimeNubersInfo() -> AnyPublisher<String, APIError> {
        return networkService.requestString(with: WolframEndpoint.getInfo)
    }
}
