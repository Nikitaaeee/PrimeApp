//
//  NumberPluralizerTests.swift
//  PrimeNumberAppTests
//
//  Created by Nikita Kirshin on 06.04.2023.
//

@testable import PrimeNumberApp
import XCTest

class NumberPluralizerTests: XCTestCase {
    
    var numberPluralizer: NumberPluralizer!
    
    //MARK: - Lifecycle
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        numberPluralizer = NumberPluralizer()
    }
    
    override func tearDownWithError() throws {
        numberPluralizer = nil
        try super.tearDownWithError()
    }
    
    //MARK: - Tests
    func testPluralizer() {
        //Given
        let testCases = [
            (number: 1, expectedSuffix: "st"),
            (number: 2, expectedSuffix: "nd"),
            (number: 3, expectedSuffix: "rd"),
            (number: 4, expectedSuffix: "th"),
            (number: 11, expectedSuffix: "th"),
            (number: 12, expectedSuffix: "th"),
            (number: 13, expectedSuffix: "th"),
            (number: 21, expectedSuffix: "st"),
            (number: 22, expectedSuffix: "nd"),
            (number: 23, expectedSuffix: "rd"),
            (number: 24, expectedSuffix: "th")
        ]
        
        for testCase in testCases {
            // When
            let ordinalSuffix = NumberPluralizer.ordinalSuffix(for: testCase.number)
            
            // Then
            XCTAssertEqual(ordinalSuffix, testCase.expectedSuffix)
        }
    }
}

