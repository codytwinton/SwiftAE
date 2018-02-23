import Foundation

/*
0
/ \
1   2
/ \ / \
3  4 5  6

7
/ \
2   10
/ \ / \
1  5 9  11
*/

public struct TestData: Testable {

	public static let tests: [TestData] = [
		TestData(input: (preOrder: [6], inOrder: [6]), expected: BinaryNode(value: 6)),
		TestData(input: (preOrder: [0, 1, 3, 4, 2, 5, 6], inOrder: [3, 1, 4, 0, 5, 2, 6]), expected: expectedNode)
	]

	public static let expectedNode: BinaryNode<Int> = {

		let node = BinaryNode(value: 0)
		node.left = BinaryNode(value: 1)
		node.right = BinaryNode(value: 2)

		node.left?.left = BinaryNode(value: 3)
		node.left?.right = BinaryNode(value: 4)

		node.right?.left = BinaryNode(value: 5)
		node.right?.right = BinaryNode(value: 6)

		return node
	}()

	public var input: (preOrder: [Int], inOrder: [Int])
	public let expected: BinaryNode<Int>

	public func assert(with actual: BinaryNode<Int>) {
		log(success: actual.description == expected.description, actual: actual)
	}
}
