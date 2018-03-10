/*: This problem was asked by Amazon.

Given a N by M matrix of numbers, print out the matrix in a clockwise spiral.

For example, given the following matrix:

[[1, 2,  3,  4,  5],
[6,  7,  8,  9,  10],
[11, 12, 13, 14, 15],
[16, 17, 18, 19, 20]]

You should print out the following:

[1, 2, 3, 4, 5, 10, 15, 20, 19, 18, 17, 16, 11, 6, 7, 8, 9, 14, 13, 12]
*/

import Foundation

public struct TestData: Testable {

	public static let tests: [TestData] = [
		TestData(input: [], expected: []),
		TestData(input: [[1]], expected: [1]),
		TestData(input: [[1, 2],
						 [3, 4]], expected: [1, 2, 4, 3]),
		TestData(input: [[1, 2, 3, 4, 5],
						 [6, 7, 8, 9, 10],
						 [11, 12, 13, 14, 15],
						 [16, 17, 18, 19, 20]], expected: [1, 2, 3, 4, 5, 10, 15, 20, 19, 18, 17, 16, 11, 6, 7, 8, 9, 14, 13, 12]),
	]

	public var input: [[Int]]
	public let expected: [Int]

	public func assert(with actual: [Int]) {
		self.log(success: actual == expected, actual: actual)
	}
}
