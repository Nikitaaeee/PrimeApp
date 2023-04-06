//
//  PrimeNumberAppApp.swift
//  PrimeNumberApp
//
//  Created by Nikita Kirshin on 29.03.2023.
//

import SwiftUI

@main
struct PrimeNumberAppApp: App {
    
    //MARK: - Properties
    
    @ObservedObject var state = AppState()
    
    //MARK: - Body
    
    var body: some Scene {
        WindowGroup {
            MenuView(viewModel: MenuViewModel(state: state))
        }
    }
}
