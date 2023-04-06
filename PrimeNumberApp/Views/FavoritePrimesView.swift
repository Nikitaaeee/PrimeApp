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
    
    var body: some View {
        List {
            ForEach(self.viewModel.state.favoritePrimes) { prime in
                Text("\(prime.value)")
            }
            .onDelete(perform: { indexSet in
                for index in indexSet {
                    self.viewModel.state.favoritePrimes.remove(at: index)
                }
            })
        }
        .navigationBarTitle(Text(Constants.viewTitle))
    }
}

private extension FavoritePrimesView {
    enum Constants {
        static let viewTitle: LocalizedStringKey = "favoritePrimesView.favoritePrimes"
    }
}

