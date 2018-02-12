import Foundation

public struct TestData: Testable {

	public static let tests: [TestData] = [
		TestData(input:
			(words: ["the", "quick", "brown", "fox", "jumps", "over", "the", "lazy", "dog"], charCount: 16),
				   expected: ["the  quick brown", "fox  jumps  over", "the   lazy   dog"]
		)
	]

	public let input: (words: [String], charCount: Int)
	public let expected: [String]

	public func assert(with actual: [String]) {
		self.log(success: actual == expected, actual: actual)
	}
}
