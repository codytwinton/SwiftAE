/*: This problem was asked by Amazon.

Given a N by M matrix of numbers, print out the matrix in a clockwise spiral.

For example, given the following matrix:

[[1,  2,  3,  4,  5],
[6,  7,  8,  9,  10],
[11, 12, 13, 14, 15],
[16, 17, 18, 19, 20]]

You should print out the following:

[1, 2, 3, 4, 5, 10, 15, 20, 19, 18, 17, 16, 11, 6, 7, 8, 9, 14, 13, 12]

*/

import Foundation

// MARK: Solution

extension Array where Element == [Int] {

	var spiralMatrix: [Int] {
		guard !isEmpty else { return [] }

		var modified = self
		var matrix: [Int] = []

		// 0 = right, 1 = down, 2 = left, 3 = up
		var direction = 0

		while !modified.isEmpty {
			switch direction {
			case 0, 2:
				matrix += direction == 0 ? modified.removeFirst() : modified.removeLast().reversed()
			default:
				let left = direction == 3

				for i in stride(from: left ? (modified.count - 1) : 0, to: left ? 0 : (modified.count - 1), by: left ? -1 : 1) {
					var num = direction == 1 ? modified[i].removeLast() : modified[i].removeFirst()
					matrix.append(num)
				}
			}

			switch direction {
			case 0..<3:
				direction += 1
			default:
				direction = 0
			}
		}

		return matrix
	}
}

// MARK: Tests

let testDate = Date()
print("Tests Started\n\n---\n")

for test in TestData.tests {
	// Arrange
	let input = test.input

	// Act
	let actual = input.spiralMatrix

	// Assert
	test.assert(with: actual)
}

print("---\n\nTests Ended:\n\telapsed: \(Date().timeIntervalSince(testDate))")
