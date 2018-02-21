import Foundation

public struct TestData: Testable {

	public static let tests: [TestData] = [
		TestData(input: (preOrder: [], inOrder: []), expected: BinaryNode(value: 0)),
		TestData(input: (preOrder: [0, 1, 3, 4, 2, 5, 6], inOrder: [3, 1, 4, 0, 5, 2, 6]), expected: BinaryNode(value: 0))
	]

	public var input: (preOrder: [Int], inOrder: [Int])
	public let expected: BinaryNode

	public func assert(with actual: BinaryNode) {
		log(success: actual.value == expected.value, actual: actual)
	}
}
