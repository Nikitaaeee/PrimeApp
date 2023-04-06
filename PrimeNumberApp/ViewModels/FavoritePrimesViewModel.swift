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
    
    @Published var state: AppState
    
    //MARK: - Lifecycle
    
    init(state: AppState) {
        self.state = state
    }
}
 
