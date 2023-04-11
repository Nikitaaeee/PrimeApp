//
//  AppState.swift
//  PrimeNumberApp
//
//  Created by Nikita Kirshin on 29.03.2023.
//

import Combine
import SwiftUI

final class AppState: ObservableObject {
    private var userDefaults: UserDefaultsProtocol
    
    @Published var counter: Int {
        willSet { userDefaults.counter = newValue }
    }
    
    @Published var favoritePrimes: [FavoritePrime] {
        didSet { userDefaults.favoritePrimes = favoritePrimes }
    }
    
    @Published var loggedInUser: User?
    @Published var activityFeed: [Activity] = []
    
    init() {
        self.userDefaults = UserDefaultsProvider.shared
        self.counter = userDefaults.counter
        self.favoritePrimes = userDefaults.favoritePrimes
    }
    
    func addFavoritePrime() {
        let newFavoritePrime = FavoritePrime(value: self.counter)
        self.favoritePrimes.append(newFavoritePrime)
        self.activityFeed.append(Activity(
            timestamp: Date(),
            type: .addedFavoritePrime(newFavoritePrime)))
    }
    
    func removeFavoritePrime(_ prime: FavoritePrime) {
        self.favoritePrimes.removeAll(where: { $0 == prime })
        self.activityFeed.append(Activity(
            timestamp: Date(),
            type: .removedFavoritePrime(prime)))
    }
    
    func removeFavoritePrime() {
        guard let prime = favoritePrimes.first(where: { $0.value == self.counter }) else { return }
        self.favoritePrimes.removeAll(where: { $0.value == self.counter })
        self.activityFeed.append(Activity(
            timestamp: Date(),
            type: .removedFavoritePrime(prime)))
    }
    
    func removeFavoritePrimes(at indexSet: IndexSet) {
        for index in indexSet {
            self.removeFavoritePrime(self.favoritePrimes[index])
        }
    }
}
