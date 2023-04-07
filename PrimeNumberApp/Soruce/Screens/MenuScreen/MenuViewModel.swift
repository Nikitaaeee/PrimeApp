//
//  ListViewModel.swift
//  PrimeNumberApp
//
//  Created by Nikita Kirshin on 04.04.2023.
//

import SwiftUI

final class MenuViewModel: ObservableObject {
    
    //MARK: - Properties
    
    @Published var state: AppState
    
    //MARK: - Lifecycle
    
    init(state: AppState) {
        self.state = state
    }
}
