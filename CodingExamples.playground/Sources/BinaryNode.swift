import Foundation

public class BinaryNode<T>: CustomStringConvertible {
	public let value: T
	public var left: BinaryNode?
	public var right: BinaryNode?

	public var description: String {
		var leftStr = "nil"
		if let left = left { leftStr = "\(left)" }

		var rightStr = "nil"
		if let right = right { rightStr = "\(right)" }

		return "\(value), \(leftStr), \(rightStr)"
	}

	public init(value: T) {
		self.value = value
	}
}
