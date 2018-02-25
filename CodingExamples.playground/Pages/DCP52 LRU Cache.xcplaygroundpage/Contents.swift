/* This problem was asked by Google.

Implement an LRU (Least Recently Used) cache. It should be able to be initialized with a cache size n, and contain the following methods:

set(key, value): sets key to value. If there are already n items in the cache and we are adding a new item, then it should also remove the least recently used item.
get(key): gets the value at key. If no such key exists, return nil.
Each operation should run in O(1) time.

Assuming that setting a key,value pair updates the most recently used as well

Solution: https://www.programcreek.com/2013/03/leetcode-lru-cache-java/
*/

import Foundation

// MARK: Solution

struct LRUCache<H: Hashable, T> {
	let capacity: Int

	private var start: ListNode<H, T>?

	private(set) var items: [H: ListNode<H, T>] = [:]
	private(set) var tail: ListNode<H, T>?

	private(set) var head: ListNode<H, T>? {
		get { return start }
		set {
			newValue?.next = start
			newValue?.previous = nil

			if let start = start {
				start.previous = newValue
			}

			start = newValue

			if tail == nil {
				tail = start
			}
		}
	}

	init(capacity: Int) {
		self.capacity = capacity
	}

	mutating func get(for key: H) -> T? {
		guard let item = items[key] else { return nil }
		remove(node: item)
		head = item
		return item.value
	}

	mutating func set(_ value: T, for key: H) {

		switch items[key] {
		case let old?:
			old.value = value
			remove(node: old)
			head = old
		case nil:
			let created = ListNode(key: key, value: value)

			if items.count >= capacity, let tail = tail {
				items.removeValue(forKey: tail.key)
				remove(node: tail)
			}

			head = created
			items[key] = created
		}
	}

	mutating func remove(node: ListNode<H, T>) {

		switch node.previous {
		case let previous?: previous.next = node.next
		case nil: head = node.next
		}

		switch node.next {
		case let next?: next.previous = node.previous
		case nil: tail = node.previous
		}
	}
}

// MARK: Tests

let testDate = Date()
print("Tests Started\n\n---\n")

// Arrange
var cache = LRUCache<String, Int>(capacity: 10)

// Act

let setNums = [1, 3, 2, 5, 4, 7, 6, 9, 8, 10, 12, 11]

print("\n\nGet test\n\n")

for i in setNums {
	cache.set(i, for: "\(i)")
	print("\(i) will set head \(cache.head?.value) tail \(cache.tail?.value)")
}

let getNums = Array(1...12)

print("\n\nGet test\n\n")

for i in getNums {
	let val = cache.get(for: "\(i)")
	print("\(val) will get head \(cache.head?.value) tail \(cache.tail?.value)")
}

print("---\n\nTests Ended:\n\telapsed: \(Date().timeIntervalSince(testDate))")
