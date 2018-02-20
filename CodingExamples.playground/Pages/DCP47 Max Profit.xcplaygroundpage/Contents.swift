/* This problem was asked by Facebook.

Given a array of numbers representing the stock prices of a company in chronological order, write a function that calculates the maximum profit you could have made from buying and selling that stock once. You must buy before you can sell it.

For example, given [9, 11, 8, 5, 7, 10], you should return 5, since you could buy the stock at 5 dollars and sell it at 10 dollars.
*/

import Foundation

// MARK: Solution

extension Array where Iterator.Element == Int {
	var maxSalePrice: Int {
		guard count > 1 else { return 0 }

		var max: Int?

		for (i, left) in enumerated() {
			for j in ((i + 1)..<count).reversed() {
				let right = self[j]
				switch max {
				case nil:
					max = right - left
				case let m? where right - left > m:
					max = right - left
				default:
					continue
				}
			}
		}

		return max ?? 0
	}
}

// MARK: Tests

let testDate = Date()
print("Tests Started\n\n---\n")

for test in TestData.tests {
	// Arrange
	let input = test.input

	// Act
	let actual = input.maxSalePrice

	// Assert
	test.assert(with: actual)
}

print("---\n\nTests Ended:\n\telapsed: \(Date().timeIntervalSince(testDate))")
