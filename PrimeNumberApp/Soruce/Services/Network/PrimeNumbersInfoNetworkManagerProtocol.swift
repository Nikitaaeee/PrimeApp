//
//  PrimeNumbersInfoNetworkManagerProtocol.swift
//  PrimeNumberApp
//
//  Created by Nikita Kirshin on 07.04.2023.
//

import Combine

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
            .eraseToAnyPublisher()
    }
}
