/*: Problem Statements

Given the String "Input", return "Expected"
*/

import Foundation

// MARK: Solution

extension String {
	var hasPalindrome: Bool {
		var set: Set<Character> = []
		
		for c in self {
			switch set.contains(c) {
			case true:
				set.remove(c)
			case false:
				set.insert(c)
			}
		}
		
		return set.count < 2
	}
}

// MARK: Tests

let testDate = Date()
print("Tests Started\n\n---\n")

for test in TestData.tests {
	// Arrange
	let input = test.input
	
	// Act
	let actual = input.hasPalindrome
	
	// Assert
	test.assert(with: actual)
}

print("---\n\nTests Ended:\n\telapsed: \(Date().timeIntervalSince(testDate))")
