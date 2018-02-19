//: Playground - noun: a place where people can play

import Foundation

extension String {

	var hasBalancedScope: Bool {
		let scopes: [String: String] = ["}" : "{", ")" : "(", "]": "["]

		var openStack: [String] = []

		for (i, char) in enumerated() {
			let str = String(char)
			guard !scopes.values.contains(str) else {
				openStack.append(str)
				continue
			}

			let hasOpeningBrace = !openStack.isEmpty && openStack.removeLast() == scopes[str]
			if !hasOpeningBrace { return false }
		}

		return openStack.isEmpty
	}

	subscript (i: Int) -> Character {
		return self[index(startIndex, offsetBy: i)]
	}
}


// Tests

struct TestValues {
	var data: String
	var result: Bool
}

var tests: [TestValues] = [
	TestValues(data: "([])[]({})", result: true),
	TestValues(data: "([)]", result: false),
	TestValues(data: "({[()]}]", result: false),
	TestValues(data: "]", result: false),
	TestValues(data: "((()", result: false)
]

for test in tests {
	let result = test.data.hasBalancedScope
	let success = result == test.result
	print("data: \(test.data) success: \(success) expected: \(test.result) actual: \(result)")
}

