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
		var set: Set<String> = [""]

		for char in self {
			let next = String(char)
			var add

			var add: Set<String> = []

			for item in set {
				add.insert(item + next)
			}

			set.formUnion(add)
		}

		return set
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
	TestValues(input: "asdf",  result: ["", "a", "s", "as", "d", "ad", "sd", "asd", "f", "af", "sf", "asf", "df", "adf", "sdf", "asdf"]),
	TestValues(input: "asdfghj",  result: ["adghj", "dfg", "sdfghj", "asdfgj", "asdfj", "df", "asdh", "dhj", "asdj", "dgh", "sfghj", "sfhj", "sdf", "sdfj", "asdghj", "ad", "sfgh", "asfghj", "", "fh", "asdgh", "adfg", "sg", "afgh", "asdf", "asg", "afgj", "adf", "sfh", "asdhj", "sgj", "adfgh", "sdfhj", "dfghj", "aghj", "ahj", "agh", "asdfghj", "ah", "f", "sdj", "fgh", "adfhj", "asdfhj", "a", "sd", "asfj", "g", "dfj", "sfg", "asj", "asghj", "sdgj", "dgj", "asgj", "ashj", "sdg", "fg", "asfgj", "afhj", "afg", "asgh", "hj", "aj", "fgj", "dg", "dghj", "j", "adfghj", "sdgh", "sdfgj", "asfhj", "dfgh", "asfgh", "asdfgh", "ghj", "fhj", "sdfgh", "adj", "as", "asd", "adgh", "adh", "sj", "adhj", "shj", "sghj", "asdgj", "sf", "fj", "ag", "dfhj", "sdhj", "sdh", "gj", "fghj", "af", "adfh", "sgh", "sh", "afj", "afh", "ash", "asdg", "h", "adgj", "adg", "adfj", "sdghj", "afghj", "asdfh", "d", "asfh", "agj", "sfgj", "sdfh", "asf", "asfg", "dfh", "adfgj", "dfgj", "asdfg", "s", "gh", "dj", "sfj", "dh", "sdfg"]
	)
]

// Tests

let testDate = Date()
print("Tests Started\n\n---\n")

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

print("---\n\nTests Ended:\n\telapsed: \(Date().timeIntervalSince(testDate))")
