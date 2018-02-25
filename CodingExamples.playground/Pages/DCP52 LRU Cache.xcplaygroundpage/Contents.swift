/* This problem was asked by Google.

Implement an LRU (Least Recently Used) cache. It should be able to be initialized with a cache size n, and contain the following methods:

set(key, value): sets key to value. If there are already n items in the cache and we are adding a new item, then it should also remove the least recently used item.
get(key): gets the value at key. If no such key exists, return null.
Each operation should run in O(1) time.

Assuming that setting a key,value pair updates the most recently used as well
*/

import Foundation

// MARK: Solution

struct LRUCache<T> {

	let capacity: Int
	private(set) var items: [String: T] = [:]
	private(set) var itemKeys: [String] = []

	init(capacity: Int) {
		self.capacity = capacity
	}

	mutating func set(_ value: T, for key: String) {
		items[key] = value

		for (index, itemKey) in itemKeys.enumerated() {
			guard key == itemKey, index != 0 else { continue }
			itemKeys.remove(at: index)
			break
		}

		itemKeys.insert(key, at: 0)
		guard itemKeys.count > capacity else { return }
		let key = itemKeys.last ?? ""
		items.removeValue(forKey: key)
		itemKeys.removeLast()
	}

	mutating func get(for key: String) -> T? {
		guard key != itemKeys.first else { return items[key] }

		for (index, itemKey) in itemKeys.enumerated() {
			guard key == itemKey, index != 0 else { continue }
			itemKeys.remove(at: index)
			itemKeys.insert(key, at: 0)
			break
		}

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

	let setNums = [1, 3, 2, 5, 4, 7, 6, 9, 8, 10, 12, 11]
	let setNumKeys: [String] = setNums.filter {$0 != 1 && $0 != 3}.map {"\($0)"}.reversed()

	for i in setNums {
		cache.set(i, for: "\(i)")
		//print("itemKeys \(cache.itemKeys)")
	}

	if cache.itemKeys == setNumKeys {
		print("\n\n✅ Worked for Setting\n\n")
	} else {
		print("\n\n🛑 Failed for Setting\n\n")
	}

	let getNums = Array(1...12)
	let getNumKeys: [String] = getNums.filter {$0 != 1 && $0 != 3}.map {"\($0)"}.reversed()

	for i in getNums {
		let val = cache.get(for: "\(i)")

		//print("cache.itemKeys after i fetch \(i) \(cache.itemKeys)")

		if i == 1 || i == 3, val == nil {
			//print("worked for deletion")
		}

		if let val = val {
			//print("val valid for i \(i)")
		}
	}

	if (cache.itemKeys == getNumKeys) {
		print("\n\n✅ Worked for Getting\n\n")
	} else {
		print("\n\n🛑 Failed for Setting\n\n")
	}

	//let actual = handleProblem(for: input)

	// Assert
	//test.assert(with: actual)
}

print("---\n\nTests Ended:\n\telapsed: \(Date().timeIntervalSince(testDate))")
