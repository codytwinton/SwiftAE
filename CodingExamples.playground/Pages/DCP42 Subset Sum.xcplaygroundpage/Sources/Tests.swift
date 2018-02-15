import Foundation

public struct TestData: Testable {

	public static let tests: [TestData] = [
		TestData(input: (nums: [], target: 1), expected: []),
		TestData(input: (nums: [1, 3, 5], target: 24), expected: []),
		TestData(input: (nums: [12, 1, 61, 5, 9, 2], target: 24), expected: [12, 9, 2, 1]),
		TestData(input: (nums: [12, 2, 61, 5, 9, 2], target: 24), expected: []),
		TestData(input: (nums: [24, 12, 1, 3, 2, 6], target: 24), expected: [12, 6, 3, 2, 1]),
	]

	public var input: (nums: [Int], target: Int)
	public let expected: [Int]

	public func assert(with actual: [Int]) {
		self.log(success: actual.sorted() == expected.sorted(), actual: actual)
	}
}
