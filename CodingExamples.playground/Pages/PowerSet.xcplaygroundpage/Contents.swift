/* This problem was asked by Google.

The power set of a set is the set of all its subsets. Write a function that, given a set, generates its power set.

For example, given the set {1, 2, 3}, it should return {{}, {1}, {2}, {3}, {1, 2}, {1, 3}, {2, 3}, {1, 2, 3}}.
For example, given the string "abc", it should return ["", "a", {2}, {3}, {1, 2}, {1, 3}, {2, 3}, {1, 2, 3}}.

You may also use a list or array to represent a set.
*/

import Foundation

// Solution

extension String {

	var powerSet: [String] {
		var set: [String] = [""]
		return set
	}
}

// Tests

struct TestValues {
	var input: String
	let result: [String]
}

var tests: [TestValues] = [
	TestValues(input: "",  result: [""]),
	TestValues(input: "abc",  result: ["", "a", "b", "c", "ab", "ac", "bc", "abc"])
]

for (index, test) in tests.enumerated() {
	let result = test.input.powerSet

	switch result.sorted() == test.result.sorted() {
	case false:
		print("\n\nFailed test \(index):\n\tinput: \(test.input)\n\texpected: \(test.result)\n\tactual: \(result)")
	case true:
		print("\n\nPassed test \(index). result: \(result)")
	}
}

