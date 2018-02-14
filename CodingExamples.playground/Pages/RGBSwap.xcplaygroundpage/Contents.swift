/* This problem was asked by Google.

Given an array of strictly the characters "R", "G", and "B", segregate the values of the array so that all the Rs come first, the Gs come second, and the Bs come last. You can only swap elements of the array.

Do this in linear time and in-place.

For example, given the array ["G", "B", "R", "R", "B", "R", "G"], it should become ["R", "R", "R", "G", "G", "B", "B"].
*/

import Foundation

// Solution

extension Array where Iterator.Element == String {

	public mutating func rgbSwap() -> [String] {
		guard !isEmpty else { return self }

		for i in 0..<(count - 1) {
			var swapIndex = i

			for j in (i + 1)..<(count) {
				let current = self[swapIndex]
				let next = self[j]

				guard next >= current else { continue }
				swapIndex = j
			}

			swapAt(i, swapIndex)
		}

		return self
	}
}

// Tests

struct TestValues {
	var input: [String]
	let result: [String]
}

var tests: [TestValues] = [
	TestValues(input: [],  result: []),
	TestValues(input: [""],  result: [""]),
	TestValues(input: ["B", "G", "R"],  result: ["R", "G", "B"]),
	TestValues(input: ["G", "B", "R", "R", "B", "R", "G"],  result: ["R", "R", "R", "G", "G", "B", "B"])
]

for (index, var test) in tests.enumerated() {
	let result = test.input.rgbSwap()

	switch result == test.result {
	case false:
		print("\n\nFailed test \(index):\n\tinput: \(test.input)\n\texpected: \(test.result)\n\tactual: \(result)")
	case true:
		print("\n\nPassed test \(index). result: \(result)")
	}
}


