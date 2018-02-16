/* Problem Statements

Return the Factorial of a number
*/

import Foundation

// MARK: Solution

extension Int {

	var factorialIterate: Int {
		guard self > 1 else { return 1 }
		return (1...self).reduce(1, *)
	}

	var factorialRecursive: Int {
		return factorial(for: self)
	}

	private func factorial(for value: Int) -> Int {
		guard value > 1 else { return 1 }
		return value * factorial(for: value - 1)
	}
}

// MARK: Tests

let testDate = Date()
print("Tests Started\n\n---\n")

for test in TestData.tests {
	// Arrange
	let input = test.input

	// Act
	let actual = input.factorialIterate

	// Assert
	test.assert(with: actual)
}

print("---\n\nTests Ended:\n\telapsed: \(Date().timeIntervalSince(testDate))")

