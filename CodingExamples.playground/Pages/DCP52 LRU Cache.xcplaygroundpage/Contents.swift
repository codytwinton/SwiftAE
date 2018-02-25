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

	private(set) var items: [H: ListNode<H, T>] = [:]
	private(set) var head: ListNode<H, T>?
	private(set) var tail: ListNode<H, T>?

	init(capacity: Int) {
		self.capacity = capacity
	}

	mutating func get(for key: H) -> T? {
		guard let item = items[key] else { return nil }
		remove(node: item)
		setHead(node: item)
		return item.value
	}

	mutating func set(_ value: T, for key: H) {

		if let old = items[key] {
			old.value = value
			remove(node: old)
			setHead(node: old)
		} else {
			var created = ListNode(key: key, value: value)

			if items.count >= capacity, let tail = tail {
				items.removeValue(forKey: tail.key)
				remove(node: tail)
				setHead(node: created)
			} else{
				setHead(node: created)
			}

			items[key] = created
		}
	}

	mutating func remove(node: ListNode<H, T>) {

		if let previous = node.previous {
			previous.next = node.next
		} else {
			head = node.next
		}

		if let next = node.next {
			next.previous = node.previous
		} else {
			tail = node.previous
		}
	}

	mutating func setHead(node: ListNode<H, T>) {
		node.next = head
		node.previous = nil

		if let head = head {
			head.previous = node
		}

		head = node

		guard tail == nil else { return }
		tail = head
	}
}

// MARK: Tests

let testDate = Date()
print("Tests Started\n\n---\n")

for test in TestData.tests {
	// Arrange
	let input = test.input
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

		print("\(i) will get head \(cache.head?.value) tail \(cache.tail?.value)")

		if i == 1 || i == 3, val == nil {
			//print("worked for deletion")
		}

		if let val = val {
			//print("val valid for i \(i)")
		}
	}
}

print("---\n\nTests Ended:\n\telapsed: \(Date().timeIntervalSince(testDate))")
