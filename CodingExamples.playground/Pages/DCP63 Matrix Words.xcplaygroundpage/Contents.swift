/*:
# DCP63

This problem was asked by Microsoft.

Given a 2D matrix of characters and a target word, write a function that returns whether the word can be found in the matrix by going left-to-right, or up-to-down.

For example, given the following matrix:

[["F", "A", "C", "I"],
["O", "B", "Q", "P"],
["A", "N", "O", "B"],
["M", "A", "S", "S"]]
and the target word "FOAM", you should return true, since it's the leftmost column. Similarly, given the target word "MASS", you should return true, since it's the last row.
*/

import Foundation

// MARK: Solution

extension Array where Element == [Character] {

	func contains(_ str: String) -> Bool {
		return false
	}
}

// MARK: Tests

let testDate = Date()
print("Tests Started\n\n---\n")

for test in TestData.tests {
	// Arrange
	let input = test.input

	// Act
	let actual = input.matrix.contains(input.word)

	// Assert
	test.assert(with: actual)
}

print("---\n\nTests Ended:\n\telapsed: \(Date().timeIntervalSince(testDate))")
