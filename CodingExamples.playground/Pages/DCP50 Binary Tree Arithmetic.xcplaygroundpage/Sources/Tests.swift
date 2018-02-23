import Foundation

/*
For example, given the following tree:

    *
   / \
  +   +
 / \ / \
3  2 4  5

(3 + 2) * (4 + 5) = 45
*/

public enum MathNode {
	case add, subtract, multiply, divide
	case operand(Int)
}

public struct TestData: Testable {

	public static let tests: [TestData] = [
		TestData(input: firstNode, expected: 45),
		TestData(input: secondNode, expected: 13)
	]

	public static let firstNode: BinaryNode<MathNode> = {

		let node = BinaryNode<MathNode>(value: .multiply)
		node.left = BinaryNode(value: .add)
		node.right = BinaryNode(value: .add)

		node.left?.left = BinaryNode(value: .operand(3))
		node.left?.right = BinaryNode(value: .operand(2))

		node.right?.left = BinaryNode(value: .operand(4))
		node.right?.right = BinaryNode(value: .operand(5))

		return node
	}()

	/*
	Tree:

	   +
	  / \
	 7   *
	    / \
	   3   /
	      / \
	     4   2

	A + (B * (C / D) )

	7 + (3 * ( 4 / 2)) = 13
	*/
	public static let secondNode: BinaryNode<MathNode> = {

		let node = BinaryNode<MathNode>(value: .add)
		node.left = BinaryNode(value: .operand(7))
		node.right = BinaryNode(value: .multiply)

		node.right?.left = BinaryNode(value: .operand(3))
		node.right?.right = BinaryNode(value: .divide)

		node.right?.right?.left = BinaryNode(value: .operand(4))
		node.right?.right?.right = BinaryNode(value: .operand(2))

		return node
	}()

	public var input: BinaryNode<MathNode>
	public let expected: Int
}
