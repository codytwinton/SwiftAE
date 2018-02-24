import Foundation

public struct Queue<T> {

	public var count: Int { return items.count }
	public var isEmpty: Bool { return items.isEmpty }

	public private(set) var items: [T]

	public mutating func clear() {
		items.removeAll()
	}

	public func peek() -> T? {
		return items.first
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
