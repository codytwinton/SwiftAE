/* This problem was asked by Amazon.

An sorted array of integers was rotated an unknown number of times.

Given such an array, find the index of the element in the array in faster than linear time. If the element doesn't exist in the array, return null.

For example, given the array [13, 18, 25, 2, 8, 10] and the element 8, return 4 (the index of 8 in the array).

You can assume all the integers in the array are unique.
*/

import Foundation

// MARK: Solution

extension Array where Iterator.Element == Int {

	func indexInRotatedSorted(of element: Int) -> Int {
		guard !isEmpty else { return -1 }
		guard count > 1, let firstVal = first, let lastVal = last else { return first == element ? 0 : -1 }

		guard let pivotIndex = findPivotIndex() else { return -1 }

		let largest = self[pivotIndex]
		guard largest != element else { return pivotIndex }

		var low = firstVal...largest ~= element ? 0 : pivotIndex + 1
		var high = low == 0 ? pivotIndex : count - 1

		while low <= high {
			let midIndex = (low + high) / 2
			let mid = self[midIndex]
			guard mid != element else { return midIndex }

			switch mid > element {
			case true:
				high = midIndex - 1
			case false:
				low = midIndex + 1
			}
		}

		return -1
	}

	private func findPivotIndex() -> Int? {
		guard !isEmpty else { return nil }
		guard count > 1 else { return 0 }

		var low = 0
		var high = count - 1

		while low < high {
			let mid = (low + high)/2

			if mid < high && self[mid] > self[mid + 1] {
				return mid
			}

			if mid > low && self[mid] < self[mid - 1] {
				return mid - 1
			}

			if self[low] >= self[mid] {
				high = mid - 1
			} else {
				low = mid + 1
			}
		}

		return nil
	}
}

// MARK: Tests

let testDate = Date()
print("Tests Started\n\n---\n")

for test in TestData.tests {
	// Arrange
	let input = test.input

	// Act
	let actual = input.array.indexInRotatedSorted(of: input.element)

	// Assert
	test.assert(with: actual)
}

print("---\n\nTests Ended:\n\telapsed: \(Date().timeIntervalSince(testDate))")
