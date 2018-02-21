import Foundation

public class BinaryNode: CustomStringConvertible {
	public let value: Int

	public var left: BinaryNode?
	public var right: BinaryNode?

	public var description: String {
		return "BinaryNode: \(value)"
	}

	public init(value: Int) {
		self.value = value
	}
}
