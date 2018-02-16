import Foundation

public struct TestData: Testable {

	public static let tests: [TestData] = [
		TestData(input: 0, expected: 1),
		TestData(input: 1, expected: 1),
		TestData(input: 3, expected: 6),
		TestData(input: 5, expected: 120),
		TestData(input: 10, expected: 3628800),
		TestData(input: 15, expected: 1307674368000),
	]

	public var input: Int
	public let expected: Int
}
