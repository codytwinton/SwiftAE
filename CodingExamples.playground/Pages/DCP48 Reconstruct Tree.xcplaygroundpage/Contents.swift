/* This problem was asked by Google.

Given pre-order and in-order traversals of a binary tree, write a function to reconstruct the tree.

For example, given the following preorder traversal:

	[0, 1, 3, 4, 2, 5, 6]
	[a, b, d, e, c, f, g]

And the following inorder traversal:

	[3, 1, 4, 0, 5, 2, 6]
	[d, b, e, a, f, c, g]

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
*/

import Foundation

// MARK: Solution

func constructBinaryTree(preOrder: [Int], inOrder: [Int]) -> BinaryNode<Int> {
	var first = BinaryNode(value: 0)
	guard !preOrder.isEmpty, preOrder.count == inOrder.count else { return first }
	return first
}

// MARK: Tests

let testDate = Date()
print("Tests Started\n\n---\n")

for test in TestData.tests {
	// Arrange
	let input = test.input

	// Act
	let actual = constructBinaryTree(preOrder: input.preOrder, inOrder: input.inOrder)

	// Assert
	test.assert(with: actual)
}

print("---\n\nTests Ended:\n\telapsed: \(Date().timeIntervalSince(testDate))")
