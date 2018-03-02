/* Problem Statements

Given the String "Input", return "Expected"
*/

import Foundation

// MARK: Solution

extension String {
	func breakWords(length: Int) -> [String] {
		guard !isEmpty else { return [] }

		var breakdown: [String] = []
		var current = ""

		for word in components(separatedBy: " ") {
			guard word.count <= length else { return [] }
			guard current.count + word.count >= length else {
				current += (current.isEmpty ? "" : " ") + word
				continue
			}

			breakdown.append(current)
			current = word
		}

		if current.count > 0 {
			breakdown.append(current)
		}

		return breakdown
	}
}

// MARK: Tests

let testDate = Date()
print("Tests Started\n\n---\n")

for test in TestData.tests {
	// Arrange
	let input = test.input

	// Act
	let actual = input.text.breakWords(length: input.length)

	// Assert
	test.assert(with: actual)
}

print("---\n\nTests Ended:\n\telapsed: \(Date().timeIntervalSince(testDate))")

