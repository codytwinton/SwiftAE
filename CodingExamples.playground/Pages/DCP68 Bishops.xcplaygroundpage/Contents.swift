/*: Problem Statements

Given the String "Input", return "Expected"
*/

import Foundation

// MARK: Solution

func handleProblem(for input: String) -> String {
	return "Actual"
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
