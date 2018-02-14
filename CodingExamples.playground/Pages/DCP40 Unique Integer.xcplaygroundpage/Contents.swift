/* Daily Coding Problem: Problem #40

This problem was asked by Google.

Given an array of integers where every integer occurs three times except for one integer, which only occurs once, find and return the non-duplicated integer.

For example, given [6, 1, 3, 3, 3, 6, 6], return 1. Given [13, 19, 13, 13], return 19.

Do this in O(N) time and O(1) space.
*/

import Foundation

// MARK: Solution

extension Array where Iterator.Element == Int {

	/// Returns the unique integer of an array where every other integer occurs 3 times
	public func uniqueIntSorting() -> Int {
		guard !isEmpty, count % 3 == 1, var previous = first else { return 0 }

		for (index, num) in sorted().enumerated() {
			switch index % 3 {
			case 0: previous = num
			case 1: if previous != num { return previous }
			default: continue
			}
		}

		return previous
	}

	/// Returns the unique integer of an array where every other integer occurs 3 times
	public func uniqueIntMath() -> Int {
		guard !isEmpty, count % 3 == 1 else { return 0 }
		return (Set(self).reduce(0, +) * 3 - reduce(0, +))/2
	}
}

// MARK: Tests

let testDate = Date()
print("Tests Started\n\n---\n")

for test in TestData.tests {
	// Arrange
	let input = test.input

	// Act
	let actual = input.uniqueIntMath()

	// Assert
	test.assert(with: actual)
}

print("---\n\nTests Ended:\n\telapsed: \(Date().timeIntervalSince(testDate))")

