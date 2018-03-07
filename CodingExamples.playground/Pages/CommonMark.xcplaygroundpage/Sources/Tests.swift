import Foundation

public struct TestData: Testable {

	public static let tests: [TestData] = [
		TestData(input: "## \n#\n### ###\n",
				 expected: "<h2></h2>\n<h1></h1>\n<h3></h3>\n"),
	]

	public var input: String
	public let expected: String
}
