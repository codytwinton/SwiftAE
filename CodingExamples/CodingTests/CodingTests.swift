//
//  CodingTests.swift
//  CodingTests
//
//  Created by Cody Winton on 2/17/18.
//  Copyright © 2018 Cody Winton. All rights reserved.
//

import XCTest

@testable import CodingExamples

class CodingTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.

		// Arrange
		let start: String = "abc"
		let expected: Set = ["", "a", "ab", "ac", "abc", "b", "bc", "c"]

		// Act
		let actual: Set = start.powerSet

		// Assert
		XCTAssertEqual(actual, expected)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.

        self.measure {

        }
    }
    
}
