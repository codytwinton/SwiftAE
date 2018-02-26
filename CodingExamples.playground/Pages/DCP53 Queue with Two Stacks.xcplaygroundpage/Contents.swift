/* This problem was asked by Apple.

Implement a queue using two stacks. Recall that a queue is a FIFO (first-in, first-out) data structure with the following methods: enqueue, which inserts an element into the queue, and dequeue, which removes it.
*/

import Foundation

// MARK: Solution

struct StackQueue<T> {

	public var count: Int { return enqueuedStack.count + dequeuedStack.count }
	public var isEmpty: Bool { return enqueuedStack.isEmpty && dequeuedStack.isEmpty }

	private var enqueuedStack: Stack<T>
	private var dequeuedStack: Stack<T> = Stack()

	private mutating func swapStacks() {
		guard !enqueuedStack.isEmpty || !dequeuedStack.isEmpty else { return }

		switch enqueuedStack.isEmpty {
		case true:
			while !dequeuedStack.isEmpty {
				enqueuedStack.push(dequeuedStack.pop())
			}
		case false:
			while !enqueuedStack.isEmpty {
				dequeuedStack.push(enqueuedStack.pop())
			}
		}
	}

	public mutating func items() -> [T] {
		if !dequeuedStack.isEmpty {
			swapStacks()
		}

		return enqueuedStack.items
	}

	public mutating func peek() -> T? {
		return items().first
	}

	public mutating func clear() {
		enqueuedStack.clear()
		dequeuedStack.clear()
	}

	public mutating func enqueue(_ item: T?) {
		guard let item = item else { return }
		if !dequeuedStack.isEmpty {
			swapStacks()
		}

		enqueuedStack.push(item)
	}

	public mutating func dequeue() -> T? {

		if !enqueuedStack.isEmpty {
			swapStacks()
		}

		guard !dequeuedStack.isEmpty else { return nil }
		return dequeuedStack.pop()
	}

	public init(_ items: [T] = []) {
		self.enqueuedStack = Stack(items)
	}
}

// MARK: Tests

var queue = StackQueue<Int>()

for i in 1...10 {
	queue.enqueue(i)
}

print("enqueue: \(queue.items() == Array(1...10) ? "✅" : "🛑")")

var dequeued: [Int] = []

for _ in 1...5 {
	guard let i = queue.dequeue() else { continue }
	dequeued.append(i)
}

print("dequeue queue: \(queue.items() == Array(6...10) ? "✅" : "🛑")")
print("dequeued: \(dequeued == Array(1...5) ? "✅" : "🛑")")
