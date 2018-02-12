/* This problem was asked by Google.

Given a stack of N elements, interleave the first half of the stack with the second half reversed using only one other queue. This should be done in-place.

Recall that you can only push or pop from a stack, and enqueue or dequeue from a queue.

For example, if the stack is [1, 2, 3, 4, 5], it should become [1, 5, 2, 4, 3]. If the stack is [1, 2, 3, 4], it should become [1, 4, 2, 3].

Hint: Try working backwords from the end state.
*/

import Foundation

// MARK: Solution

extension Stack where T == Int {

	mutating func reverseLastHalf() -> Stack<T> {
		guard self.count > 2 else { return self }

		var queue = Queue<T>()

		for _ in 1..<self.count {
			queue.enqueue(self.pop())
		}

		var next = queue.peek() ?? 1

		while !queue.isEmpty {
			guard queue.peek() == next else {
				queue.enqueue(queue.dequeue())
				continue
			}

			let current = self.peek() ?? 1
			next = (next > current) ? current + 1 : current - 1
			self.push(queue.dequeue())
		}

		return self
	}
}

// MARK: Tests

for test in TestData.tests {
	// Arrange
	var stack = Stack<Int>(test.input)

	// Act
	let actual = stack.reverseLastHalf().all()

	// Assert
	test.assert(with: actual)
}

