import Foundation

public struct TestData: Testable {

	public static let tests: [TestData] = [
		TestData(input: [], expected: []),
		TestData(input: [1], expected: [1]),
		TestData(input: [1, 2], expected: [1, 2].reversed()),
		TestData(input: [0, 7, 18, 3, 8, 17], expected: [0, 7, 18, 3, 8, 17].reversed()),
	]

	public var input: [Int]
	public let expected: [Int]

	public func assert(with actual: [Int]) {
		self.log(success: actual == expected, actual: actual)
	}
}
