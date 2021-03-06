import Foundation

public protocol Queueable {
	associatedtype Element

	var count: Int { get }
	var isEmpty: Bool { get }
	var items: [Element] { get }

	func peek() -> Element?

	mutating func clear()
	mutating func enqueue(_ item: Element?)
	mutating func dequeue() -> Element?

	init(_ items: [Element])
}

public struct Queue<T>: Queueable {

	public typealias Element = T

	public var count: Int { return items.count }
	public var isEmpty: Bool { return items.isEmpty }

	public private(set) var items: [T]

	public func peek() -> T? {
		return items.first
	}

	public mutating func clear() {
		items.removeAll()
	}

	public mutating func enqueue(_ item: T?) {
		guard let item = item else { return }
		items.append(item)
	}

	public mutating func dequeue() -> T? {
		guard !items.isEmpty else { return nil }
		return items.removeFirst()
	}

	public init(_ items: [T] = []) {
		self.items = items
	}
}
