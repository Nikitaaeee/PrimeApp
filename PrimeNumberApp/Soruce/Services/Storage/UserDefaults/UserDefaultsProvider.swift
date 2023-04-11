//
//  UserDefaultsProvider.swift
//  PrimeNumberApp
//
//  Created by Nikita Kirshin on 29.03.2023.
//

import Foundation

protocol UserDefaultsProtocol: AnyObject {
    var counter: Int { get set }
    var favoritePrimes: [FavoritePrime] { get set }
}

final class UserDefaultsProvider: UserDefaultsProtocol {
    private let counterStore = UserDefaultsStore<Int>(key: Keys.counter.rawValue, defaultValue: 0)
    private let favoritePrimesStore = UserDefaultsStore<[FavoritePrime]>(key: Keys.favoritePrimes.rawValue, defaultValue: [])
    
    var counter: Int {
        get { counterStore.value }
        set { counterStore.value = newValue }
    }
    
    var favoritePrimes: [FavoritePrime] {
        get { return favoritePrimesStore.value }
        set { favoritePrimesStore.value = newValue }
    }
    
    static let shared: UserDefaultsProtocol = UserDefaultsProvider()
}

private extension UserDefaultsProvider {
    enum Keys: String {
        case counter
        case favoritePrimes
    }
}
