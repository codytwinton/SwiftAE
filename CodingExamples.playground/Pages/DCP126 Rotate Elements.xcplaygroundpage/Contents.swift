/*: Problem Statements

Given the String "Input", return "Expected"
*/

import Foundation

// MARK: Solution

extension Array where Element == Int {

	mutating func rotate(by k: Int) {

	}
}

// MARK: Tests

let testDate = Date()
print("Tests Started\n\n---\n")

for test in TestData.tests {
	// Arrange
	let input = test.input

	// Act
	var actual = input.arr
	actual.rotate(by: input.k)

	// Assert
	test.assert(with: actual)
}

print("---\n\nTests Ended:\n\telapsed: \(Date().timeIntervalSince(testDate))")

