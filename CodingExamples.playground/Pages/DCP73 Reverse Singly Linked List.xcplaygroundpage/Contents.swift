/*: This problem was asked by Google.

Given the head of a singly linked list, reverse it in-place.
*/

import Foundation

// MARK: Solution

func handleProblem(for input: [Int]) -> [Int] {
	return input
}

// MARK: Tests

let testDate = Date()
print("Tests Started\n\n---\n")

for test in TestData.tests {
	// Arrange
	let input = test.input

	// Act
	let actual = handleProblem(for: input)

	// Assert
	test.assert(with: actual)
}

print("---\n\nTests Ended:\n\telapsed: \(Date().timeIntervalSince(testDate))")
