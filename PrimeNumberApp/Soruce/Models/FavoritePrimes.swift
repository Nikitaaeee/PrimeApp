//
//  FavoritePrimes.swift
//  PrimeNumberApp
//
//  Created by Nikita Kirshin on 04.04.2023.
//

import Foundation

struct FavoritePrimes: Identifiable, Codable {
    let id = UUID()
    let value: Int
}
