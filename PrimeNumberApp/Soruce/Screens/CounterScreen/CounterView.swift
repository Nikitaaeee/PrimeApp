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
            
            CounterControlView(viewModel: viewModel)
            
            Button(Constants.primeQuestionTitle) {
                viewModel.togglePrimeModal()
            }
            .padding(Constants.smallPadding)
            
            Button(LocalizedStringKey(String(format: NSLocalizedString(Constants.findPrimeLocalizableKey, comment: ""),
                                             viewModel.state.counter,
                                             viewModel.isNumberPrime()))) {
                self.viewModel.findClosestPrimeNumber(to: viewModel.state.counter)
            }
            .disabled(self.viewModel.isNthPrimeButtonDisabled)
        }
        .font(.title2)
        .navigationTitle(Constants.navTitle)
        .sheet(isPresented: self.$viewModel.isPrimeModalShown, onDismiss: {
            viewModel.isPrimeModalShown = false
        }) {
            isPrimeModalView()
        }
        .alert(isPresented: $viewModel.showPrimeNumberAlert) {
            primeNumberAlert()
        }
    }
}

//MARK: - Private

private extension CounterView {
    func isPrimeModalView() -> IsPrimeModalView {
        IsPrimeModalView(viewModel: IsPrimeModalViewModel(state: viewModel.state))
    }
    
    func primeNumberAlert() -> Alert {
        return Alert(title:
                        Text(LocalizedStringKey(String(format: NSLocalizedString(Constants.alertNthPrimeNumber, comment: ""),
                                                       viewModel.primeNumber ?? .zero,
                                                       viewModel.state.counter,
                                                       viewModel.isNumberPrime()))),
                     dismissButton: .default(Text(Constants.okButtonLabel)) {
            viewModel.showPrimeNumberAlert = false
        })
    }
}

//MARK: - Constants

private extension CounterView {
    enum Constants {
        static let smallPadding: CGFloat = 24
        static let okButtonLabel: String = "OK"
        static let findPrimeLocalizableKey: String = "counterView.whatIsNthPrimeNumber"
        static let alertNthPrimeNumber: String = "counterView.nthPrimeNumberResponse"
        static let primeQuestionTitle: LocalizedStringKey = "counterView.isAPrimeNumber"
        static let navTitle: LocalizedStringKey = "menuView.counter"
    }
}

//MARK: - Preview

struct CounterView_Previews: PreviewProvider {
    static var previews: some View {
        CounterView(viewModel: CounterViewModel(state: AppState()))
    }
}
