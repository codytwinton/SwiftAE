/*: This problem was asked by Google.

Given the head of a singly linked list, reverse it in-place.
*/

import Foundation

// MARK: Singly Linked List

// MARK: -

class SinglyLinkedNode<T> {

	// MARK: Variables

	var value: T
	var next: SinglyLinkedNode<T>?

	// MARK: Inits

	init?(list: [T]) {
		guard let first = list.first else { return nil }
		value = first

		var previous: SinglyLinkedNode? = self

		for i in 1..<list.count {
			previous?.next = SinglyLinkedNode(value: list[i])
			previous = previous?.next
		}
	}

	init(value: T) {
		self.value = value
	}

	// MARK: Functions

	func reverseInPlace() {

	}

	func traverse(_ block: (T) -> Void) {
		block(value)
		next?.traverse(block)
	}
}

// MARK: Tests

let testDate = Date()
print("Tests Started\n\n---\n")

for test in TestData.tests {
	// Arrange
	var head = SinglyLinkedNode<Int>(list: test.input)

	var actual: [Int] = []

	// Act
	head?.reverseInPlace()
	head?.traverse { actual.append($0) }

	// Assert
	test.assert(with: actual)
}

print("---\n\nTests Ended:\n\telapsed: \(Date().timeIntervalSince(testDate))")
