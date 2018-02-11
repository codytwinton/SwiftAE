/* This problem was asked by Google.

Given a stack of N elements, interleave the first half of the stack with the second half reversed using only one other queue. This should be done in-place.

Recall that you can only push or pop from a stack, and enqueue or dequeue from a queue.

For example, if the stack is [1, 2, 3, 4, 5], it should become [1, 5, 2, 4, 3]. If the stack is [1, 2, 3, 4], it should become [1, 4, 2, 3].

Hint: Try working backwords from the end state.
*/

import Foundation

// MARK: Setup

struct Stack<T> {

	var count: Int { return items.count }
	var isEmpty: Bool { return items.isEmpty }

	private var items: [T]

	func peek() -> T? {
		return items.last
	}

	mutating func push(_ item: T?) {
		guard let item = item else { return }
		items.append(item)
	}

	mutating func pop() -> T? {
		guard !items.isEmpty else { return nil }
		return items.removeLast()
	}

	func all() -> [T] {
		return items
	}

	init(_ items: [T] = []) {
		self.items = items
	}
}

struct Queue<T> {

	var count: Int { return items.count }
	var isEmpty: Bool { return items.isEmpty }

	private var items: [T]

	func peek() -> T? {
		return items.first
	}

	mutating func enqueue(_ item: T?) {
		guard let item = item else { return }
		items.append(item)
	}

	mutating func dequeue() -> T? {
		guard !items.isEmpty else { return nil }
		return items.removeFirst()
	}

	func all() -> [T] {
		return items
	}

	init(_ items: [T] = []) {
		self.items = items
	}
}

// MARK: Solution

extension Stack where T == Int {

	mutating func reverseLastHalf() -> Stack<T> {
		guard self.count > 2 else { return self }

		var queue = Queue<T>()

		for _ in 1..<self.count {
			queue.enqueue(self.pop())
		}

		var previous = self.peek() ?? 1
		var next = queue.peek() ?? 1
		var highNum = true

		while !queue.isEmpty {

			guard queue.peek() == next else {
				queue.enqueue(queue.dequeue())
				continue
			}

			self.push(queue.dequeue())

			next = highNum ? previous + 1 : previous - 1
			previous = self.peek() ?? 1
			highNum = !highNum
		}

		return self
	}
}

// MARK: Test Structure

struct TestValues {
	var input: [Int]
	let result: [Int]
}

var tests: [TestValues] = [
	//TestValues(input: [], result: []),
	TestValues(input: [1], result: [1]),
	TestValues(input: [1, 2], result: [1, 2]),
	TestValues(input: [1, 2, 3], result: [1, 3, 2]),
	TestValues(input: [1, 2, 3, 4], result: [1, 4, 2, 3]),
	TestValues(input: [1, 2, 3, 4, 5], result: [1, 5, 2, 4, 3]),
	TestValues(input: [1, 2, 3, 4, 5, 6], result: [1, 6, 2, 5, 3, 4])
]

// MARK: Tests

for (index, test) in tests.enumerated() {
	// Arrange
	var stack = Stack<Int>(test.input)

	// Act
	let result = stack.reverseLastHalf().all()

	// Assert
	let wasSuccess = result == test.result

	print("""
		\(wasSuccess ? "Passed" : "Failed") Test \(index):
			input: \(test.input)
			expected: \(test.result)
			actual: \(result)

		""")
}

