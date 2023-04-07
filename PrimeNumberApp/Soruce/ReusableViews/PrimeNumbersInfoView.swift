//
//  PrimeNumbersInfoView.swift
//  PrimeNumberApp
//
//  Created by Nikita Kirshin on 06.04.2023.
//

import SwiftUI

struct PrimeNumbersInfoView: View {
    
    //MARK: - Properties
    
    let action: () -> Void
    
    //MARK: - Body
    
    var body: some View {
        Button(action: action) {
            HStack {
                ZStack{
                    Image(Constants.imageName)
                        .resizable()
                        .scaledToFill()
                        .overlay(
                            LinearGradient(gradient: Gradient(colors: [Color.white.opacity(4),
                                                                       Color.white.opacity(0)]),
                                           startPoint: .leading,
                                           endPoint: .trailing)
                            .blendMode(.lighten)
                        )
                    Text(Constants.buttonLabel)
                        .font(.headline)
                        .foregroundColor(.black)
                }
            }
        }
    }
}

//MARK: - Constants

private extension PrimeNumbersInfoView {
    enum Constants {
        static let imageName: String = "math"
        static let buttonLabel: LocalizedStringKey = "primeInfoDetailView.titleLabel"
    }
}
