/*: This problem was asked by Facebook.

Given a list of integers, return the largest product that can be made by multiplying any three integers.

For example, if the list is [-10, -10, 5, 2], we should return 500, since that's -10 * -10 * 5.

You can assume the list has at least three integers.
*/

import Foundation

// MARK: Solution

extension Array where Element == Int {

	var largestTriProduct: Int {
		guard count >= 3 else { return 0 }
		let sorted = self.sorted()

		return Swift.max(sorted[0] * sorted[1] * sorted[count - 1], sorted[count - 3] * sorted[count - 2] * sorted[count - 1])
	}
}

// MARK: Tests

let testDate = Date()
print("Tests Started\n\n---\n")

for test in TestData.tests {
	// Arrange
	let input = test.input

	// Act
	let actual = input.largestTriProduct

	// Assert
	test.assert(with: actual)
}

print("---\n\nTests Ended:\n\telapsed: \(Date().timeIntervalSince(testDate))")
