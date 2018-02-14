import Foundation

public struct TestData: Testable {

	public static let tests: [TestData] = [
		TestData(input: [], expected: 0),
		TestData(input: [3, 1, 3, 3], expected: 1),
		TestData(input: [1, 3, 1, 1], expected: 3),
		TestData(input: [6, 1, 3, 3, 3, 6, 6], expected: 1),
		TestData(input: [13, 19, 13, 13], expected: 19),
		TestData(input: [5, 5, 94, 37, 37, 5, 37, 90, 107, 90, 107, 90, 107], expected: 94),
	]

	public let input: [Int]
	public let expected: Int
}
