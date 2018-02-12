import Foundation

public struct TestData: Testable {

	public static let tests: [TestData] = [
		TestData(input: [], expected: []),
		TestData(input: [1, 2, 3, 4, 5], expected: [120, 60, 40, 30, 24]),
		TestData(input: [3, 2, 1], expected: [2, 3, 6]),
	]

	public let input: [Int]
	public let expected: [Int]

	public func assert(with actual: [Int]) {
		self.log(success: actual == expected, actual: actual)
	}
}
