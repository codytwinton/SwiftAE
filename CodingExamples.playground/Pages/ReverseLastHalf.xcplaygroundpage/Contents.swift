/* This problem was asked by Google.

Given a stack of N elements, interleave the first half of the stack with the second half reversed using only one other queue. This should be done in-place.

Recall that you can only push or pop from a stack, and enqueue or dequeue from a queue.

For example, if the stack is [1, 2, 3, 4, 5], it should become [1, 5, 2, 4, 3]. If the stack is [1, 2, 3, 4], it should become [1, 4, 2, 3].

Hint: Try working backwords from the end state.
*/

import Foundation

// MARK: Setup

struct Stack<T> {
	var items: [T] = []

	func peek() -> T? {
		return items.last
	}

	mutating func push(_ item: T) {
		items.append(item)
	}

	mutating func pop() -> T {
		return items.removeLast()
	}

	init(items: [T]) {
		self.items = items
	}
}

struct Queue<T> {
	var items: [T] = []

	func peek() -> T? {
		return items.first
	}

	mutating func enqueue(_ item: T) {
		items.append(item)
	}

	mutating func dequeue() -> T {
		return items.removeFirst()
	}

	init(items: [T]) {
		self.items = items
	}
}

// MARK: Solution

extension Stack where T == Int {

	mutating func reverseLastHalf() -> Stack<T> {
		return self
	}
}

// MARK: Test Structure

struct TestValues {
	var input: [Int]
	let result: [Int]
}

var tests: [TestValues] = [
	TestValues(input: [], result: []),
	TestValues(input: [1, 2, 3, 4, 5], result: [1, 2, 3, 4, 5]),
	TestValues(input: [1, 2, 3, 4], result: [1, 4, 2, 3])
]

// MARK: Tests

for (index, test) in tests.enumerated() {
	// Arrange
	var stack = Stack<Int>(items: test.input)

	// Act
	let result = stack.reverseLastHalf().items

	// Assert
	let wasSuccess = result == test.result

	print("""
		\(wasSuccess ? "Passed" : "Failed") Test \(index):
			input: \(test.input)
			expected: \(test.result)
			actual: \(result)

		""")
}

