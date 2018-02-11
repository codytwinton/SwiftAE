//: Playground - noun: a place where people can play

import Foundation

extension String {

	var hasBalancedScope: Bool {
		let closedChars = "})]"
		var count = (open: 0, closed: 0)

		for (i, char) in self.enumerated() {

			guard closedChars.contains(char) else {
				count.open += 1
				continue
			}

			guard i > 0 else { return false }

			count.closed += 1
			let previous = self[i - 1]

			guard !closedChars.contains(previous) else { continue }

			switch char {
			case "}" where previous == "{",
				 ")" where previous == "(",
				 "]" where previous == "[":
				continue
			default:
				return false
			}
		}

		return count.open == count.closed;
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
	guard result != test.result else { continue }
	print("data: \(test.data) expected: \(test.result) actual: \(result)")
}

