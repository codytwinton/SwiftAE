import Foundation

public struct TestData: Testable {

	public static let tests: [TestData] = [
		TestData(input: (start: "YUL", flights: [("SFO", "HKO"), ("YYZ", "SFO"), ("YUL", "YYZ"), ("HKO", "ORD")]), expected: ["YUL", "YYZ", "SFO", "HKO", "ORD"]),
		TestData(input: (start: "COM", flights: [("SFO", "COM"), ("COM", "YYZ")]), expected: nil),
		TestData(input: (start: "A", flights: [("A", "B"), ("A", "C"), ("B", "C"), ("C", "A")]), expected: ["A", "B", "C", "A", "C"]),
		TestData(input: (start: "A", flights: [("A", "C"), ("A", "B"), ("B", "C"), ("C", "A")]), expected: ["A", "B", "C", "A", "C"])
	]

	public let input: (start: String, flights: [(origin: String, destination: String)])
	public let expected: [String]?

	public func assert(with actual: [String]?) {
		let success: Bool

		if let actual = actual, let expected = expected {
			success = actual == expected
		} else {
			success = actual == nil && expected == nil
		}

		log(success: success, actual: actual)
	}
}
