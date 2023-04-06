//
//  AppState.swift
//  PrimeNumberApp
//
//  Created by Nikita Kirshin on 29.03.2023.
//

import Combine

class AppState: ObservableObject {
    private var userDefaults: UserDefaultsProtocol
    
    @Published var counter: Int {
        willSet { userDefaults.counter = newValue }
    }
    
    @Published var favoritePrimes: [FavoritePrimes] {
        willSet {
            userDefaults.favoritePrimes = newValue
        }
    }
    
    init() {
        self.userDefaults = UserDefaultsProvider.shared
        self.counter = userDefaults.counter
        self.favoritePrimes = userDefaults.favoritePrimes
    }
}
