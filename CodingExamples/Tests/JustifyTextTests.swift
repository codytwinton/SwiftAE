//
//  JustifyTextTests.swift
//  Tests
//
//  Created by Cody Winton on 2/17/18.
//  Copyright © 2018 Cody Winton. All rights reserved.
//

import XCTest

fileprivate struct TestData: Testable {

	static let tests: [TestData] = [
		TestData(input:
			(words: ["the", "quick", "brown", "fox", "jumps", "over", "the", "lazy", "dog"], charCount: 16),
				 expected: ["the  quick brown", "fox  jumps  over", "the   lazy   dog"]
		)
	]

	public let input: (words: [String], charCount: Int)
	public let expected: [String]
}

class JustifyTextTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testJustifyText() {

		// Arrange
		for test in TestData.tests {
			let input = test.input

			// Act
			let actual = input.words.justify(with: input.charCount)

			// Assert
			XCTAssertEqual(actual, test.expected)
		}
    }
}
