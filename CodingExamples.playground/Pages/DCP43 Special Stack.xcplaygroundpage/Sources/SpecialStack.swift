/* This problem was asked by Amazon.

Implement a stack that has the following methods:

push(val), which pushes an element onto the stack
pop(), which pops off and returns the topmost element of the stack. If there are no elements in the stack, then it should throw an error or return null.
max(), which returns the maximum value in the stack currently. If there are no elements in the stack, then it should throw an error or return null.
Each method should run in constant time.
*/

import Foundation

public struct SpecialStack<T>: Stackable {

	public typealias Element = T

	public var count: Int { return items.count }
	public var isEmpty: Bool { return items.isEmpty }

	private var maxVal: T?
	private var items: [T]

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

	public func all() -> [T] {
		return items
	}

	public init(_ items: [T] = []) {
		self.items = items
	}
}
