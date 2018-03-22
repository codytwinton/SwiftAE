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

	func reverseInPlace() -> SinglyLinkedNode {
		var currentHead = self

		while let nextHead = self.next {
			self.next = nextHead.next
			nextHead.next = currentHead
			currentHead = nextHead
		}

		return currentHead
	}

	func traverse(_ block: (SinglyLinkedNode) -> Void) {
		block(self)
		next?.traverse(block)
	}
}

// MARK: Tests

let testDate = Date()
print("Tests Started\n\n---\n")

for test in TestData.tests {
	// Arrange
	let head = SinglyLinkedNode<Int>(list: test.input)

	var actual: [Int] = []

	// Act
	let newHead = head?.reverseInPlace()
	newHead?.traverse { actual.append($0.value) }

	// Assert
	test.assert(with: actual)
}

print("---\n\nTests Ended:\n\telapsed: \(Date().timeIntervalSince(testDate))")
