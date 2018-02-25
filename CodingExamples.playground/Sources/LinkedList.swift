import Foundation

public class LinkedList<H: Hashable, T>: CustomStringConvertible {
	public private(set) var head: ListNode<H, T>?
	public private(set) var tail: ListNode<H, T>?

	public func append(value: T, for key: H) {
		let node = ListNode(key: key, value: value)

		switch tail {
		case let tail?:
			node.previous = tail
			tail.next = node
		case nil:
			head = node
		}

		tail = node
	}

	public var description: String {
		var text = "["
		var nextNode = head

		while let node = nextNode {
			text += "\(node.value)"
			nextNode = node.next
			if nextNode != nil { text += ", " }
		}

		return text + "]"
	}
}

public class ListNode<H: Hashable, T> {
	public let key: H
	public let value: T
	public var next: ListNode<H, T>?
	public weak var previous: ListNode<H, T>?

	public init(key: H, value: T) {
		self.key = key
		self.value = value
	}
}

