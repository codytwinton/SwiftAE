/*: This problem was asked by Google.

Given the head of a singly linked list, reverse it in-place.
*/

import Foundation

// MARK: Tests

let testDate = Date()
print("Tests Started\n\n---\n")

for test in TestData.tests {
	// Arrange
	let head = SinglyLinkedNode<Int>(list: test.input)
	var actual: [Int] = []

	// Act
	let newHead = head?.reverseInPlace()
	newHead?.traverse { actual.append($0) }

	// Assert
	test.assert(with: actual)
}

print("---\n\nTests Ended:\n\telapsed: \(Date().timeIntervalSince(testDate))")
