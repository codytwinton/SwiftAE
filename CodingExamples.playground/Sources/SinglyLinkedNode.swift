import Foundation

// MARK: -

public class SinglyLinkedNode<T> {

	// MARK: Variables

	public var value: T
	public var next: SinglyLinkedNode?

	// MARK: Inits

	public init?(list: [T]) {
		guard let first = list.first else { return nil }
		value = first

		var current: SinglyLinkedNode? = self

		for value in list[1...] {
			current?.next = SinglyLinkedNode(value: value)
			current = current?.next
		}
	}

	init(value: T) {
		self.value = value
	}

	// MARK: Functions

	public func reverseInPlace() -> SinglyLinkedNode {
		var currentHead = self

		while let nextHead = self.next {
			self.next = nextHead.next
			nextHead.next = currentHead
			currentHead = nextHead
		}

		return currentHead
	}

	public func traverse(nodeBlock block: (SinglyLinkedNode) -> Void) {
		block(self)
		next?.traverse(nodeBlock: block)
	}

	public func traverse(valueBlock block: (T) -> Void) {
		traverse { block($0.value) }
	}
}
