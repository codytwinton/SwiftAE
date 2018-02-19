import Foundation

public struct TestData: Testable {

	public static let tests: [TestData] = [
		TestData(input: "", expected: ""),
		TestData(input: "a", expected: "a"),
		TestData(input: "ab", expected: ""),
		TestData(input: "abc", expected: ""),
		TestData(input: "aba", expected: "aba"),
		TestData(input: "aabcdcb", expected: "bcdcb"),
		TestData(input: "bananas", expected: "anana"),
		TestData(input: "myracecarhere", expected: "racecar"),
		TestData(input: "testnoon", expected: "noon"),
		TestData(input: "civiccar", expected: "civic"),
		TestData(input: "civic", expected: "civic"),
		TestData(input: "abababababababababababababababababababababababababababababababababababababababababab", expected: "abababababababababababababababababababababababababababababababababababababababababa"),
		TestData(input: repeatElement("abcdefghijklmnopqrstuvwxyz", count: 5).joined(), expected: ""),
	]

	public var input: String
	public let expected: String
}
