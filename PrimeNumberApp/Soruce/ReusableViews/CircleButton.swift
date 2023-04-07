//
//  CircleButton.swift
//  PrimeNumberApp
//
//  Created by Nikita Kirshin on 05.04.2023.
//

import SwiftUI

struct CircleButton: View {
    
    //MARK: - Properties
    
    let symbol: String
    let action: () -> Void
    
    //MARK: - Body
    
    var body: some View {
        Button(action: action) {
            Circle()
                .fill(Color.blue.opacity(0.7))
                .frame(width: 30, height: 30)
                .overlay(
                    Text(symbol)
                        .foregroundColor(.white)
                        .fontWeight(.heavy)
                )
        }
    }
}
