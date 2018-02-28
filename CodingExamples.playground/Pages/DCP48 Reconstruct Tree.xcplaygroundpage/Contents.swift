/* This problem was asked by Google.

Given pre-order and in-order traversals of a binary tree, write a function to reconstruct the tree.

You should return the following tree:

	    a
	   / \
	  b   c
	 / \ / \
	d  e f  g

	    0
	   / \
	  1   2
	 / \ / \
	3  4 5  6

Given the following preorder traversal:

	[0, 1, 3, 4, 2, 5, 6]
	[a, b, d, e, c, f, g]

And the following inorder traversal:

	[3, 1, 4, 0, 5, 2, 6]
	[d, b, e, a, f, c, g]

    *
   / \
  +   +
 / \ / \
3  2 4  5

inorder
["3", "+", "2", "*", "4", "+", "5"]

SOLUTION: https://www.geeksforgeeks.org/construct-tree-from-given-inorder-and-preorder-traversal/
*/

import Foundation

// MARK: Tests

let testDate = Date()
print("Tests Started\n\n---\n")

for test in TestData.tests {
	// Arrange
	let input = test.input

	// Act
	guard let actual = BinaryNode<Int>(inOrder: input.inOrder, preOrder: input.preOrder) else {
		print("actual is nil")
		continue
	}

	let inOrder = actual.uniqueValues(.inOrder)

	// Assert
	test.assert(with: actual)

	print("testing: \(inOrder) test \(input.inOrder)")
}

print("---\n\nTests Ended:\n\telapsed: \(Date().timeIntervalSince(testDate))")
