import Foundation

public struct TestData: Testable {

	public static let tests: [TestData] = [
		TestData(input: (a: 1...10, b: 1...9), expected: true),
		TestData(input: (a: 1...10, b: 9...11), expected: true),
		TestData(input: (a: 1...10, b: 11...20), expected: false),
		TestData(input: (a: 1...10, b: -10...0), expected: false),
		TestData(input: (a: 1...9, b: 1...10), expected: true),
		TestData(input: (a: 9...11, b: 1...10), expected: true),
		TestData(input: (a: 11...20, b: 1...10), expected: false),
		TestData(input: (a: -10...0, b: 1...10), expected: false),
	]

	public var input: (a: CountableClosedRange<Int>, b: CountableClosedRange<Int>)
	public let expected: Bool
}
