/* This problem was asked by Facebook.

There is an N by M matrix of zeroes. Given N and M, write a function to count the number of ways of starting at the top-left corner and getting to the bottom-right corner. You can only move right or down.

For example, given a 2 by 2 matrix, you should return 2, since there are two ways to get to the bottom-right:

* Right, then down
* Down, then right

Given a 5 by 5 matrix, there are 70 ways to get to the bottom-right.
*/


import Foundation

public struct TestData: Testable {

	public static let tests: [TestData] = [
		TestData(input: (n: 1, m: 1), expected: 0),
		TestData(input: (n: 1, m: 2), expected: 1),
		TestData(input: (n: 2, m: 2), expected: 2),
		TestData(input: (n: 3, m: 3), expected: 6),
		TestData(input: (n: 5, m: 5), expected: 70),
		TestData(input: (n: 10, m: 10), expected: 48620),
	]

	public var input: (n: Int, m: Int)
	public let expected: Int
}
