import Foundation

public class BinaryNode<T>: CustomStringConvertible {
	public let value: T
	public var left: BinaryNode?
	public var right: BinaryNode?

	public var description: String {
		var leftStr = "nil"
		if let left = left { leftStr = "\(left)" }

		var rightStr = "nil"
		if let right = right { rightStr = "\(right)" }

		return "\(value), \(leftStr), \(rightStr)"
	}

	public init(value: T) {
		self.value = value
	}
}

public class BinaryTree<T: Equatable> {

	public var root: BinaryNode<T>?
	private var preIndex: Int = 0

	public init(inOrder: [T], preOrder: [T]) {
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
