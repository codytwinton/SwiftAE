/* This problem was asked by Microsoft.

Suppose an arithmetic expression is given as a binary tree. Each leaf is an integer and each internal node is one of '+', '−', '∗', or '/'.

Given the root to such a tree, write a function to evaluate it.

For example, given the following tree:

    *
   / \
  +   +
 / \ / \
3  2 4  5

You should return 45, as it is (3 + 2) * (4 + 5).

In order traversal would be
["3", "+", "2", "*", "4", "+", "5"]
*/

import Foundation

extension BinaryNode where T == MathNode {

	var expressionResult: Int {
		return 0
	}
}

// MARK: Tests

let testDate = Date()
print("Tests Started\n\n---\n")

for test in TestData.tests {
	// Arrange
	let input = test.input

	// Act
	let actual = input.expressionResult

	// Assert
	test.assert(with: actual)
}

print("---\n\nTests Ended:\n\telapsed: \(Date().timeIntervalSince(testDate))")

