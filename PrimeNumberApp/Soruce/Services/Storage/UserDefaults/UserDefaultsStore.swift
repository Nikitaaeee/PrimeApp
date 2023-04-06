//
//  UserDefaultsStore.swift
//  PrimeNumberApp
//
//  Created by Nikita Kirshin on 05.04.2023.
//

import Foundation

final class UserDefaultsStore<T: Codable> {
    private let key: String
    private let defaultValue: T
    
    init(key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }
    
    var value: T {
        get {
            guard let data = UserDefaults.standard.data(forKey: key) else { return defaultValue }
            let decoder = JSONDecoder()
            return (try? decoder.decode(T.self, from: data)) ?? defaultValue
        }
        set {
            let encoder = JSONEncoder()
            let data = try? encoder.encode(newValue)
            UserDefaults.standard.set(data, forKey: key)
        }
    }
}
