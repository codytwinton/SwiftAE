/* This problem was asked by Google.

The power set of a set is the set of all its subsets. Write a function that, given a set, generates its power set.

For example, given the set {1, 2, 3}, it should return {{}, {1}, {2}, {3}, {1, 2}, {1, 3}, {2, 3}, {1, 2, 3}}.
For example, given the string "abc", it should return ["", "a", "b", "c", "ab", "ac", "bc", "abc"].

You may also use a list or array to represent a set.
*/

import Foundation

// Solution

extension String {

	var powerSet: [String] {
		var set: [String] = [""]

		for el in self {
			var elSet: [String] = []

			for previous in set {
				elSet.append(previous + String(el))
			}

			set.append(contentsOf: elSet)
		}

		return set
	}
}

// Test Structure

struct TestValues {
	var input: String
	let result: [String]
}

var tests: [TestValues] = [
	TestValues(input: "",  result: [""]),
	TestValues(input: "abc",  result: ["", "a", "b", "c", "ab", "ac", "bc", "abc"])
]

// Tests

let date = Date()

print("Begin Tests: \(date.timeIntervalSinceNow)\n\n----------------\n")

for (index, test) in tests.enumerated() {
	let result = test.input.powerSet

	let wasSuccess = result.sorted() == test.result.sorted()
	print("\(wasSuccess ? "Passed" : "Failed") Test \(index):\n\tinput: \(test.input)\n\texpected: \(test.result)\n\tactual: \(result)\n")
}

print("\n----------------\n\nEnd Tests: \(date.timeIntervalSinceNow)")
