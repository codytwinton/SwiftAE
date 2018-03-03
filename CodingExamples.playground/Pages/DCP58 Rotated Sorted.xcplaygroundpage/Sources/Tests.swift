import Foundation

public struct TestData: Testable {

	public static let tests: [TestData] = [
		TestData(input: (array: [], element: 1), expected: -1),
		TestData(input: (array: [0], element: 1), expected: -1),
		TestData(input: (array: [1], element: 1), expected: 0),
		TestData(input: (array: [13, 18, 25, 2, 8, 10], element: 13), expected: 0),
		TestData(input: (array: [13, 18, 25, 2, 8, 10], element: 18), expected: 1),
		TestData(input: (array: [13, 18, 25, 2, 8, 10], element: 25), expected: 2),
		TestData(input: (array: [13, 18, 25, 2, 8, 10], element: 2), expected: 3),
		TestData(input: (array: [13, 18, 25, 2, 8, 10], element: 8), expected: 4),
		TestData(input: (array: [13, 18, 25, 2, 8, 10], element: 10), expected: 5),
		TestData(input: (array: [13, 18, 25, 2, 8, 10], element: 7), expected: -1),
		TestData(input: (array: Array(50...100) + Array(1...49), element: 11), expected: 5),
	]

	public var input: (array: [Int], element: Int)
	public let expected: Int
}
