//
//  CounterControl.swift
//  PrimeNumberApp
//
//  Created by Nikita Kirshin on 06.04.2023.
//

import SwiftUI

struct CounterControlView: View {
    
    //MARK: - Properties
    
    var viewModel: CounterViewModel
    
    //MARK: - Body
    
    var body: some View {
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
    }
}

//MARK: - Constants

private extension CounterControlView {
    enum Constants {
        static let defaultPadding: CGFloat = 44
        static let minusTitle: String = "-"
        static let plusTitle: String = "+"
    }
}
