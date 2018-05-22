/*: Problem Statements

Good morning! Here's your coding interview problem for today.

This problem was asked by Google.

Find the minimum number of coins required to make n cents.

You can use standard American denominations, that is, 1¢, 5¢, 10¢, and 25¢.

For example, given n = 16, return 3 since we can make it with a 10¢, a 5¢, and a 1¢.
*/

import Foundation

public struct TestData: Testable {

	public static let tests: [TestData] = [
		TestData(input: 31, expected: 3),
		TestData(input: 16, expected: 3),
		TestData(input: 18, expected: 5),
		TestData(input: 13456, expected: 540),
	]

	public var input: Int
	public let expected: Int
}
