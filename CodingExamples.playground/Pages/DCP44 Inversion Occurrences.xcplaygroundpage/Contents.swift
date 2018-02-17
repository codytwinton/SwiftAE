/* This problem was asked by Google.

We can determine how "out of order" an array A is by counting the number of inversions it has. Two elements A[i] and A[j] form an inversion if A[i] > A[j] but i < j. That is, a smaller element appears after a larger element.

Given an array, count the number of inversions it has. Do this faster than O(N^2) time.

You may assume each element in the array is distinct.

For example, a sorted list has zero inversions. The array [2, 4, 1, 3, 5] has three inversions: (2, 1), (4, 1), and (4, 3). The array [5, 4, 3, 2, 1] has ten inversions: every distinct pair forms an inversion.
*/

import Foundation

// MARK: Solution

extension Array where Iterator.Element == Int {

	var inversionCount: Int {
		guard !isEmpty else { return 0 }

		var inversions = 0
		var iterations = 0

		for (i, num) in enumerated() {
			iterations += 1
			for j in (i + 1)..<count {
				iterations += 1
				guard num > self[j] else { continue }
				inversions += 1
			}
		}

		return inversions
	}
}

func handleProblem(input: String) -> String {
	return "Actual"
}

// MARK: Tests

let testDate = Date()
print("Tests Started\n\n---\n")

for test in TestData.tests {
	// Arrange
	let input = test.input

	// Act
	let actual = input.inversionCount

	// Assert
	test.assert(with: actual)
}

print("---\n\nTests Ended:\n\telapsed: \(Date().timeIntervalSince(testDate))")

