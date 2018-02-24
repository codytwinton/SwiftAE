//
//  ReverseLastHalf.swift
//  Tests
//
//  Created by Cody Winton on 2/18/18.
//  Copyright © 2018 Cody Winton. All rights reserved.
//

import XCTest

fileprivate struct TestData: Testable {

	static let tests: [TestData] = [
		TestData(input: [], expected: []),
		TestData(input: Array(1...1), expected: [1]),
		TestData(input: Array(1...2), expected: [1, 2]),
		TestData(input: Array(1...3), expected: [1, 3, 2]),
		TestData(input: Array(1...4), expected: [1, 4, 2, 3]),
		TestData(input: Array(1...5), expected: [1, 5, 2, 4, 3]),
		TestData(input: Array(1...6), expected: [1, 6, 2, 5, 3, 4])
	]

	public var input: [Int]
	public let expected: [Int]
}

class ReverseLastHalfTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testReverseLastHalf() {

		for test in TestData.tests {
			// Arrange
			var stack = Stack<Int>(test.input)

			// Act
			stack.reverseLastHalf()

			// Assert
			XCTAssertEqual(stack.items, test.expected)
		}
    }
}
