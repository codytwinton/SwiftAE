//
//  CodingTests.swift
//  CodingTests
//
//  Created by Cody Winton on 2/17/18.
//  Copyright © 2018 Cody Winton. All rights reserved.
//

@testable import CodingExamples
import XCTest

struct TestValues {
	var input: String
	let expected: Set<String>
}

class PowerSetTests: XCTestCase {

	var powerSetTests: [TestValues] = [
		TestValues(input: "",  expected: [""]),
		TestValues(input: "c",  expected: ["", "c"]),
		TestValues(input: "bc",  expected: ["", "b", "bc", "c"]),
		TestValues(input: "abc",  expected: ["", "a", "ab", "ac", "abc", "b", "bc", "c"]),
		TestValues(input: "asdfghj",  expected: ["adghj", "dfg", "sdfghj", "asdfgj", "asdfj", "df", "asdh", "dhj", "asdj", "dgh", "sfghj", "sfhj", "sdf", "sdfj", "asdghj", "ad", "sfgh", "asfghj", "", "fh", "asdgh", "adfg", "sg", "afgh", "asdf", "asg", "afgj", "adf", "sfh", "asdhj", "sgj", "adfgh", "sdfhj", "dfghj", "aghj", "ahj", "agh", "asdfghj", "ah", "f", "sdj", "fgh", "adfhj", "asdfhj", "a", "sd", "asfj", "g", "dfj", "sfg", "asj", "asghj", "sdgj", "dgj", "asgj", "ashj", "sdg", "fg", "asfgj", "afhj", "afg", "asgh", "hj", "aj", "fgj", "dg", "dghj", "j", "adfghj", "sdgh", "sdfgj", "asfhj", "dfgh", "asfgh", "asdfgh", "ghj", "fhj", "sdfgh", "adj", "as", "asd", "adgh", "adh", "sj", "adhj", "shj", "sghj", "asdgj", "sf", "fj", "ag", "dfhj", "sdhj", "sdh", "gj", "fghj", "af", "adfh", "sgh", "sh", "afj", "afh", "ash", "asdg", "h", "adgj", "adg", "adfj", "sdghj", "afghj", "asdfh", "d", "asfh", "agj", "sfgj", "sdfh", "asf", "asfg", "dfh", "adfgj", "dfgj", "asdfg", "s", "gh", "dj", "sfj", "dh", "sdfg"])
	]

	override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

	func testPowerSet() {

		// Arrange
		for test in powerSetTests {
			// Act
			let actual = test.input.powerSet
			let actualRecursion = test.input.powerSetRecursion

			// Assert
			XCTAssertEqual(actual, test.expected)
			XCTAssertEqual(actualRecursion, test.expected)
		}
	}

	func testPowerSetObjC() {

		// Arrange
		for test in powerSetTests {
			// Act
			let actual = test.input.powerSetObjC
			let actualRecursion = test.input.powerSetRecursionObjC

			// Assert
			XCTAssertEqual(actual, test.expected)
			XCTAssertEqual(actualRecursion, test.expected)
		}
	}
    
    func testPerformanceExample() {
        // This is an example of a performance test case.

        self.measure {

        }
    }
}
