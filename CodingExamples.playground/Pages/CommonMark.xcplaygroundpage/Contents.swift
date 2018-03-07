/* Problem Statements

Given the String "Input", return "Expected"
*/

import Foundation

var input = "### ###\n"
//var input = "# What is up\n"

let secondPattern = "^ {0,3}(#{1,6})(?:[ \t]+|$)(.*)"

let regexOptions: NSRegularExpression.Options = [.anchorsMatchLines]
let regex = try? NSRegularExpression(pattern: secondPattern, options: regexOptions)

let matchOptions: NSRegularExpression.MatchingOptions = [NSRegularExpression.MatchingOptions.anchored]
let test = regex?.firstMatch(in: input, options: matchOptions, range: NSRange(location: 0, length: input.count))

print("test \(test?.range(at: 0))")

// MARK: Solution

func handleProblem(for input: String) -> String {
	return input
}

// MARK: Tests

let testDate = Date()
print("Tests Started\n\n---\n")

for test in TestData.tests {
	// Arrange
	let input = test.input

	// Act
	let actual = handleProblem(for: input)

	// Assert
	test.assert(with: actual)
}

print("---\n\nTests Ended:\n\telapsed: \(Date().timeIntervalSince(testDate))")
