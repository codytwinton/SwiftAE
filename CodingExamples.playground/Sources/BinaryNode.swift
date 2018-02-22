import Foundation

public class BinaryNode<T>: CustomStringConvertible {
	public let value: T

	public var left: BinaryNode?
	public var right: BinaryNode?

	public var description: String {

		var leftStr = "nil"

		if let left = left {
			leftStr = "\t\(left)"
		}

		var rightStr = "nil"

		if let right = right {
			rightStr = "\t\(right)"
		}

		return "BinaryNode(value: \(value), left: \(leftStr), right: \(rightStr))"
	}

	public init(value: T) {
		self.value = value
	}
}
