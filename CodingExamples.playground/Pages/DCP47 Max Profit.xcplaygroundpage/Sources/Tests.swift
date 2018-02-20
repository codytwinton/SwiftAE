import Foundation

public struct TestData: Testable {

	public static let tests: [TestData] = [
		TestData(input: [], expected: 0),
		TestData(input: [10], expected: 0),
		TestData(input: [10, 8, 6, 4, 2], expected: -2),
		TestData(input: [9, 11, 8, 5, 7, 10], expected: 5),
		TestData(input: [9, 11, 8, 5, 7, 10, 4, 8], expected: 5),
	]

	public var input: [Int]
	public let expected: Int
}
