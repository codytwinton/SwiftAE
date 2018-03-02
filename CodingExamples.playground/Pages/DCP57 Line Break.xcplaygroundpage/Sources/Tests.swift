/* This problem was asked by Amazon.

Given a string s and an integer k, break up the string into multiple texts such that each text has a length of k or less. You must break it up so that words don't break across lines. If there's no way to break the text up, then return null.

You can assume that there are no spaces at the ends of the string and that there is exactly one space between each word.

For example, given the string "the quick brown fox jumps over the lazy dog" and k = 10, you should return: ["the quick", "brown fox", "jumps over", "the lazy", "dog"]. No string in the list has a length of more than 10.
*/

import Foundation

public struct TestData: Testable {

	public static let tests: [TestData] = [
		TestData(input: (length: 10, text: "the quick brown fox jumps over the lazy dog"), expected: ["the quick", "brown fox", "jumps over", "the lazy", "dog"]),
		TestData(input: (length: 10, text: "the quick brown fox jumps overs the lazy dog"), expected: ["the quick", "brown fox", "jumps", "overs the", "lazy dog"]),
		TestData(input: (length: 10, text: "the testingsetseio te seg"), expected: []),
		TestData(input: (length: 10, text: ""), expected: []),
	]

	public var input: (length: Int, text: String)
	public let expected: [String]

	public func assert(with actual: [String]) {
		log(success: actual == expected, actual: actual)
	}
}
