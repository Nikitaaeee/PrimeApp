//
//  FavoritePrimesView.swift
//  PrimeNumberApp
//
//  Created by Nikita Kirshin on 04.04.2023.
//

import SwiftUI

struct FavoritePrimesView: View {
    
    //MARK: - Properties
    
    @ObservedObject var viewModel: FavoritePrimesViewModel
    
    //MARK: - Body
    
    var body: some View {
        List {
            ForEach(self.viewModel.state.favoritePrimes) { prime in
                Text("\(prime.value)")
            }
            .onDelete(perform: { indexSet in
                self.viewModel.removeFavoritePrime(at: indexSet)
            })
        }
        .navigationBarTitle(Text(Constants.viewTitle))
    }
}

//MARK: - Constants

private extension FavoritePrimesView {
    enum Constants {
        static let viewTitle: LocalizedStringKey = "favoritePrimesView.favoritePrimes"
    }
}

