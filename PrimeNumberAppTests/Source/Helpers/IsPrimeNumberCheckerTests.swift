//
//  IsPrimeNumberCheckerTests.swift
//  PrimeNumberAppTests
//
//  Created by Nikita Kirshin on 06.04.2023.
//

@testable import PrimeNumberApp
import XCTest

class IsPrimeNumberCheckerTests: XCTestCase {

    //MARK: - Properties
    
    var isPrimeNumberChecker: IsPrimeNumberChecker!

    //MARK: - Lifecycle
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        isPrimeNumberChecker = IsPrimeNumberChecker()
    }

    override func tearDownWithError() throws {
        isPrimeNumberChecker = nil
        try super.tearDownWithError()
    }

    //MARK: - Tests
    
    func testIsPrime() throws {
        // Given
        let testCases = [
            (number: -1, isPrime: false),
            (number: 0, isPrime: false),
            (number: 1, isPrime: false),
            (number: 2, isPrime: true),
            (number: 3, isPrime: true),
            (number: 10, isPrime: false),
            (number: 11, isPrime: true),
            (number: 12, isPrime: false),
            (number: 13, isPrime: true),
            (number: 14, isPrime: false),
            (number: 97, isPrime: true),
            (number: 98, isPrime: false)
        ]

        for testCase in testCases {
            // When
            let isPrime = IsPrimeNumberChecker.isPrime(testCase.number)

            // Then
            XCTAssertEqual(isPrime, testCase.isPrime)
        }
    }

}
