/* Problem Statements

Given the String "Input", return "Expected"
*/

import Foundation

// MARK: Solution

// a 1...10 b t return true
// a 1...10 b 9...11 return true

// a 1...10 b 11...20 return false
// a 1...10 b -10...0 return false

extension CountableClosedRange {

	func intersects(with other: CountableClosedRange) -> Bool {
		guard !isEmpty, !other.isEmpty else { return false }
		return lowerBound <= other.upperBound && upperBound >= other.lowerBound
	}
}

// MARK: Tests

let testDate = Date()
print("Tests Started\n\n---\n")

for test in TestData.tests {
	// Arrange
	let input = test.input

	// Act
	let actual = input.a.intersects(with: input.b)

	// Assert
	test.assert(with: actual)
}

print("---\n\nTests Ended:\n\telapsed: \(Date().timeIntervalSince(testDate))")

