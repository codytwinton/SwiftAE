//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


// Array index is position
// Array value is time

public func solution(_ A : inout [Int], _ D : Int) -> Int {

	var actualJumpTime = -1
	var minimumJumpsNeeded = Int(ceilf((Float(A.count) + 1)/Float(D)))

	var rockAtPosition: [Bool] = []

	var possibleJumptime = 0

	for (position, time) in A.enumerated() {
		possibleJumptime = time
		rockAtPosition.append(time > -1)
	}

	return actualJumpTime
}



//position 2 at time zero
var firstArray: [Int] = [1, -1, 0, 2, 3, 5] // return 2
var secondArray: [Int] = [3, 2, 1] // return 3
var thirdArray: [Int] = [1, 2, 3, 4, -1, -1, -1] // return -1

let distances: [Int] = [3, 1, 3]

for (index, var array) in [firstArray, secondArray, thirdArray].enumerated() {
	let distance = distances[index]
	print("\(solution(&array, distance))")
}