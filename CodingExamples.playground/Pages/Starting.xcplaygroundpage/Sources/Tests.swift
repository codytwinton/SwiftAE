import Foundation

public struct TestData: Testable {

	public static let tests: [TestData] = [
		TestData(input: "Input", expected: "Expected"),
	]

	public var input: String
	public let expected: String

	public func assert(with actual: String) {
		self.log(success: actual == expected, actual: actual)
	}
}
