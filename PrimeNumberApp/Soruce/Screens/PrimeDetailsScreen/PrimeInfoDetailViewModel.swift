//
//  PrimeInfoDetailView.swift
//  PrimeNumberApp
//
//  Created by Nikita Kirshin on 06.04.2023.
//

import Combine
import SwiftUI

final class PrimeInfoDetailViewModel: ObservableObject, PrimeNumbersInfoNetworkManagerProtocol {
    
    //MARK: - Private
    
    var responsePromeNumbers: String? = nil
    @Published var primeNumbers: [Int]? = []
    @Published var isLoading: Bool = true
    @Published var primeNumbersInfo: String = ""
    private var cancellables = Set<AnyCancellable>()
    var networkService: NetworkServiceProtocol = NetworkService()
        
    //MARK: - Methods
    
    func fetchPrimeNumbersAndInfo() {
        
        self.isLoading = true
        
        let primesPublisher = self.getAllPrimeNumbersInRange()
            .map { self.convertStringToIntArray($0) }
            .eraseToAnyPublisher()
        
        let primeInfoPublisher = self.getPrimeNubersInfo()
            .eraseToAnyPublisher()
        
        Publishers.Zip(primesPublisher, primeInfoPublisher)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print("Error: \(error)")
                case .finished:
                    break
                }
            }, receiveValue: { [weak self] primes, info in
                self?.primeNumbers = primes
                self?.primeNumbersInfo = info
                self?.isLoading = false
            })
            .store(in: &cancellables)
    }
    
    func convertStringToIntArray(_ string: String) -> [Int] {
        let trimmedString = string.trimmingCharacters(in: CharacterSet(charactersIn: "{}"))
        let substrings = trimmedString.split(separator: ",")
        let integers = substrings.compactMap { Int($0.trimmingCharacters(in: .whitespaces)) }
        return integers
    }
}
