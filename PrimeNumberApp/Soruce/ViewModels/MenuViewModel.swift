//
//  ListViewModel.swift
//  PrimeNumberApp
//
//  Created by Nikita Kirshin on 04.04.2023.
//

import SwiftUI

final class MenuViewModel: ObservableObject {
    @Published var state: AppState
    
    init(state: AppState) {
        self.state = state
    }
}
