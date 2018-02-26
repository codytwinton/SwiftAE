/* Problem Statements

Given the String "Input", return "Expected"
*/

import Foundation

// MARK: Solution

struct StackQueue<T>: Queueable {

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

// MARK: Tests

var queue = StackQueue<Int>()

for i in 1...10 {
	queue.enqueue(i)
}

print("enqueue: \(queue.items == Array(1...10) ? "✅" : "🛑")")

var dequeued: [Int] = []

for _ in 1...5 {
	guard let i = queue.dequeue() else { continue }
	dequeued.append(i)
}

print("dequeue queue: \(queue.items == Array(6...10) ? "✅" : "🛑")")
print("dequeued: \(dequeued == Array(1...5) ? "✅" : "🛑")")
