//
//  FavoritePrimesViewModel.swift
//  PrimeNumberApp
//
//  Created by Nikita Kirshin on 05.04.2023.
//

import Combine
import SwiftUI

final class FavoritePrimesViewModel: ObservableObject {
    
    @Published var state: AppState
    
    init(state: AppState) {
        self.state = state
    }
}
 
