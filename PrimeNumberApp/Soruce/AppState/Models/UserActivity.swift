//
//  UserActivity.swift
//  PrimeNumberApp
//
//  Created by Nikita Kirshin on 11.04.2023.
//

import Foundation

struct User {
    let id: Int
    let name: String
    let bio: String
}

struct Activity {
    let timestamp: Date
    let type: ActivityType
    
    enum ActivityType {
        case addedFavoritePrime(FavoritePrime)
        case removedFavoritePrime(FavoritePrime)
    }
}
