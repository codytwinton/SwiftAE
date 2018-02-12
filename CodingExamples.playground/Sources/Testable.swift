import Foundation

public protocol Testable {
	associatedtype Input
	associatedtype Expected

	var input: Input { get }
	var expected: Expected { get }

	func assert(with actual: Expected)
}

public extension Testable {

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

	func assert(with actual: Expected) {
		log(success: actual == expected, actual: actual)
	}
}
