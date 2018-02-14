import Foundation

// MARK Equilibrium
/*
public func equilibriumIndex(_ A : inout [Int]) -> Int {

var rightSum = A.reduce(0, +)
var leftSum = 0

for (index, element) in A.enumerated() {
rightSum -= element
guard rightSum != leftSum else { return index }
leftSum += element
}

return -1
}

public func allEquilibriumIndexs(_ A : inout [Int]) -> [Int] {

var all: [Int] = []

var rightSum = A.reduce(0, +)
var leftSum = 0

for (index, element) in A.enumerated() {
rightSum -= element

if rightSum == leftSum {
all.append(index)
}

leftSum += element
}

return all
}

var test0 = [-1, 3, -4, 5, 1, -6, 2, 1]
var test1 = [-7, 1, 5, 2, -4, 3, 0]
var test2 = [-156, 138, -2, -156, 138, -156, -2]

for var test in [test0, test1, test2] {
print("solution \(equilibriumIndex(&test))")
print("allSolutions \(allEquilibriumIndexs(&test))")
}
*/

// MARK: Contains

/*
public func solutionContains(_ A : inout [Int]) -> Int {

var lowest = 1

if !A.contains(lowest) { return lowest }

for i in 1..<A.count {
if A.contains(i) {
lowest += 1
continue
}

return lowest
}

lowest += 1
return lowest
}


var ints1: [Int] =  [1, 3, 6, 4, 1, 2] // should return 5
var ints2: [Int] = [1, 2, 3] // should return 4
var ints3: [Int] = [-1, -3] // should return 1
var ints4: [Int] = [1] // should return 2
var ints5: [Int] = [-1] // should return 1

for (index, var ints) in [ints1, ints2, ints3, ints4, ints5].enumerated() {
print("\(index) \(solutionContains(&ints))")
}
*/
/*
public func numbersWithDigitInside(_ x: Int64, _ d: Int64) -> [Int64] {

var numbers: [Int64] = []

for i in 1..<x + 1 {
guard "\(i)".contains("\(d)") else { continue }
numbers.append(i)
}

guard !numbers.isEmpty else { return [0, 0, 0] }

return [Int64(numbers.count), numbers.reduce(0, +), numbers.reduce(1, *)]
}


numbersWithDigitInside(5,6)
numbersWithDigitInside(7,6)
numbersWithDigitInside(11,1)
numbersWithDigitInside(20,0)
numbersWithDigitInside(44,4)
*/


func incorrectPasscodeAttempts(passcode: String, attempts: [String]) -> Bool {
	guard attempts.count > 9 else { return false }

	var attempts = attempts
	var foundIndexes: [Int] = []

	var complete = false

	while !complete {
		switch attempts.index(of: passcode) {
		case let index?:
			foundIndexes.append(index)
			attempts[index] = "found"
		case nil:
			complete = true
		}
	}

	guard !foundIndexes.isEmpty else { return true }

	var previous = 0

	for index in foundIndexes {
		print("index \(index) \(previous)")
		if index - previous >= 10 {
			return true
		}

		previous = index
	}

	if attempts.count >= previous + 10 {
		return true
	}

	return false
}

incorrectPasscodeAttempts(passcode: "1111", attempts: ["1111", "4444", "9999", "3333", "8888", "2222", "7777", "0000", "6666", "7285", "5555", "1111"])
incorrectPasscodeAttempts(passcode: "1234", attempts: ["9999", "9999", "9999", "9999", "9999", "9999", "9999", "9999", "9999", "9999", "9999", "9999"])
incorrectPasscodeAttempts(passcode: "1112", attempts: ["1112", "1111", "1111", "1111", "1111",  "1111",  "1111",  "1111",  "1111",  "1111",  "1111"])
