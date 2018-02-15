/* This problem was asked by Google.

Given a list of integers S and a target number k, write a function that returns a subset of S that adds up to k. If such a subset cannot be made, then return null.

Integers can appear more than once in the list. You may assume all numbers in the list are positive.

For example, given S = [12, 1, 61, 5, 9, 2] and k = 24, return [12, 9, 2, 1] since it sums up to 24.
*/

import Foundation

// MARK: Solution

extension Array where Iterator.Element == Int {

	public func sumSubset(for target: Int) -> [Int] {
		var sum = reduce(0, +)

		guard sum > target else { return sum == target ? self : [] }

		var vals = sorted { $0 > $1 }

		while sum > target {

			var indexRemove: Int?

			for (i, num) in vals.enumerated() {
				guard sum - num >= target else { continue }
				indexRemove = i
				sum -= num
				break
			}

			guard let index = indexRemove else { break }
			vals.remove(at: index)
		}

		return sum == target ? vals : []
	}
}

// MARK: Tests

let testDate = Date()
print("Tests Started\n\n---\n")

for test in TestData.tests {
	// Arrange
	let input = test.input

	// Act
	let actual = input.nums.sumSubset(for: input.target)

	// Assert
	test.assert(with: actual)
}

print("---\n\nTests Ended:\n\telapsed: \(Date().timeIntervalSince(testDate))")
