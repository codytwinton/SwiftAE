/* This problem was asked by Google.

Implement an LRU (Least Recently Used) cache. It should be able to be initialized with a cache size n, and contain the following methods:

set(key, value): sets key to value. If there are already n items in the cache and we are adding a new item, then it should also remove the least recently used item.
get(key): gets the value at key. If no such key exists, return null.
Each operation should run in O(1) time.
*/

import Foundation

// MARK: Solution

struct LRUCache<T> {

	let capacity: Int
	private var items: [String: T] = [:]

	init(capacity: Int) {
		self.capacity = capacity
	}

	mutating func set(_ value: T, for key: String) {
		self.items[key] = value
	}

	func get(for key: String) -> T? {
		return items[key]
	}
}

// MARK: Tests

let testDate = Date()
print("Tests Started\n\n---\n")

for test in TestData.tests {
	// Arrange
	let input = test.input
	var cache = LRUCache<Int>(capacity: 10)

	// Act
	//let actual = handleProblem(for: input)

	// Assert
	//test.assert(with: actual)
}

print("---\n\nTests Ended:\n\telapsed: \(Date().timeIntervalSince(testDate))")
