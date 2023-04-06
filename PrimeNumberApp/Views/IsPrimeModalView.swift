//
//  IsPrimeModalView.swift
//  PrimeNumberApp
//
//  Created by Nikita Kirshin on 29.03.2023.
//

import Combine
import SwiftUI

struct IsPrimeModalView: View {
    @ObservedObject var viewModel: IsPrimeModalViewModel
    
    var body: some View {
        VStack {
            if viewModel.isCurrentNumberPrime {
                Text(LocalizedStringKey(String(format: NSLocalizedString(Constants.isPrimeKey, comment: ""),
                                               viewModel.state.counter)))
                .font(.title2)
                .padding(20)
                
                if viewModel.state.favoritePrimes.contains(where: { $0.value == viewModel.state.counter }) {
                    Button(Constants.removeLabel) {
                        viewModel.removeFromFavoritePrimes()
                    }
                } else {
                    Button(Constants.addLabel) {
                        viewModel.addToFavoritePrimes()
                    }
                }
            } else {
                Text(LocalizedStringKey(String(format: NSLocalizedString(Constants.notPrimeKey, comment: ""),
                                               viewModel.state.counter)))
                .font(.title2)
                .padding(20)
            }
        }
    }
}

private extension IsPrimeModalView {
    enum Constants {
        static let removeLabel: LocalizedStringKey = "Remove from Favorite Primes"
        static let addLabel: LocalizedStringKey = "Add to Favorite Primes"
        static let isPrimeKey: String = "isPrimeModalView.isPrime"
        static let notPrimeKey: String = "isPrimeModalView.notPrime"
    }
}
