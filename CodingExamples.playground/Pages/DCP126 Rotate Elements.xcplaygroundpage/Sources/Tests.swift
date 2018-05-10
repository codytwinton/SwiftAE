import Foundation

public struct TestData: Testable {

	public static let tests: [TestData] = [
		TestData(input: (arr: [], k: 0), expected: []),
		TestData(input: (arr: [], k: 1), expected: []),
		TestData(input: (arr: [1], k: 0), expected: [1]),
		TestData(input: (arr: [1], k: 1), expected: [1]),
		TestData(input: (arr: [1], k: 2), expected: [1]),
		TestData(input: (arr: [1, 2], k: 0), expected: [1, 2]),
		TestData(input: (arr: [1, 2], k: 1), expected: [2, 1]),
		TestData(input: (arr: [1, 2], k: 2), expected: [1, 2]),
		TestData(input: (arr: [1, 2, 3, 4, 5, 6], k: 2), expected: [3, 4, 5, 6, 1, 2]),
	]

	public var input: (arr: [Int], k: Int)
	public let expected: [Int]

	public func assert(with actual: [Int]) {
		self.log(success: actual == expected, actual: actual)
	}
}
