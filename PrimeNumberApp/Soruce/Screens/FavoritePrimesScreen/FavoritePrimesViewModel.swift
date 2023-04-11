//
//  FavoritePrimesViewModel.swift
//  PrimeNumberApp
//
//  Created by Nikita Kirshin on 05.04.2023.
//

import Combine
import SwiftUI

final class FavoritePrimesViewModel: ObservableObject {
    
    //MARK: - Properties
    
    @Published var state: FavoritePrimesState
    
    //MARK: - Lifecycle
    
    init(state: FavoritePrimesState) {
        self.state = state
    }
    
    func removeFavoritePrime(at indexSet: IndexSet) {
        for index in indexSet {
            self.state.favoritePrimes.remove(at: index)
        }
    }
}
 
