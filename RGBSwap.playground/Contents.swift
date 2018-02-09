/* This problem was asked by Google.

Given an array of strictly the characters "R", "G", and "B", segregate the values of the array so that all the Rs come first, the Gs come second, and the Bs come last. You can only swap elements of the array.

Do this in linear time and in-place.

For example, given the array ["G", "B", "R", "R", "B", "R", "G"], it should become ["R", "R", "R", "G", "G", "B", "B"].
*/

import Foundation

// Solution

extension Array where Iterator.Element == String {

	public func rgbSwap() -> [String] {
		guard !self.isEmpty else { return self }
		return self
	}
}

// Tests

struct TestValues {
	let input: [String]
	let result: [String]
}

var tests: [TestValues] = [
	TestValues(input: ["G", "B", "R", "R", "B", "R", "G"],  result: ["R", "R", "R", "G", "G", "B", "B"])
]

for (index, test) in tests.enumerated() {
	let result = test.input.rgbSwap()

	switch result == test.result {
	case false:
		print("Failed test \(index). expected: \(test.result) actual: \(result)")
	case true:
		print("Passed test \(index). result: \(result)")
	}
}

