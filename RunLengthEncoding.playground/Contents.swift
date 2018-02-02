//: Playground - noun: a place where people can play

import Foundation

class RunLengthCoder {

	static func encode(_ val: String) -> String {
		return ""
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
		print("Test Failed. Expected: \(test.decoded) Actual: \(decoded)")
		hasFailed = true
	}

	if encoded != test.encoded {
		print("Test Failed. Expected: \(test.encoded) Actual: \(encoded)")
		hasFailed = true
	}
}

if !hasFailed { print("All tests passed") }
