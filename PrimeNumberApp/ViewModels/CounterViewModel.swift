//
//  CounterViewModel.swift
//  PrimeNumberApp
//
//  Created by Nikita Kirshin on 04.04.2023.
//

import Combine
import SwiftUI

class CounterViewModel: ObservableObject, WolframNetworkManagerProtocol {
    
    //MARK: - Properties
    
    @Published var state: AppState
    @Published var isPrimeModalShown: Bool = false
//    @Published var primeNumber: Int?
    
    //MARK: - Delete If Wrong
    @Published var primeNumber: Int? = nil {
        didSet {
            showPrimeNumberAlert = primeNumber != nil
        }
    }
    @Published var showPrimeNumberAlert: Bool = false

    private var cancellables = Set<AnyCancellable>()
    let networkService: NetworkServiceProtocol = NetworkService()
    let pluralizer = NumberPluralizer.self
    
    init(state: AppState) {
        self.state = state
    }
    
    //MARK: - Methods
    
    func decrementCounter() {
        self.state.counter -= 1
    }
    
    func incrementCounter() {
        self.state.counter += 1
    }
    
    func togglePrimeModal() {
        self.isPrimeModalShown.toggle()
    }
    
    func isNumberPrime() -> String {
        return pluralizer.ordinalSuffix(for: self.state.counter)
    }
    
    func findClosestPrimeNumber(to n: Int) {
        let cancellable = self.findClosestPrime(to: n)
            .sink { completion in
                
            } receiveValue: { [weak self] model in
                let resultPod = model.queryresult.pods.first { $0.primary == true }
                let primeNumberText = resultPod?.subpods.first?.plaintext ?? ""
                self?.primeNumber = Int(primeNumberText)
            }
        cancellables.insert(cancellable)
    }
}
