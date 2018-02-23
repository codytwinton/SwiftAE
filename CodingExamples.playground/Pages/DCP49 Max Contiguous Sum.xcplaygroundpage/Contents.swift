/* This problem was asked by Amazon.

Given an array of numbers, find the maximum sum of any contiguous subarray of the array.

For example, given the array [34, -50, 42, 14, -5, 86], the maximum sum would be 137, since we would take elements 42, 14, -5, and 86.

Given the array [-5, -1, -8, -9], the maximum sum would be 0, since we would not take any elements.

Do this in O(N) time.
*/

import Foundation

// MARK: Solution

extension Array where Iterator.Element == Int {

	var maxContiguousSum: Int {
		guard !isEmpty else { return 0 }

		var maxSum = 0, maxCurrent = 0

		for i in 0..<self.count {

			print("\(i): maxSum: \(maxSum) maxCurrent: \(maxCurrent)")

			maxCurrent += self[i]

			if (maxCurrent < 0) {
				maxCurrent = 0
			} else if (maxSum < maxCurrent) {
				maxSum = maxCurrent
			}
		}

		return maxSum
	}
}

// MARK: Tests

let testDate = Date()
print("Tests Started\n\n---\n")

for test in TestData.tests {
	// Arrange
	let input = test.input

	// Act
	let actual = input.maxContiguousSum

	// Assert
	test.assert(with: actual)
}

print("---\n\nTests Ended:\n\telapsed: \(Date().timeIntervalSince(testDate))")

