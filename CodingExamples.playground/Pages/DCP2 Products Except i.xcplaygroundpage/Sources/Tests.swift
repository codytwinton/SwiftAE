import Foundation

public struct TestData: Testable {

	public static let tests: [TestData] = [
		TestData(input: [], expected: []),
		TestData(input: [0], expected: [0]),
		TestData(input: [0, 1], expected: [1, 0]),
		TestData(input: [1, 2, 3, 4, 5], expected: [120, 60, 40, 30, 24]),
		TestData(input: [3, 2, 1], expected: [2, 3, 6]),
		//TestData(input: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20], expected: [2432902008176640000, 1216451004088320000, 810967336058880000, 608225502044160000, 486580401635328000, 405483668029440000, 347557429739520000, 304112751022080000, 270322445352960000, 243290200817664000, 221172909834240000, 202741834014720000, 187146308321280000, 173778714869760000, 162193467211776000, 152056375511040000, 143111882833920000, 135161222676480000, 128047474114560000, 121645100408832000]),
	]

	public let input: [Int]
	public let expected: [Int]

	public func assert(with actual: [Int]) {
		self.log(success: actual == expected, actual: actual)
	}
}
