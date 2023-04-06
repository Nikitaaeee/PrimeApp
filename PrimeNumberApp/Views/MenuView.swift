//
//  ContentView.swift
//  PrimeNumberApp
//
//  Created by Nikita Kirshin on 29.03.2023.

import SwiftUI

struct MenuView: View {
    
    //MARK: - Properties
    
    @ObservedObject var viewModel: MenuViewModel

    //MARK: - Body
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: CounterView(viewModel: CounterViewModel(state: self.viewModel.state))) {
                    Text(Constants.counterTitle)
                }
                NavigationLink(destination: FavoritePrimesView(viewModel: FavoritePrimesViewModel(state: self.viewModel.state))) {
                    Text(Constants.faviriteTitle)
                }
            }
            .navigationBarTitle(Constants.selfNavTitle)
        }
    }
}

//MARK: - Constants

private extension MenuView {
    enum Constants {
        static let counterTitle: String = "Counter demo"
        static let faviriteTitle: String = "Favorite primes"
        static let selfNavTitle: String = "State management"
    }
}

//MARK: - Previews

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView(viewModel: MenuViewModel(state: AppState()))
    }
}
