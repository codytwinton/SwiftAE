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

SOLUTION: https://www.geeksforgeeks.org/construct-tree-from-given-inorder-and-preorder-traversal/
*/

import Foundation

// MARK: Solution

class BinaryTree<T: Equatable> {

	var root: BinaryNode<T>?
	private var preIndex: Int = 0

	init(inOrder: [T], preOrder: [T]) {
		root = construct(inOrder: inOrder, preOrder: preOrder, startIndex: 0, endIndex: preOrder.count - 1)
	}

	private func construct(inOrder: [T], preOrder: [T], startIndex: Int, endIndex: Int) -> BinaryNode<T>? {
		guard !preOrder.isEmpty, preOrder.count == inOrder.count, startIndex <= endIndex else { return nil }

		let tRoot = BinaryNode<T>(value: preOrder[preIndex])
		preIndex += 1
		guard startIndex != endIndex else { return tRoot }

		var inIndex = endIndex

		for i in startIndex..<endIndex {
			guard inOrder[i] == tRoot.value else { continue }
			inIndex = i
			break
		}

		tRoot.left = construct(inOrder: inOrder, preOrder: preOrder, startIndex: startIndex, endIndex: inIndex - 1)
		tRoot.right = construct(inOrder: inOrder, preOrder: preOrder, startIndex: inIndex + 1, endIndex: endIndex)

		return tRoot
	}
}

// MARK: Tests

let testDate = Date()
print("Tests Started\n\n---\n")

for test in TestData.tests {
	// Arrange
	let input = test.input

	// Act
	let tree = BinaryTree<Int>(inOrder: input.inOrder, preOrder: input.preOrder)

	guard let actual = tree.root else {
		print("actual is nil")
		continue
	}

	// Assert
	test.assert(with: actual)
}

print("---\n\nTests Ended:\n\telapsed: \(Date().timeIntervalSince(testDate))")
