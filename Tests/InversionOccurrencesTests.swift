//
//  InversionOccurrencesTests.swift
//  Tests
//
//  Created by Cody Winton on 2/18/18.
//  Copyright © 2018 Cody Winton. All rights reserved.
//

import XCTest

fileprivate struct TestData: Testable {

	static let tests: [TestData] = [
		TestData(input: [], expected: 0),
		TestData(input: [2, 4, 1, 3, 5], expected: 3),
		TestData(input: [5, 4, 3, 2, 1], expected: 10),
		TestData(input: [4, 3, 2, 1], expected: 6),
		TestData(input: Array(1...300).reversed(), expected: 44850),
	]

	public var input: [Int]
	public let expected: Int
}

class InversionOccurrencesTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testInversionOccurrences() {

		for test in TestData.tests {
			// Arrange
			let input = test.input

			// Act
			let actual = input.inversionCount

			// Assert
			XCTAssertEqual(test.expected, actual)
		}
    }
}
