/*:
# DCP62 Matrix Move

This problem was asked by Facebook.

There is an N by M matrix of zeroes. Given N and M, write a function to count the number of ways of starting at the top-left corner and getting to the bottom-right corner. You can only move right or down.

For example, given a 2 by 2 matrix, you should return 2, since there are two ways to get to the bottom-right:

* Right, then down
* Down, then right

Given a 5 by 5 matrix, there are 70 ways to get to the bottom-right.

Solution: [Geek for Geeks](https://www.geeksforgeeks.org/count-possible-paths-top-left-bottom-right-nxm-matrix/)
*/

import Foundation

// MARK: Solution

extension Int {

	var factorial: Int {
		guard self > 1 else { return 1 }
		return self * (self - 1).factorial
	}
}

func matrixRecursive(n: Int, m: Int) -> Int {
	guard n > 1 || m > 1 else { return 0 }
	guard n > 1, m > 1 else { return 1 }
	return matrixRecursive(n: n - 1, m: m) + matrixRecursive(n: n, m: m - 1)
}

func matrixFactorial(n: Int, m: Int) -> Int {
	guard n > 1 || m > 1 else { return 0 }
	return (n - 1 + m - 1).factorial / ((n - 1).factorial * (m - 1).factorial)
}

func matrixDynamic(n: Int, m: Int) -> Int {
	guard n > 1 || m > 1 else { return 0 }

	var count: [[Int]] = Array(repeating: Array(repeating: 0, count: n), count: m)

	for i in 0..<m {
		count[i][0] = 1
	}

	for i in 0..<n {
		count[0][i] = 1
	}

	for i in 1..<m {
		for j in 1..<n {
			count[i][j] = count[i - 1][j] + count[i][j - 1]
		}
	}

	return count[m - 1][n - 1]
}

// MARK: Tests

let testDate = Date()
print("Tests Started\n\n---\n")

for test in TestData.tests {
	// Arrange
	let input = test.input

	// Act
	let actualRecursive = matrixDynamic(n: input.n, m: input.m)

	// Assert
	test.assert(with: actualRecursive)
}

print("---\n\nTests Ended:\n\telapsed: \(Date().timeIntervalSince(testDate))")
