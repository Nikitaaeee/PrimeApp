//
//  FavoritePrimesState.swift
//  PrimeNumberApp
//
//  Created by Nikita Kirshin on 11.04.2023.
//

import Combine
import SwiftUI

final class FavoritePrimesState: ObservableObject {
    
    //MARK: - Properties
    
    @Published private var state: AppState
    
    //MARK: - Lifecycle
    
    init(state: AppState) {
        self.state = state
    }
    
    //MARK: - ComposedStates
    
    var favoritePrimes: [FavoritePrime] {
        get { self.state.favoritePrimes }
        set { self.state.favoritePrimes = newValue }
    }
    
    var activityFeed: [Activity] {
        get { self.state.activityFeed }
        set { self.state.activityFeed = newValue }
    }
}
