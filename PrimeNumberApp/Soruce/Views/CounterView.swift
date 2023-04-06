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
            
            Button(LocalizedStringKey(String(format: NSLocalizedString(Constants.findPrimeLocalizableKey, comment: ""),
                                             viewModel.state.counter,
                                             viewModel.isNumberPrime()))) {
                viewModel.findClosestPrimeNumber(to: viewModel.state.counter)
            }
        }
        .font(.title2)
        .navigationTitle(Constants.navTitle)
        .sheet(isPresented: self.$viewModel.isPrimeModalShown, onDismiss: {
            viewModel.isPrimeModalShown = false
        }) {
            IsPrimeModalView(viewModel: IsPrimeModalViewModel(state: viewModel.state))
        }
        .alert(isPresented: $viewModel.showPrimeNumberAlert) {
            Alert(title:
                    Text(LocalizedStringKey(String(format: NSLocalizedString(Constants.alertNthPrimeNumber, comment: ""),
                                                   viewModel.primeNumber ?? .zero,
                                                   viewModel.state.counter,
                                                   viewModel.isNumberPrime()))),
                  dismissButton: .default(Text(Constants.okButtonLabel)) {
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
        static let okButtonLabel: String = "OK"
        static let findPrimeLocalizableKey: String = "counterView.whatIsNthPrimeNumber"
        static let alertNthPrimeNumber: String = "counterView.nthPrimeNumberResponse"
        static let primeQuestionTitle: LocalizedStringKey = "counterView.isAPrimeNumber"
        static let navTitle: LocalizedStringKey = "menuView.counter"
    }
}


struct CounterView_Previews: PreviewProvider {
    static var previews: some View {
        CounterView(viewModel: CounterViewModel(state: AppState()))
    }
}
