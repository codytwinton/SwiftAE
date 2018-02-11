/* This problem was asked by Google.

The power set of a set is the set of all its subsets. Write a function that, given a set, generates its power set.

For example, given the set {1, 2, 3}, it should return {{}, {1}, {2}, {3}, {1, 2}, {1, 3}, {2, 3}, {1, 2, 3}}.
For example, given the string "abc", it should return ["", "a", "b", "c", "ab", "ac", "bc", "abc"].

You may also use a list or array to represent a set.
*/

import Foundation

// Solution

extension String {

	var powerSet: Set<String> {
		var set: [String] = [""]

		for char in self {
			let next = String(char)

			for index in 0..<set.count {
				set.append(set[index] + next)
			}
		}

		return Set(set)
	}
}

// Test Structure

struct TestValues {
	var input: String
	let result: Set<String>
}

var tests: [TestValues] = [
	TestValues(input: "",  result: [""]),
	TestValues(input: "abc",  result: ["", "a", "b", "c", "ab", "ac", "bc", "abc"]),
	TestValues(input: "asdf",  result: ["", "a", "s", "as", "d", "ad", "sd", "asd", "f", "af", "sf", "asf", "df", "adf", "sdf", "asdf"])
]

// Tests

for (index, test) in tests.enumerated() {
	let result = test.input.powerSet

	let wasSuccess = result == test.result

	print("""
	\(wasSuccess ? "Passed" : "Failed") Test \(index):
		input: "\(test.input)"
		expected: \(test.result)
		actual: \(result)

	""")
}
