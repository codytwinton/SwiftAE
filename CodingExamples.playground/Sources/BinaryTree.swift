import Foundation

public enum BinaryTreeTraversal {
	case inOrder
	case preOrder
	case postOrder
}

private var preIndex: Int = 0

public class BinaryNode<T: Equatable>: CustomStringConvertible {

	// MARK: - Variables
	public let value: T
	public var left: BinaryNode?
	public var right: BinaryNode?

	public var description: String {
		var values: [String] = []

		self.traverse(.inOrder) {
			values.append("\($0)")
		}

		return values.joined(separator:", ")
	}

	// MARK: Inits

	public init(value: T) {
		self.value = value
	}

	convenience public init?(inOrder: [T], preOrder: [T]) {
		preIndex = 0
		self.init(inOrder: inOrder, preOrder: preOrder, startIndex: 0, endIndex: preOrder.count - 1)
	}

	private init?(inOrder: [T], preOrder: [T], startIndex: Int, endIndex: Int) {
		guard !preOrder.isEmpty, preOrder.count == inOrder.count, startIndex <= endIndex else { return nil }

		self.value = preOrder[preIndex]
		preIndex += 1
		guard startIndex != endIndex else { return }

		var inIndex = endIndex

		for i in startIndex..<endIndex {
			guard inOrder[i] == self.value else { continue }
			inIndex = i
			break
		}

		self.left = BinaryNode(inOrder: inOrder, preOrder: preOrder, startIndex: startIndex, endIndex: inIndex - 1)
		self.right = BinaryNode(inOrder: inOrder, preOrder: preOrder, startIndex: inIndex + 1, endIndex: endIndex)
	}

	// MARK: Functions

	public func traverse(_ order: BinaryTreeTraversal, block: (T) -> Void) {
		switch order {
		case .inOrder:
			left?.traverse(order, block: block)
			block(value)
			right?.traverse(order, block: block)
		case .preOrder:
			block(value)
			left?.traverse(order, block: block)
			right?.traverse(order, block: block)
		case .postOrder:
			left?.traverse(order, block: block)
			right?.traverse(order, block: block)
			block(value)
		}
	}

	public func values(_ order: BinaryTreeTraversal) -> [T] {
		var nodes: [T] = []

		traverse(order) {
			nodes.append($0)
		}

		return nodes
	}
}

extension BinaryNode where T: Hashable {

	public func uniqueValues(_ order: BinaryTreeTraversal) -> [T] {
		var uniqueNodes: Set<T> = []
		var nodes: [T] = []

		traverse(order) {
			guard !uniqueNodes.contains($0) else { return }
			uniqueNodes.insert($0)
			nodes.append($0)
		}

		return nodes
	}
}
