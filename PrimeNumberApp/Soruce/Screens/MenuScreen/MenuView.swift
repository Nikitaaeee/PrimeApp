//
//  ContentView.swift
//  PrimeNumberApp
//
//  Created by Nikita Kirshin on 29.03.2023.

import SwiftUI

struct MenuView: View {
    
    //MARK: - Properties
    
    @ObservedObject var viewModel: MenuViewModel
    @State private var isInfoViewPresented: Bool = false
    
    //MARK: - Body
    
    var body: some View {
            NavigationView {
                GeometryReader { geometry in
                    ZStack {
                        List {
                            NavigationLink(destination: CounterView(viewModel: CounterViewModel(state: self.viewModel.state))) {
                                Text(Constants.counterTitle)
                            }
                            NavigationLink(destination: FavoritePrimesView(viewModel: FavoritePrimesViewModel(state: self.viewModel.state))) {
                                Text(Constants.faviriteTitle)
                            }
                        }
                        .navigationBarTitle(Constants.selfNavTitle)
                        
                        PrimeNumbersInfoView(action: presentInfo)
                            .frame(width: geometry.size.width - 40, height: 50)
                            .cornerRadius(10)
                    }
                    .sheet(isPresented: $isInfoViewPresented, content: {
                        PrimeInfoDetailView(viewModel: PrimeInfoDetailViewModel())
                    })
                    .onDisappear() {
                        isInfoViewPresented = false
                    }
                }
            }
    }
}

//MARK: - Private

private extension MenuView {
    func presentInfo() {
        isInfoViewPresented = true
    }
}

//MARK: - Constants

private extension MenuView {
    enum Constants {
        static let counterTitle: LocalizedStringKey = "menuView.counter"
        static let faviriteTitle: LocalizedStringKey = "menuView.favoritePrimes"
        static let selfNavTitle: LocalizedStringKey = "menuView.primeNumbers"
    }
}

//MARK: - Previews

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView(viewModel: MenuViewModel(state: AppState()))
    }
}
