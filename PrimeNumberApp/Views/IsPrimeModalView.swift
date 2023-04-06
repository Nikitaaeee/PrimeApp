//
//  IsPrimeModalView.swift
//  PrimeNumberApp
//
//  Created by Nikita Kirshin on 29.03.2023.
//

import Combine
import SwiftUI

struct IsPrimeModalView: View {
    private let isPrimeNumberChecker = IsPrimeNumberChecker.self
    @ObservedObject var state: AppState
    
    var body: some View {
        VStack {
            if isPrimeNumberChecker.isPrime(state.counter) {
                Text("\(state.counter) is prime 👍🏻")
                    .font(.title2)
                    .padding(20)
                if state.favoritePrimes.contains(where: { $0.value == state.counter }) {
                    Button("Remove from Favorite Primes") {
                        state.favoritePrimes.removeAll(where: { $0.value == state.counter })
                    }
                } else {
                    Button("Add to Favorite Primes") {
                        state.favoritePrimes.append(FavoritePrimes(value: state.counter))
                    }
                }
            } else {
                Text("\(state.counter) is not prime 🙅🏼‍♀️")
            }
        }
    }
}
