/* This problem was asked by Amazon.

Given an array of numbers, find the maximum sum of any contiguous subarray of the array.

For example, given the array [34, -50, 42, 14, -5, 86], the maximum sum would be 137, since we would take elements 42, 14, -5, and 86.

Given the array [-5, -1, -8, -9], the maximum sum would be 0, since we would not take any elements.

Do this in O(N) time.
*/

import Foundation

public struct TestData: Testable {

	public static let tests: [TestData] = [
		//TestData(input: [], expected: 0),
		//TestData(input: [-1], expected: 0),
		//TestData(input: [1], expected: 1),
		TestData(input: [34, -50, 42, 14, -5, 86, -120], expected: 137),
		TestData(input: [50, -60, 50], expected: 50),
		//TestData(input: [-5, -1, -8, -9], expected: 0),
	]

	public var input: [Int]
	public let expected: Int
}
