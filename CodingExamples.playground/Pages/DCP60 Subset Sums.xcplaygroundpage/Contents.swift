/*:
# DCP60 Subset Sums

This problem was asked by Facebook.

Given a set of integers, return whether the set can be partitioned into two subsets whose sums are the same.

For example, given the set [15, 5, 20, 10, 35, 25, 10], it would return true, since we can split the set up into [15, 5, 10, 15, 10] and [20, 35], which both add up to 55.

Given the set [15, 5, 20, 10, 35], it would return false, since we can't split the set up into two subsets that add up to the same sum.
*/

import Foundation

// MARK: Solution

extension Array where Element == Int {
	var isSumOfSubsetsSame: Bool {
		guard count > 1 else { return false }

		let totalSum = reduce(0, +)
		guard totalSum % 2 == 0 else { return false }

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
	let actual = input.isSumOfSubsetsSame

	// Assert
	test.assert(with: actual)
}

print("---\n\nTests Ended:\n\telapsed: \(Date().timeIntervalSince(testDate))")

