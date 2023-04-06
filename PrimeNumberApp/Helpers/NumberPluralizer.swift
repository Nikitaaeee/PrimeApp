//
//  NumberPluralizer.swift
//  PrimeNumberApp
//
//  Created by Nikita Kirshin on 29.03.2023.
//

import Foundation

struct NumberPluralizer {
    static func ordinal(_ n: Int) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .ordinal
        
        return formatter.string(for: n) ?? .emptyString
    }
}
