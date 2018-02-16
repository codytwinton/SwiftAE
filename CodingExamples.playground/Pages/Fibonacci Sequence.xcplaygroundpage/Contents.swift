/* Problem Statements

Return the Fibonacci Sequence
*/

import Foundation

// MARK: Solution

extension Int {

	static func fibonacciIterative(count: Int) -> [Int] {
		guard count > 0 else { return [] }

		var sequence = [0, 1]
		guard count > 1 else { return sequence }

		for _ in sequence.count...count {
			let first = sequence[sequence.count - 2]
			let second = sequence[sequence.count - 1]
			sequence.append(first + second)
		}

		return sequence
	}

	static func fibonacciRecursive(count: Int) -> [Int] {
		guard count > 0 else { return [] }
		let sequence = [0, 1]

		guard count > 1 else { return sequence }
		return sequence + fibonacciRecursive(count: count - 1, first: 0, second: 1)
	}

	private static func fibonacciRecursive(count: Int, first: Int, second: Int) -> [Int] {
		guard count > 0 else { return [] }
		return [first + second] + fibonacciRecursive(count: count - 1, first: second, second: first + second)
	}
}

// MARK: Tests

let testDate = Date()
print("Tests Started\n\n---\n")

for test in TestData.tests {
	// Arrange
	let input = test.input

	// Act
	let iterative = Int.fibonacciIterative(count: input)
	let recursive = Int.fibonacciRecursive(count: input)

	// Assert
	test.assert(with: iterative)
	test.assert(with: recursive)
}

print("---\n\nTests Ended:\n\telapsed: \(Date().timeIntervalSince(testDate))")


