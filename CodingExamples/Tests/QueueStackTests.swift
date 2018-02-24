//
//  QueueTests.swift
//  Tests
//
//  Created by Cody Winton on 2/23/18.
//  Copyright © 2018 Cody Winton. All rights reserved.
//

import XCTest

class QueueStackTests: XCTestCase {

	var queue: Queue<Int> = Queue()
	var cwQueue: CWQueue = CWQueue()

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

	func testQueue() {

		queue.enqueue(3)
		queue.enqueue(6)
		queue.enqueue(9)

		XCTAssertEqual(queue.count, 3)
		XCTAssertEqual(queue.items.count, 3)
		XCTAssertFalse(queue.isEmpty)

		let dequeue = queue.dequeue()
		let peek = queue.peek()

		XCTAssertEqual(dequeue, 3)
		XCTAssertEqual(peek, 6)

		queue.clear()
		XCTAssertEqual(queue.count, 0)
		XCTAssertEqual(queue.items.count, 0)
		XCTAssert(queue.isEmpty)
	}

    func testCWQueue() {

		cwQueue.enqueue(3)
		cwQueue.enqueue(6)
		cwQueue.enqueue(9)

		XCTAssertEqual(cwQueue.count, 3)
		XCTAssertEqual(cwQueue.items.count, 3)
		XCTAssertFalse(cwQueue.isEmpty)

		let dequeue = cwQueue.dequeue() as? Int
		let peek = cwQueue.peek() as? Int

		XCTAssertEqual(dequeue, 3)
		XCTAssertEqual(peek, 6)

		cwQueue.clear()
		XCTAssertEqual(cwQueue.count, 0)
		XCTAssertEqual(cwQueue.items.count, 0)
		XCTAssert(cwQueue.isEmpty)
    }
}
