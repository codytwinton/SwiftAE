//
//  StackTests.swift
//  Tests
//
//  Created by Cody Winton on 2/23/18.
//  Copyright © 2018 Cody Winton. All rights reserved.
//

import XCTest

class StackTests: XCTestCase {

	var stack: Stack<Int> = Stack()
	var cwStack: CWStack = CWStack()

	override func setUp() {
		super.setUp()
		// Put setup code here. This method is called before the invocation of each test method in the class.
	}

	override func tearDown() {
		// Put teardown code here. This method is called after the invocation of each test method in the class.
		super.tearDown()
	}

	func testStack() {

		stack.push(3)
		stack.push(6)
		stack.push(9)

		XCTAssertEqual(stack.count, 3)
		XCTAssertEqual(stack.items.count, 3)
		XCTAssertFalse(stack.isEmpty)

		let pop = stack.pop()
		let peek = stack.peek()

		XCTAssertEqual(pop, 9)
		XCTAssertEqual(peek, 6)

		stack.clear()
		XCTAssertEqual(stack.count, 0)
		XCTAssertEqual(stack.items.count, 0)
		XCTAssert(stack.isEmpty)
	}

	func testCWStack() {

		cwStack.push(3)
		cwStack.push(6)
		cwStack.push(9)

		XCTAssertEqual(cwStack.count, 3)
		XCTAssertEqual(cwStack.items.count, 3)
		XCTAssertFalse(cwStack.isEmpty)

		let pop = cwStack.pop() as? Int
		let peek = cwStack.peek() as? Int

		XCTAssertEqual(pop, 9)
		XCTAssertEqual(peek, 6)

		cwStack.clear()
		XCTAssertEqual(cwStack.count, 0)
		XCTAssertEqual(cwStack.items.count, 0)
		XCTAssert(cwStack.isEmpty)
	}
}
