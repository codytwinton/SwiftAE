/* This problem was asked by Facebook.

Given a set of integers, return whether the set can be partitioned into two subsets whose sums are the same.

For example, given the set [15, 5, 20, 10, 35, 25, 10], it would return true, since we can split the set up into [15, 5, 10, 15, 10] and [20, 35], which both add up to 55.

Given the set [15, 5, 20, 10, 35], it would return false, since we can't split the set up into two subsets that add up to the same sum.
*/


import Foundation

public struct TestData: Testable {

	public static let tests: [TestData] = [
		TestData(input: [15, 5, 20, 10, 34], expected: false),
		TestData(input: [15, 5, 20, 10, 35], expected: false),
		TestData(input: [], expected: false),
		TestData(input: [2], expected: false),
		TestData(input: [2, 4, 6], expected: true),
		TestData(input: [6, 2, 4], expected: true),
		TestData(input: [15, 5, 20, 10, 35, 25, 10], expected: true),
	]

	public var input: [Int]
	public let expected: Bool
}
