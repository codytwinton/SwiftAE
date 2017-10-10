import Foundation

// you can write to stdout for debugging purposes, e.g.
// print("this is a debug message")


func arrayIsSorted(_ array: [Int]) -> Bool {
	for i in 1..<array.count {
		if array[i-1] > array[i] { return false }
	}
	return true
}




public func solution(_ A : inout [Int]) -> Bool {
	guard !arrayIsSorted(A) else { return true }

	var largest: (index: Int, value: Int) = (0, 0)
	var smallerFound: Bool = false

	for (index, value) in A.enumerated() {

		if value > largest.value {
			switch smallerFound {
			case true:
				swap(&A[largest.index], &A[index - 1])
				return arrayIsSorted(A)

			case false:
				largest = (index, value)
			}
		}

		else if value < largest.value {
			smallerFound = true
		}
	}

	return false
}

var first = [1, 5, 3, 3, 7] // swap 1 with 3 return true
var second = [1, 3, 5, 3, 4] // return false
var third = [1, 3, 5] // return true
var fourth = [1, 5, 3, 3, 3, 3, 3, 3, 7] // swap 1 with 7 return true
var fifth = [1] // return ture
var large = [0, 2, 1, 3, 1, 0, 6, 7, 8, 9, 10, 10, 1, 100000, 1022347, 21394, 2394, 12037, 12907, 123, 457, 32523, 567, 13434, 20947] // return false


for (index, var array) in [first, second, third, fourth, fifth, large].enumerated() {
	print("\(index) solution: \(solution(&array))\n")
}