import Foundation

public struct TestData: Testable {

	public static let tests: [TestData] = [
		TestData(input: [], expected: []),
		TestData(input: Array(1...1), expected: [1]),
		TestData(input: Array(1...2), expected: [1, 2]),
		TestData(input: Array(1...3), expected: [1, 3, 2]),
		TestData(input: Array(1...4), expected: [1, 4, 2, 3]),
		TestData(input: Array(1...5), expected: [1, 5, 2, 4, 3]),
		TestData(input: Array(1...6), expected: [1, 6, 2, 5, 3, 4])
	]

	public var input: [Int]
	public let expected: [Int]

	public func assert(with actual: [Int]) {
		self.log(success: actual == expected, actual: actual)
	}
}
