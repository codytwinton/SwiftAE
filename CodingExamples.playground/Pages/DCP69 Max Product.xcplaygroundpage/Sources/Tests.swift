/*: This problem was asked by Facebook.

Given a list of integers, return the largest product that can be made by multiplying any three integers.

For example, if the list is [-10, -10, 5, 2], we should return 500, since that's -10 * -10 * 5.

You can assume the list has at least three integers.
*/

import Foundation

public struct TestData: Testable {

	public static let tests: [TestData] = [
		TestData(input: [-15, -10, -20, -5], expected: -1500),
		TestData(input: [-10, -10, 5, 2], expected: 500),
		TestData(input: [40, 10, 20, 30], expected: 24000),
	]

	public var input: [Int]
	public let expected: Int
}
