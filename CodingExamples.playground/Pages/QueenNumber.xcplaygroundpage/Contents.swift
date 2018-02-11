/* This problem was asked by Microsoft.

You have an N by N board. Write a function that, given N, returns the number of possible arrangements of the board where N queens can be placed on the board without threatening each other, i.e. no two queens share the same row, column, or diagonal.
*/

import Foundation

// MARK: Solution

func queenNumber(size: Int) -> Int {
	return 0
}

// MARK: Test Structure

struct TestValues {
	var input: Int
	let result: Int
}

var tests: [TestValues] = [
	TestValues(input: 1, result: 1),
	TestValues(input: 2, result: 1),
	TestValues(input: 3, result: 2)
]

// MARK: Tests

for (index, test) in tests.enumerated() {
	// Arrange

	// Act
	let result = queenNumber(size: test.input)

	// Assert
	let wasSuccess = result == test.result

	print("""
		\(wasSuccess ? "Passed" : "Failed") Test \(index):
			input: \(test.input)
			expected: \(test.result)
			actual: \(result)

		""")
}


