//
//  AnimatedPrimeCollection.swift
//  PrimeNumberApp
//
//  Created by Nikita Kirshin on 07.04.2023.
//

import SwiftUI

struct AnimatedPrimeCollection: View {
    let integers: [Int]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [
                GridItem(.flexible()),
                GridItem(.flexible()),
                GridItem(.flexible()),
                GridItem(.flexible())],
                      spacing: 10) {
                
                ForEach(integers, id: \.self) { integer in
                    Text("\(integer)")
                        .font(.headline)
                        .padding(10)
                        .frame(width: 60, height: 60) // <-- Set a fixed width and height
                        .background(Color.blue.opacity(0.8)) // <-- Set alpha to 0.8
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .transition(.scale)
                        .opacity(0.8) // <-- Set the opacity to 0.8
                }
            }
        }
    }
}
