import Foundation

public struct TestData: Testable {

	public static let tests: [TestData] = [
		TestData(input: [], expected: 0),
		TestData(input: [6, 1, 3, 3, 3, 6, 6], expected: 1),
		TestData(input: [13, 19, 13, 13], expected: 19),
	]

	public let input: [Int]
	public let expected: Int
}
