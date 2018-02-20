/* Problem Statements

Given the String "Input", return "Expected"
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
