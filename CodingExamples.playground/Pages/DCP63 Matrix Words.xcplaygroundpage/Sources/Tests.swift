/*:
# DCP63

This problem was asked by Microsoft.

Given a 2D matrix of characters and a target word, write a function that returns whether the word can be found in the matrix by going left-to-right, or up-to-down.

For example, given the following matrix:

[["F", "A", "C", "I"],
["O", "B", "Q", "P"],
["A", "N", "O", "B"],
["M", "A", "S", "S"]]
and the target word "FOAM", you should return true, since it's the leftmost column. Similarly, given the target word "MASS", you should return true, since it's the last row.
*/

import Foundation

public struct TestData: Testable {

	public static let tests: [TestData] = [
		TestData(input: (matrix: [], word: "TEST"), expected: false),
		TestData(input: (matrix: [["F", "A", "C", "I"],
								  ["O", "B", "Q", "P"],
								  ["A", "N", "O", "B"],
								  ["M", "A", "S", "S"]], word: "TEST"), expected: false),
		TestData(input: (matrix: [["F", "A", "C", "I"],
								  ["O", "B", "Q", "P"],
								  ["A", "N", "O", "B"],
								  ["M", "A", "S", "S"]], word: "TESTS"), expected: false),
		TestData(input: (matrix: [["F", "A", "C", "I"],
								  ["O", "B", "Q", "P"],
								  ["A", "N", "O", "B"],
								  ["M", "A", "S", "S"]], word: "MASS"), expected: true),
		TestData(input: (matrix: [["F", "A", "C", "I"],
								  ["O", "B", "Q", "P"],
								  ["A", "N", "O", "B"],
								  ["M", "A", "S", "S"]], word: "AN"), expected: true),
		TestData(input: (matrix: [["F", "A", "C", "I"],
								  ["O", "B", "Q", "P"],
								  ["A", "N", "O", "B"],
								  ["M", "A", "S", "S"]], word: "FOAM"), expected: true),
	]

	public var input: (matrix: [[Character]], word: String)
	public let expected: Bool
}
