//
//  CounterView.swift
//  PrimeNumberApp
//
//  Created by Nikita Kirshin on 29.03.2023.
//

import SwiftUI

struct CounterView: View {
    
    //MARK: - Properties
    
    @ObservedObject var viewModel: CounterViewModel
    
    //MARK: - Body
    
    var body: some View {
        VStack {
            HStack {
                
                CircleButton(symbol: Constants.minusTitle) {
                    viewModel.decrementCounter()
                }
                
                Spacer().frame(width: Constants.defaultPadding)
                
                Text("\(viewModel.state.counter)")
                    .font(.largeTitle)
                
                Spacer().frame(width: Constants.defaultPadding)

                CircleButton(symbol: Constants.plusTitle) {
                    viewModel.incrementCounter()
                }
            }
            
            Button(Constants.primeQuestionTitle) {
                viewModel.togglePrimeModal()
            }
            .padding(Constants.smallPadding)
            
            Button(Constants.findPrimeFirstHalfTitle +
                   viewModel.isNumberPrime() +
                   Constants.findPrimeSecondHalfTitle) {
                viewModel.findClosestPrimeNumber(to: viewModel.state.counter)
            }
        }
        .font(.title2)
        .navigationTitle(Constants.navTitle)
        .sheet(isPresented: self.$viewModel.isPrimeModalShown, onDismiss: {
            viewModel.isPrimeModalShown = false
        }) {
            IsPrimeModalView(state: viewModel.state)
        }
        .alert(isPresented: $viewModel.showPrimeNumberAlert) {
            Alert(title: Text("The closest prime number is \(viewModel.primeNumber ?? 0)"),
                  dismissButton: .default(Text("OK")) {
                viewModel.showPrimeNumberAlert = false
            })
        }
    }
}

//MARK: - Constants

private extension CounterView {
    enum Constants {
        static let smallPadding: CGFloat = 24
        static let defaultPadding: CGFloat = 44
        static let minusTitle: String = "-"
        static let plusTitle: String = "+"
        static let primeQuestionTitle: String = "Is this a prime Number?"
        static let findPrimeFirstHalfTitle: String = "What's is the "
        static let findPrimeSecondHalfTitle: String =  " prime number?"
        static let navTitle: String = "Counter Demo"
    }
}


struct CounterView_Previews: PreviewProvider {
    static var previews: some View {
        CounterView(viewModel: CounterViewModel(state: AppState()))
    }
}
