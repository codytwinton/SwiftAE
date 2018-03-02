/* Problem Statements

Given the String "Input", return "Expected"
*/

import Foundation

// MARK: Solution

extension String {
	func breakWords(length: Int) -> [String] {
		return []
	}
}

// MARK: Tests

let testDate = Date()
print("Tests Started\n\n---\n")

for test in TestData.tests {
	// Arrange
	let input = test.input

	// Act
	let actual = input.text.breakWords(length: input.length)

	// Assert
	test.assert(with: actual)
}

print("---\n\nTests Ended:\n\telapsed: \(Date().timeIntervalSince(testDate))")

