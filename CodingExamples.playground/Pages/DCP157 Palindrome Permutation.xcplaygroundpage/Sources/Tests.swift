import Foundation

public struct TestData: Testable {
	
	public static let tests: [TestData] = [
		TestData(input: "carrace", expected: true),
		TestData(input: "daily", expected: false),
	]
	
	public var input: String
	public let expected: Bool
	
	public func assert(with actual: Bool) {
		self.log(success: actual == expected, actual: actual)
	}
}
