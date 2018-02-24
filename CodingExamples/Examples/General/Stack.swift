import Foundation

public protocol Stackable {
	associatedtype Element

	var count: Int { get }
	var isEmpty: Bool { get }
	var items: [Element] { get }

	func peek() -> Element?
	mutating func push(_ item: Element?)
	mutating func pop() -> Element?

	init(_ items: [Element])
}

public struct Stack<T>: Stackable {

	public typealias Element = T

	public var count: Int { return items.count }
	public var isEmpty: Bool { return items.isEmpty }

	public private(set) var items: [T]

	public mutating func clear() {
		items.removeAll()
	}

	public func peek() -> T? {
		return items.last
	}

	public mutating func push(_ item: T?) {
		guard let item = item else { return }
		items.append(item)
	}

	public mutating func pop() -> T? {
		guard !items.isEmpty else { return nil }
		return items.removeLast()
	}

	public init(_ items: [T] = []) {
		self.items = items
	}
}
