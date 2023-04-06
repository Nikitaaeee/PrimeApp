//
//  NumberPluralizer.swift
//  PrimeNumberApp
//
//  Created by Nikita Kirshin on 29.03.2023.
//

import Foundation

struct NumberPluralizer {
    static func ordinalSuffix(for number: Int) -> String {
        let mod10 = number % 10
        let mod100 = number % 100
        
        if mod10 == 1 && mod100 != 11 {
            return "st"
        } else if mod10 == 2 && mod100 != 12 {
            return "nd"
        } else if mod10 == 3 && mod100 != 13 {
            return "rd"
        } else {
            return "th"
        }
    }
}
