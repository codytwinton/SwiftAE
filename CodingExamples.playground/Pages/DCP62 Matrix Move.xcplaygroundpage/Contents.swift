/*: This problem was asked by Facebook.

There is an N by M matrix of zeroes. Given N and M, write a function to count the number of ways of starting at the top-left corner and getting to the bottom-right corner. You can only move right or down.

For example, given a 2 by 2 matrix, you should return 2, since there are two ways to get to the bottom-right:

* Right, then down
* Down, then right

Given a 5 by 5 matrix, there are 70 ways to get to the bottom-right.
*/

import Foundation

// MARK: Solution

func matrixRecursive(n: Int, m: Int) -> Int {
	guard n > 1 || m > 1 else { return 0 }
	guard n > 1, m > 1 else { return 1 }
	return matrixRecursive(n: n - 1, m: m) + matrixRecursive(n: n, m: m - 1)
}

// MARK: Tests

let testDate = Date()
print("Tests Started\n\n---\n")

for test in TestData.tests {
	// Arrange
	let input = test.input

	// Act
	let actualRecursive = matrixRecursive(n: input.n, m: input.m)

	// Assert
	test.assert(with: actualRecursive)
}

print("---\n\nTests Ended:\n\telapsed: \(Date().timeIntervalSince(testDate))")
