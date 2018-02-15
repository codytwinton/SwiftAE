/* Problem Statements

Given the String "Input", return "Expected"
*/

import Foundation

// MARK: Solution

func handleProblem(input: String) -> String {
	return "Actual"
}

// MARK: Tests

for test in TestData.tests {
	// Arrange
	let input = test.input

	// Act
	let actual = handleProblem(input: input)

	// Assert
	test.assert(with: actual)
}


