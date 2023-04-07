//
//  PrimeInfoDetailView.swift
//  PrimeNumberApp
//
//  Created by Nikita Kirshin on 06.04.2023.
//

import Combine
import SwiftUI

struct PrimeInfoDetailView: View {
    
    //MARK: - Properties
    
    @ObservedObject var viewModel: PrimeInfoDetailViewModel
    
    //MARK: - Body
    
    var body: some View {
        if viewModel.isLoading {
            ProgressView()
                .onAppear() {
                    viewModel.fetchPrimeNumbersAndInfo()
                }
        } else {
            VStack {
                Text(Constants.labelText)
                    .font(.largeTitle)
                    .padding(20)
                Text("Prime number is \(viewModel.primeNumbersInfo).\n")
                    .font(.body)
                Text(Constants.primesExampleTitle)
                AnimatedPrimeCollection(integers: viewModel.primeNumbers ?? [])
                Spacer()
            }
        }
    }
}

private extension PrimeInfoDetailView {
    enum Constants {
        static let labelText: LocalizedStringKey = "primeInfoDetailView.titleLabel"
        static let primesExampleTitle: LocalizedStringKey = "primeInfoDetailView.primesExampleTitle"
    }
}
