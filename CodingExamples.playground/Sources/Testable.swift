import Foundation

public protocol Testable {
	associatedtype Input
	associatedtype Expected

	/// The input value to use for testing
	var input: Input { get }

	/// The expected output for testing
	var expected: Expected { get }

	/// Compares the expected output with the actual output and logs the result
	func assert(with actual: Expected)
}

public extension Testable {

	/// Logs the comparison of the expected output with the actual output
	func log(success: Bool, actual: Expected) {
		print("""
			\(success ? "Passed" : "Failed") Test:
				input:		\(input)
				expected:	\(expected)
				actual:		\(actual)

			""")
	}
}

public extension Testable where Expected: Equatable {

	/// Compares the expected output with the actual output and logs the result
	func assert(with actual: Expected) {
		log(success: actual == expected, actual: actual)
	}
}
