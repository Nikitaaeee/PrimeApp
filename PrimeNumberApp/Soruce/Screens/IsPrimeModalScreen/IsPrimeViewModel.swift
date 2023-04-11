//
//  IsPrimeViewModel.swift
//  PrimeNumberApp
//
//  Created by Nikita Kirshin on 06.04.2023.
//

import Combine
import SwiftUI

final class IsPrimeModalViewModel: ObservableObject {
    
    //MARK: - Properties
    
    @Published var state: AppState
    private let isPrimeNumberChecker = IsPrimeNumberChecker.self

    //MARK: - Lifecycle
    
    init(state: AppState) {
        self.state = state
    }
    
    //MARK: - Methods
    
    var isCurrentNumberPrime: Bool {
        isPrimeNumberChecker.isPrime(state.counter)
    }

    func addToFavoritePrimes() {
        state.addFavoritePrime()
    }

    func removeFromFavoritePrimes() {
        state.removeFavoritePrime()
    }
}
