//: Playground - noun: a place where people can play

import Foundation

class RunLengthCoder {

	static func encode(_ val: String) -> String {

		guard var currentChar = val.first else { return "" }
		var count = 0
		var encoded = ""

		for char in val {
			guard char != currentChar else {
				count += 1
				continue
			}

			encoded += "\(count)\(currentChar)"
			currentChar = char
			count = 1
		}

		encoded += "\(count)\(currentChar)"
		return encoded
	}

	static func decode(_ val: String) -> String {
		return ""
	}
}


// Tests

struct TestValues {
	let encoded: String
	let decoded: String
}

var tests: [TestValues] = [
	TestValues(encoded: "4A3B2C1D2A", decoded: "AAAABBBCCDAA")
]

var hasFailed = false

for test in tests {

	let decoded = RunLengthCoder.decode(test.encoded)
	let encoded = RunLengthCoder.encode(test.decoded)

	if decoded != test.decoded {
		print("Decoding Failed. Expected: \(test.decoded) Actual: \(decoded)")
		hasFailed = true
	}

	if encoded != test.encoded {
		print("Encoding Failed. Expected: \(test.encoded) Actual: \(encoded)")
		hasFailed = true
	}
}

if !hasFailed { print("All tests passed") }
