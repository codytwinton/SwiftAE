/* Daily Coding Problem: Problem #2

This problem was asked by Uber.

Given an array of integers, return a new array such that each element at index i of the new array is the product of all the numbers in the original array except the one at i. Solve it without using division and in O(n) time.

For example, if our input was [1, 2, 3, 4, 5], the expected output would be [120, 60, 40, 30, 24]. If our input was [3, 2, 1], the expected output would be [2, 3, 6].
*/

import Foundation

// MARK: Solution

extension Array where Iterator.Element == Int {

	/// Returns an array of the product of all the numbers in the original array except the one at i
	public func productsExcept() -> [Int] {
		guard count >= 2 else { return self }

		var products: [Int] = []
		var productSoFar = 1

		for i in 0..<count {
			products.append(productSoFar)
			productSoFar *= self[i]
		}

		productSoFar = 1

		for i in (0..<count).reversed() {
			products[i] *= productSoFar
			productSoFar *= self[i]
		}

		return products
	}
}

// MARK: Tests

let testDate = Date()
print("Tests Started\n\n---\n")

for test in TestData.tests {
	// Arrange
	let input = test.input

	// Act
	let actual = input.productsExcept()

	// Assert
	test.assert(with: actual)
}

print("---\n\nTests Ended:\n\telapsed: \(Date().timeIntervalSince(testDate))")
