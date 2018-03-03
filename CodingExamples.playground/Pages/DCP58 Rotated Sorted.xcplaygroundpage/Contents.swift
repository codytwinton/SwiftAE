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

		var leftIndex = 0
		var rightIndex = count - 1

		while leftIndex < rightIndex {
			let middleIndex = (leftIndex + rightIndex) / 2
			let middle = self[middleIndex]
			guard middle != element else { return middleIndex }

			var leanLeft: Bool = false

			if middle > firstVal {
				leanLeft = firstVal...middle ~= element
			} else if middle < lastVal {
				leanLeft = middle...lastVal ~= element
			} else {
				leanLeft = middle != firstVal
			}

			switch leanLeft {
			case true:
				rightIndex = middleIndex - 1
			case false:
				leftIndex = middleIndex + 1
			}

			guard self[leftIndex] != element else { return leftIndex }
			guard self[rightIndex] != element else { return rightIndex }
		}

		return -1
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
