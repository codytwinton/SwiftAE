/* This problem was asked by Amazon.

Given a string, find the longest palindromic contiguous substring. If there are more than one with the maximum length, return any one.

For example, the longest palindromic substring of `"aabcdcb"` is `"bcdcb"`. The longest palindromic substring of `"bananas"` is `"anana"`.
*/

import Foundation

// MARK: Solution

extension String {

	var longestPalindromic: String {
		guard !isEmpty else { return self }

		var longest: String = ""

		for (i, left) in enumerated() {
			guard count - i > longest.count else { return longest }
			let iIndex = index(startIndex, offsetBy: i)

			for j in ((i + 1)..<count).reversed() {
				let jIndex = index(startIndex, offsetBy: j)
				guard left == self[jIndex] else { continue }

				let possible = String(self[iIndex...jIndex])

				guard possible.count > longest.count, possible == String(possible.reversed()) else { continue }
				longest = possible
				break
			}
		}

		return longest
	}
}

// MARK: Tests

let testDate = Date()
print("Tests Started\n\n---\n")

for test in TestData.tests {

	// Arrange
	let input = test.input

	// Act
	let actual = input.longestPalindromic

	// Assert
	test.assert(with: actual)
}

print("---\n\nTests Ended:\n\telapsed: \(Date().timeIntervalSince(testDate))")

