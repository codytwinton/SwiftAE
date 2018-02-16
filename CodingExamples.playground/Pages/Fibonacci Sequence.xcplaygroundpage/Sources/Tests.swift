import Foundation

public struct TestData: Testable {

	public static let tests: [TestData] = [
		TestData(input: 0, expected: []),
		TestData(input: 1, expected: [0, 1]),
		TestData(input: 3, expected: [0, 1, 1, 2]),
		TestData(input: 5, expected: [0, 1, 1, 2, 3, 5]),
		]

	public var input: Int
	public let expected: [Int]

	public func assert(with actual: [Int]) {
		log(success: actual == expected, actual: actual)
	}
}
