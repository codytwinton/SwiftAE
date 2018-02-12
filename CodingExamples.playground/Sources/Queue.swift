import Foundation

public struct Queue<T> {

	public var count: Int { return items.count }
	public var isEmpty: Bool { return items.isEmpty }

	private var items: [T]

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

	public func all() -> [T] {
		return items
	}

	public init(_ items: [T] = []) {
		self.items = items
	}
}
